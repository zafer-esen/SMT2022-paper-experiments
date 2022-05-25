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

(declare-datatypes ((HeapObject 0) (_S 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O__S (get_S _S)) (defObj))
                   ((_S (n Int)))))
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
(declare-fun inv_main13 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main9 (Heap AddrRange Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var4 (O__S (_S 0)) 100000) (and (and (= var3 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000)) true) (= var2 100)))) (inv_main4 var4 var3 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (= var3 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000)) true) (= var2 100))) (batchAllocHeap emptyHeap emptyHeap (O__S (_S 0)) 100000 100000))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main4 var5 var4 var3 var2 var1) (= var0 0))) (inv_main9 var5 var4 var0 var1 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main9 var12 var11 var10 var9 var8) (= var0 (+ var3 1))) (= var1 (+ var3 1))) (= var2 (+ var7 1))) (= var3 var8)) (= var4 var9)) (= var7 var10)) (= var5 var11)) (= var6 (writeHeap var12 (nthAddrRange var11 var10) (O__S (_S var8))))) (is-O__S (readHeap var12 (nthAddrRange var11 var10)))) (is-O__S (readHeap var12 (nthAddrRange var11 var10)))) (<= 0 (+ (+ (* (- 1) (+ var7 1)) 100000) (* (- 1) 1))))) (inv_main9 var6 var5 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (and (and (inv_main13 var5 var4 var3 var2 var1) (= var0 (+ var3 1))) (is-O__S (readHeap var5 (nthAddrRange var4 var3)))) (<= 0 (+ (+ (* (- 1) (+ var3 1)) 100000) (* (- 1) 1))))) (inv_main13 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main9 var11 var10 var9 var8 var7) (= var0 (+ var2 1))) (= var1 0)) (= var2 var7)) (= var3 var8)) (= var6 var9)) (= var4 var10)) (= var5 (writeHeap var11 (nthAddrRange var10 var9) (O__S (_S var7))))) (is-O__S (readHeap var11 (nthAddrRange var10 var9)))) (is-O__S (readHeap var11 (nthAddrRange var10 var9)))) (not (<= 0 (+ (+ (* (- 1) (+ var6 1)) 100000) (* (- 1) 1)))))) (inv_main13 var5 var4 var1 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main9 var4 var3 var2 var1 var0) (not (is-O__S (readHeap var4 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main9 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var2)))) (is-O__S (readHeap var4 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main9 var4 var3 var2 var1 var0) (not (is-O__S (readHeap var4 (nthAddrRange var3 var2))))) (is-O__S (readHeap var4 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O__S (readHeap var4 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O__S (readHeap var4 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main13 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var2)))) (is-O__S (readHeap var4 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main13 var4 var3 var2 var1 var0) (not (<= 0 (+ (n (get_S (readHeap var4 (nthAddrRange var3 var2)))) (* (- 1) 100))))) (is-O__S (readHeap var4 (nthAddrRange var3 var2)))))))
(check-sat)
