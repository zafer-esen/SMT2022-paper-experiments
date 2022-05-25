(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
;===============================================================================
; Encoding of Heap sorts and operations
;-------------------------------------------------------------------------------
(define-sort Addr() Int)
(declare-datatypes ((AddrRange 0))
                   (((AddrRange (AddrRangeStart Addr) (AddrRangeSize Int)))))

(declare-datatypes ((HeapObject 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (defObj))))
(declare-datatypes ((BatchAllocResHeap 0) (AllocResHeap 0) (Heap 0))
                   (((BatchAllocResHeap   (newBatchHeap Heap) (newAddrRange AddrRange)))
                   ((AllocResHeap   (newHeap Heap) (newAddr Addr)))
                    ((HeapCtor (HeapSize Int)
                               (HeapContents (Array Addr HeapObject))))))
(define-fun nullAddr  () Addr 0)
(define-fun validHeap     ((h Heap) (p Addr)) Bool
  (and (>= (HeapSize h) p) (> p 0)))
(define-fun emptyHeap () Heap (
  HeapCtor 0 (( as const (Array Addr HeapObject)) defObj)))
(define-fun readHeap ((h Heap) (p Addr)) HeapObject
  (ite (validHeap h p)
       (select (HeapContents h) p)
       defObj))
(define-fun writeHeap ((h Heap) (p Addr) (o HeapObject)) Heap
  (ite (validHeap h p)
       (HeapCtor (HeapSize h) (store (HeapContents h) p o))
       h))
(define-fun allocHeap   ((h Heap) (o HeapObject)) AllocResHeap
  (AllocResHeap (HeapCtor (+ 1 (HeapSize h))
                    (store (HeapContents h) (+ 1 (HeapSize h)) o))
          (+ 1 (HeapSize h))))
(define-fun Heap-eq     ((h1 Heap) (h2 Heap)) Bool
  (forall ((p Addr))
          (and (= (validHeap h1 p) (validHeap h2 p))
               (= (readHeap h1 p) (readHeap h2 p)))))
(define-fun nthAddrRange((ar AddrRange) (n Int)) Addr
  (ite (and (>= n 0) (< n (AddrRangeSize ar)))
       (+ (AddrRangeStart ar) n)
       nullAddr))
(define-fun withinHeap ((ar AddrRange ) (p Addr)) Bool
  (and (>= p (AddrRangeStart ar)) (< p (+ (AddrRangeStart ar) (AddrRangeSize ar)))))

(declare-fun batchAllocHeap     (Heap Heap HeapObject Int Int) Bool)
(declare-fun batchAllocPostHeap (Heap Heap HeapObject Int) Bool)

(assert (forall ((h1 Heap) (h2 Heap) (o HeapObject) (n1 Int) (n2 Int))
                (=> (and (> n2 0) (batchAllocHeap h1 h2 o n1 n2))
                   (batchAllocHeap h1 (newHeap (allocHeap h2 o)) o n1 (- n2 1)))))
(assert (forall ((h1 Heap) (h2 Heap) (o HeapObject) (n1 Int) (n2 Int))
                (=> (and (<= n2 0) (batchAllocHeap h1 h2 o n1 n2))
                   (batchAllocPostHeap h1 h2 o n1))))

(declare-fun batchWriteHeap     (Heap Heap Addr Addr HeapObject Int Int) Bool)
(declare-fun batchWritePostHeap (Heap Heap Addr HeapObject Int) Bool)

(assert (forall ((h1 Heap) (h2 Heap) (a1 Addr) (a2 Addr) (o HeapObject) (n1 Int) (n2 Int))
                (=> (and (> n2 0) (batchWriteHeap h1 h2 a1 a2 o n1 n2))
                   (batchWriteHeap h1 (writeHeap h2 a2 o) a1 (+ a2 1) o n1 (- n2 1)))))
(assert (forall ((h1 Heap) (h2 Heap) (a1 Addr) (a2 Addr) (o HeapObject) (n1 Int) (n2 Int))
                (=> (and (<= n2 0) (batchWriteHeap h1 h2 a1 a2 o n1 n2))
                   (batchWritePostHeap h1 h2 a1 o n1))))

;===============================================================================
(declare-fun inv_main16 (Heap Int Int Int AddrRange) Bool)
(declare-fun inv_main19 (Heap Int Int Int AddrRange) Bool)
(declare-fun inv_main2 (Heap Int Int) Bool)
(declare-fun inv_main21 (Heap Int Int Int AddrRange) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var1 0) (= var2 emptyHeap)) (= var0 100000))) (inv_main2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (and (and (inv_main21 var5 var4 var3 var2 var1) (= var0 (+ var2 1))) (is-O_Int (readHeap var5 (nthAddrRange var1 var2)))) (<= 0 (+ (+ (* (- 1) (+ var2 1)) var4) (* (- 1) 1))))) (inv_main21 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main19 var10 var9 var8 var7 var6) (= var0 0)) (= var1 var6)) (= var4 var7)) (= var2 var8)) (= var5 var9)) (= var3 (writeHeap var10 (nthAddrRange var6 (+ var7 1)) (O_Int (+ var7 1))))) (is-O_Int (readHeap var10 (nthAddrRange var6 (+ var7 1))))) (is-O_Int (readHeap var10 (nthAddrRange var6 (+ var7 1))))) (not (<= 0 (+ var4 (* (- 1) 1))))) (<= 0 (+ var5 (* (- 1) 1))))) (inv_main21 var3 var5 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Heap) (var12 Heap) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (batchAllocPostHeap var11 var12 (O_Int var10) var9) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var16 var15 var14) (= var0 0)) (or (and (<= 0 (+ (+ (* (- 1) var2) var14) (* (- 1) 1))) (= var3 1)) (and (not (<= 0 (+ (+ (* (- 1) var2) var14) (* (- 1) 1)))) (= var3 0)))) (= var5 var1)) (= var7 var14)) (= var9 var2)) (= var11 var16)) (<= 0 (+ (+ (* (- 1) 1) var2) (* (- 1) 1)))) (not (= var3 0))) (= var4 (AddrRange (ite (<= 0 (+ var9 (- 1))) (+ (HeapSize var11) 1) (HeapSize var11)) var9))) (= var6 var5)) (= var8 var7)) (= var13 var9)) true) (not (<= 0 (+ var13 (* (- 1) 2))))) (<= 0 (+ var13 (* (- 1) 1)))))) (inv_main21 var12 var13 var8 var0 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Heap) (var12 Heap) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var16 var15 var14) (= var0 0)) (or (and (<= 0 (+ (+ (* (- 1) var2) var14) (* (- 1) 1))) (= var3 1)) (and (not (<= 0 (+ (+ (* (- 1) var2) var14) (* (- 1) 1)))) (= var3 0)))) (= var5 var1)) (= var7 var14)) (= var9 var2)) (= var11 var16)) (<= 0 (+ (+ (* (- 1) 1) var2) (* (- 1) 1)))) (not (= var3 0))) (= var4 (AddrRange (ite (<= 0 (+ var9 (- 1))) (+ (HeapSize var11) 1) (HeapSize var11)) var9))) (= var6 var5)) (= var8 var7)) (= var13 var9)) true) (not (<= 0 (+ var13 (* (- 1) 2))))) (<= 0 (+ var13 (* (- 1) 1))))) (batchAllocHeap var11 var11 (O_Int var10) var9 var9))))
(assert (forall ((var0 Heap) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (and (and (inv_main16 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 (nthAddrRange var1 var2) (O_Int var2)))) (is-O_Int (readHeap var5 (nthAddrRange var1 var2)))) (is-O_Int (readHeap var5 (nthAddrRange var1 var2))))) (inv_main19 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main19 var10 var9 var8 var7 var6) (= var0 (+ var5 (* (- 1) 1)))) (= var1 var6)) (= var5 var7)) (= var2 var8)) (= var3 var9)) (= var4 (writeHeap var10 (nthAddrRange var6 (+ var7 1)) (O_Int (+ var7 1))))) (is-O_Int (readHeap var10 (nthAddrRange var6 (+ var7 1))))) (is-O_Int (readHeap var10 (nthAddrRange var6 (+ var7 1))))) (<= 0 (+ var5 (* (- 1) 1))))) (inv_main16 var4 var3 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Heap) (var12 Heap) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (batchAllocPostHeap var11 var12 (O_Int var10) var9) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var16 var15 var14) (= var0 (+ var13 (* (- 1) 2)))) (or (and (<= 0 (+ (+ (* (- 1) var2) var14) (* (- 1) 1))) (= var3 1)) (and (not (<= 0 (+ (+ (* (- 1) var2) var14) (* (- 1) 1)))) (= var3 0)))) (= var5 var1)) (= var7 var14)) (= var9 var2)) (= var11 var16)) (<= 0 (+ (+ (* (- 1) 1) var2) (* (- 1) 1)))) (not (= var3 0))) (= var4 (AddrRange (ite (<= 0 (+ var9 (- 1))) (+ (HeapSize var11) 1) (HeapSize var11)) var9))) (= var6 var5)) (= var8 var7)) (= var13 var9)) true) (<= 0 (+ var13 (* (- 1) 2)))))) (inv_main16 var12 var13 var8 var0 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Heap) (var12 Heap) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var16 var15 var14) (= var0 (+ var13 (* (- 1) 2)))) (or (and (<= 0 (+ (+ (* (- 1) var2) var14) (* (- 1) 1))) (= var3 1)) (and (not (<= 0 (+ (+ (* (- 1) var2) var14) (* (- 1) 1)))) (= var3 0)))) (= var5 var1)) (= var7 var14)) (= var9 var2)) (= var11 var16)) (<= 0 (+ (+ (* (- 1) 1) var2) (* (- 1) 1)))) (not (= var3 0))) (= var4 (AddrRange (ite (<= 0 (+ var9 (- 1))) (+ (HeapSize var11) 1) (HeapSize var11)) var9))) (= var6 var5)) (= var8 var7)) (= var13 var9)) true) (<= 0 (+ var13 (* (- 1) 2))))) (batchAllocHeap var11 var11 (O_Int var10) var9 var9))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main16 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main16 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 var1)))) (is-O_Int (readHeap var4 (nthAddrRange var0 var1)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main16 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 var1))))) (is-O_Int (readHeap var4 (nthAddrRange var0 var1)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 (+ var1 1)))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main19 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 (+ var1 1))))) (is-O_Int (readHeap var4 (nthAddrRange var0 (+ var1 1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main19 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 (+ var1 1)))))) (is-O_Int (readHeap var4 (nthAddrRange var0 (+ var1 1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main21 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main21 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 var1)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main21 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main21 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 var1)))) (is-O_Int (readHeap var4 (nthAddrRange var0 var1)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main21 var4 var3 var2 var1 var0) (not (<= 0 (+ (getInt (readHeap var4 (nthAddrRange var0 var1))) (* (- 1) var1))))) (is-O_Int (readHeap var4 (nthAddrRange var0 var1)))))))
(check-sat)
