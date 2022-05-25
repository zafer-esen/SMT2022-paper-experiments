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

(declare-datatypes ((HeapObject 0) (S 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_S (getS S)) (defObj))
                   ((S (n Int)))))
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
(declare-fun inv_main12 (Heap AddrRange Int) Bool)
(declare-fun inv_main15 (Heap AddrRange Int) Bool)
(declare-fun inv_main3 (Heap AddrRange Int) Bool)
(declare-fun inv_main5 (Heap AddrRange Int) Bool)
(declare-fun inv_main8 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var2 (O_S (S 0)) 1000000) (and true (= var1 (AddrRange (ite (<= 0 999999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 1000000))))) (inv_main3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and true (= var1 (AddrRange (ite (<= 0 999999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 1000000)))) (batchAllocHeap emptyHeap emptyHeap (O_S (S 0)) 1000000 1000000))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int)) (or (not (and (and (inv_main5 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var0) 1000000) (* (- 1) 1)))) (not (or (not (and (and (<= 0 (+ (+ (* 1 (+ 1000000 (* (- 2) var3))) 2) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) (+ 1000000 (* (- 2) var3))) 2) (* (- 1) 1)))) (not (<= 0 (+ (* (- 1) (+ 1000000 (* (- 2) var3))) (* (- 1) 1)))))) (<= 0 (+ (+ (* (- 1) var3) var0) (* (- 1) 1))))))) (inv_main8 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (and (inv_main5 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var1) 1000000) (* (- 1) 1)))))) (inv_main12 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int)) (or (not (and (and (and (and (and (and (inv_main5 var3 var2 var1) (= var0 0)) (<= 0 (+ (+ (* (- 1) var1) 1000000) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) var4) var1) (* (- 1) 1)))) (not (<= 0 (+ (* (- 1) (+ 1000000 (* (- 2) var4))) (* (- 1) 1))))) (<= 0 (+ (+ (* 1 (+ 1000000 (* (- 2) var4))) 2) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) (+ 1000000 (* (- 2) var4))) 2) (* (- 1) 1))))) (inv_main12 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (and (inv_main15 var3 var2 var1) (= var0 (+ var1 1))) (is-O_S (readHeap var3 (nthAddrRange var2 var1))))) (inv_main12 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int)) (or (not (and (and (and (inv_main12 var3 var2 var1) (= var0 (+ var1 1))) (<= 0 (+ (+ (* (- 1) var1) 1000000) (* (- 1) 1)))) (not (or (not (and (and (<= 0 (+ (+ (* 1 (+ 1000000 (* (- 2) var4))) 2) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) (+ 1000000 (* (- 2) var4))) 2) (* (- 1) 1)))) (not (<= 0 (+ (* (- 1) (+ 1000000 (* (- 2) var4))) (* (- 1) 1)))))) (<= 0 (+ var4 (* (- 1) var1))))))) (inv_main12 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int)) (or (not (and (and (and (and (and (inv_main12 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var0) 1000000) (* (- 1) 1)))) (<= 0 (+ var3 (* (- 1) var0)))) (not (<= 0 (+ (* (- 1) (+ 1000000 (* (- 2) var3))) (* (- 1) 1))))) (<= 0 (+ (+ (* 1 (+ 1000000 (* (- 2) var3))) 2) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) (+ 1000000 (* (- 2) var3))) 2) (* (- 1) 1))))) (inv_main15 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main3 var3 var2 var1) (= var0 0))) (inv_main5 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main8 var6 var5 var4) (= var0 (+ var1 1))) (= var1 var4)) (= var2 var5)) (= var3 (writeHeap var6 (nthAddrRange var5 var4) (O_S (S 10))))) (is-O_S (readHeap var6 (nthAddrRange var5 var4)))) (is-O_S (readHeap var6 (nthAddrRange var5 var4))))) (inv_main5 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (not (is-O_S (readHeap var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (and (inv_main8 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))) (is-O_S (readHeap var2 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (and (inv_main8 var2 var1 var0) (not (is-O_S (readHeap var2 (nthAddrRange var1 var0))))) (is-O_S (readHeap var2 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main15 var2 var1 var0) (not (is-O_S (readHeap var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main15 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main15 var2 var1 var0) (not (is-O_S (readHeap var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (and (inv_main15 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))) (is-O_S (readHeap var2 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (and (inv_main15 var2 var1 var0) (not (= (n (getS (readHeap var2 (nthAddrRange var1 var0)))) 10))) (is-O_S (readHeap var2 (nthAddrRange var1 var0)))))))
(check-sat)
