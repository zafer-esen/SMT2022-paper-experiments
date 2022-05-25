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
(declare-fun inv_main18 (Heap Int Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main2 (Heap Int Int) Bool)
(declare-fun inv_main22 (Heap Int Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main23 (Heap Int Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main26 (Heap Int Int Int AddrRange Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var1 100000) (= var2 emptyHeap)) (= var0 0))) (inv_main2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ var4 1))) (<= 0 var4))) (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main22 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var5 (* (- 1) 1)))) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 var15)) (= var8 (writeHeap var16 (nthAddrRange var12 (+ var13 1)) (O_Int var11)))) (is-O_Int (readHeap var16 (nthAddrRange var12 (+ var13 1))))) (is-O_Int (readHeap var16 (nthAddrRange var12 (+ var13 1)))))) (inv_main18 var8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 Heap) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (batchAllocPostHeap var14 var15 (O_Int var13) var12) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var18 var17 var16) (= var0 2)) (= var1 7)) (= var2 3)) (= var3 (+ var9 (* (- 1) 2)))) (or (and (<= 0 (+ (+ (* (- 1) var4) var17) (* (- 1) 1))) (= var5 1)) (and (not (<= 0 (+ (+ (* (- 1) var4) var17) (* (- 1) 1)))) (= var5 0)))) (= var12 var4)) (= var10 var17)) (= var14 var18)) (<= 0 (+ (+ (* (- 1) 1) var4) (* (- 1) 1)))) (not (= var5 0))) (= var6 (AddrRange (ite (<= 0 (+ var12 (- 1))) (+ (HeapSize var14) 1) (HeapSize var14)) var12))) (= var8 var7)) (= var9 var12)) (= var11 var10)) true))) (inv_main18 var15 var11 var9 var3 var6 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 Heap) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var18 var17 var16) (= var0 2)) (= var1 7)) (= var2 3)) (= var3 (+ var9 (* (- 1) 2)))) (or (and (<= 0 (+ (+ (* (- 1) var4) var17) (* (- 1) 1))) (= var5 1)) (and (not (<= 0 (+ (+ (* (- 1) var4) var17) (* (- 1) 1)))) (= var5 0)))) (= var12 var4)) (= var10 var17)) (= var14 var18)) (<= 0 (+ (+ (* (- 1) 1) var4) (* (- 1) 1)))) (not (= var5 0))) (= var6 (AddrRange (ite (<= 0 (+ var12 (- 1))) (+ (HeapSize var14) 1) (HeapSize var14)) var12))) (= var8 var7)) (= var9 var12)) (= var11 var10)) true)) (batchAllocHeap var14 var14 (O_Int var13) var12 var12))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (and (and (inv_main18 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ var5 1)))) (<= 0 (+ var6 (* (- 1) 1))))) (inv_main26 var8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (and (and (inv_main26 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var5 1))) (is-O_Int (readHeap var8 (nthAddrRange var4 var5)))) (<= 0 (+ (+ (* (- 1) (+ var5 1)) var6) (* (- 1) 1))))) (inv_main26 var8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (and (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var8 (nthAddrRange var4 var5) (O_Int var2)))) (is-O_Int (readHeap var8 (nthAddrRange var4 var5)))) (is-O_Int (readHeap var8 (nthAddrRange var4 var5))))) (inv_main22 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ var4 1))) (not (<= 0 var4)))) (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var3 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var4)))) (is-O_Int (readHeap var7 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var3 var4))))) (is-O_Int (readHeap var7 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var3 (+ var4 1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 (+ var4 1))))) (is-O_Int (readHeap var7 (nthAddrRange var3 (+ var4 1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var3 (+ var4 1)))))) (is-O_Int (readHeap var7 (nthAddrRange var3 (+ var4 1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main26 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var3 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main26 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main26 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var3 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main26 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var4)))) (is-O_Int (readHeap var7 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main26 var7 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (getInt (readHeap var7 (nthAddrRange var3 var4))) (* (- 1) var0))))) (is-O_Int (readHeap var7 (nthAddrRange var3 var4)))))))
(check-sat)