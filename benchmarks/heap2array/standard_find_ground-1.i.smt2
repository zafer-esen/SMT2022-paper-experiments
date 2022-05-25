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
(declare-fun inv_main12 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main20 (Heap AddrRange Int Int Int Int) Bool)
(declare-fun inv_main3 (Heap AddrRange) Bool)
(declare-fun inv_main8 (Heap AddrRange Int Int Int) Bool)
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var2 (O_Int var1) 100000) (and (and true (= var3 emptyHeap)) (= var0 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))))) (inv_main3 var2 var0))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 Heap)) (or (not (and (and true (= var3 emptyHeap)) (= var0 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000)))) (batchAllocHeap emptyHeap emptyHeap (O_Int var1) 100000 100000))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (and (and (inv_main20 var6 var5 var4 var3 var2 var1) (= var0 (+ var1 1))) (is-O_Int (readHeap var6 (nthAddrRange var5 var1)))) (<= 0 (+ (+ (* (- 1) (+ var1 1)) var3) (* (- 1) 1))))) (inv_main20 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (and (and (inv_main8 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var2) 100000) (* (- 1) 1))))) (<= 0 (+ var2 (* (- 1) 1))))) (inv_main20 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main8 var17 var16 var15 var14 var13) (= var0 0)) (or (and (not (= var5 var8)) (= var11 1)) (and (= var5 var8) (= var11 0)))) (= var1 var6)) (= var12 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (= var5 (getInt (readHeap var17 (nthAddrRange var16 var14))))) (= var6 var13)) (= var7 var14)) (= var8 var15)) (= var9 var16)) (= var10 var17)) (is-O_Int (readHeap var17 (nthAddrRange var16 var14)))) (<= 0 (+ (+ (* (- 1) var14) 100000) (* (- 1) 1)))) (= var11 0)) (<= 0 (+ var12 (* (- 1) 1))))) (inv_main20 var4 var3 var2 var12 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Heap) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main8 var17 var16 var15 var14 var13) (= var0 (+ var2 1))) (or (and (not (= var6 var9)) (= var12 1)) (and (= var6 var9) (= var12 0)))) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (= var5 var11)) (= var6 (getInt (readHeap var17 (nthAddrRange var16 var14))))) (= var7 var13)) (= var8 var14)) (= var9 var15)) (= var10 var16)) (= var11 var17)) (is-O_Int (readHeap var17 (nthAddrRange var16 var14)))) (<= 0 (+ (+ (* (- 1) var14) 100000) (* (- 1) 1)))) (not (= var12 0)))) (inv_main8 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main12 var11 var10 var9 var8 var7) (= var0 (+ var6 1))) (= var6 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var5 (writeHeap var11 (nthAddrRange var10 var7) (O_Int var4)))) (is-O_Int (readHeap var11 (nthAddrRange var10 var7)))) (is-O_Int (readHeap var11 (nthAddrRange var10 var7)))) (not (<= 0 (+ (+ (* (- 1) (+ var6 1)) 100000) (* (- 1) 1)))))) (inv_main8 var5 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main12 var11 var10 var9 var8 var7) (= var0 (+ var6 1))) (= var6 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var5 (writeHeap var11 (nthAddrRange var10 var7) (O_Int var4)))) (is-O_Int (readHeap var11 (nthAddrRange var10 var7)))) (is-O_Int (readHeap var11 (nthAddrRange var10 var7)))) (<= 0 (+ (+ (* (- 1) (+ var6 1)) 100000) (* (- 1) 1))))) (inv_main12 var5 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (inv_main3 var4 var3) (= var1 0)) (= var2 0))) (inv_main12 var4 var3 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main12 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main12 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var4 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main12 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var3 var0))))) (is-O_Int (readHeap var4 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main8 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var3 var1))))) (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (and (inv_main8 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var4 (nthAddrRange var3 var1)))) (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (inv_main20 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (inv_main20 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (inv_main20 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main20 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var0)))) (is-O_Int (readHeap var5 (nthAddrRange var4 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main20 var5 var4 var3 var2 var1 var0) (= (getInt (readHeap var5 (nthAddrRange var4 var0))) var3)) (is-O_Int (readHeap var5 (nthAddrRange var4 var0)))))))
(check-sat)
