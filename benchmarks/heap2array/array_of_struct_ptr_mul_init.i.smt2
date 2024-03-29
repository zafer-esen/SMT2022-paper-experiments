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
                   ((S (p Int) (q Int)))))
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
(declare-fun inv_main11 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main17 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main19 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main22 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main25 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main7 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main9 (Heap AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int)) (or (not (and (batchAllocPostHeap emptyHeap var2 (O_S (S 0 0)) 100000) (and (and (<= 0 var3) (= var1 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) true))) (inv_main4 var2 var1 var3 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int)) (or (not (and (and (<= 0 var3) (= var1 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) true)) (batchAllocHeap emptyHeap emptyHeap (O_S (S 0 0)) 100000 100000))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main22 var8 var7 var6 var5) (or (and (= (q (getS (readHeap var8 (nthAddrRange var7 var5)))) (* (p (getS (readHeap var8 (nthAddrRange var7 var5)))) (p (getS (readHeap var8 (nthAddrRange var7 var5)))))) (= var0 1)) (and (not (= (q (getS (readHeap var8 (nthAddrRange var7 var5)))) (* (p (getS (readHeap var8 (nthAddrRange var7 var5)))) (p (getS (readHeap var8 (nthAddrRange var7 var5))))))) (= var0 0)))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (not (= (p (getS (readHeap var8 (nthAddrRange var7 var5)))) (q (getS (readHeap var8 (nthAddrRange var7 var5))))))) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (is-O_S (readHeap var8 (nthAddrRange var7 var5))))) (inv_main25 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (and (and (inv_main22 var4 var3 var2 var1) (= var0 1)) (= (p (getS (readHeap var4 (nthAddrRange var3 var1)))) (q (getS (readHeap var4 (nthAddrRange var3 var1)))))) (is-O_S (readHeap var4 (nthAddrRange var3 var1)))) (is-O_S (readHeap var4 (nthAddrRange var3 var1))))) (inv_main25 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (and (inv_main17 var4 var3 var2 var1) (= var0 (writeHeap var4 (nthAddrRange var3 var1) (O_S (S var2 (q (getS (readHeap var4 (nthAddrRange var3 var1))))))))) (is-O_S (readHeap var4 (nthAddrRange var3 var1)))) (is-O_S (readHeap var4 (nthAddrRange var3 var1))))) (inv_main19 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (and (and (inv_main11 var5 var4 var3 var2) (<= 0 (+ (+ (* (- 1) var2) 100000) (* (- 1) 1)))) (not (= var0 0))) (<= 0 var1))) (inv_main17 var5 var4 var1 var2))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (and (inv_main7 var4 var3 var2 var1) (= var0 (writeHeap var4 (nthAddrRange var3 var1) (O_S (S var1 (q (getS (readHeap var4 (nthAddrRange var3 var1))))))))) (is-O_S (readHeap var4 (nthAddrRange var3 var1)))) (is-O_S (readHeap var4 (nthAddrRange var3 var1))))) (inv_main9 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (inv_main11 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1)))))) (inv_main22 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (and (inv_main25 var5 var4 var3 var2 var1) (= var0 (+ var2 1))) (<= 0 (+ (+ (* (- 1) (+ var2 1)) 100000) (* (- 1) 1))))) (inv_main22 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main4 var4 var3 var2 var1) (= var0 0))) (inv_main7 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main9 var8 var7 var6 var5) (= var0 (+ var4 1))) (= var4 var5)) (= var1 var6)) (= var2 var7)) (= var3 (writeHeap var8 (nthAddrRange var7 var5) (O_S (S (p (getS (readHeap var8 (nthAddrRange var7 var5)))) var5))))) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (<= 0 (+ (+ (* (- 1) (+ var4 1)) 100000) (* (- 1) 1))))) (inv_main7 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main9 var8 var7 var6 var5) (= var0 0)) (= var4 var5)) (= var1 var6)) (= var2 var7)) (= var3 (writeHeap var8 (nthAddrRange var7 var5) (O_S (S (p (getS (readHeap var8 (nthAddrRange var7 var5)))) var5))))) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (not (<= 0 (+ (+ (* (- 1) (+ var4 1)) 100000) (* (- 1) 1)))))) (inv_main11 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main19 var8 var7 var6 var5) (= var0 (+ var1 1))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 (writeHeap var8 (nthAddrRange var7 var5) (O_S (S (p (getS (readHeap var8 (nthAddrRange var7 var5)))) (* var6 var6)))))) (is-O_S (readHeap var8 (nthAddrRange var7 var5)))) (is-O_S (readHeap var8 (nthAddrRange var7 var5))))) (inv_main11 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (and (and (inv_main11 var5 var4 var3 var2) (= var0 (+ var2 1))) (<= 0 (+ (+ (* (- 1) var2) 100000) (* (- 1) 1)))) (= var1 0))) (inv_main11 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main7 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main7 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main7 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main9 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main9 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main9 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main17 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main17 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main17 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main19 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main19 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main19 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (and (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))) (not (= (p (getS (readHeap var3 (nthAddrRange var2 var0)))) (q (getS (readHeap var3 (nthAddrRange var2 var0))))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (and (and (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (not (= (p (getS (readHeap var3 (nthAddrRange var2 var0)))) (q (getS (readHeap var3 (nthAddrRange var2 var0))))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (and (and (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (not (= (p (getS (readHeap var3 (nthAddrRange var2 var0)))) (q (getS (readHeap var3 (nthAddrRange var2 var0))))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (and (and (and (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (not (= (p (getS (readHeap var3 (nthAddrRange var2 var0)))) (q (getS (readHeap var3 (nthAddrRange var2 var0))))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (and (and (and (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var0))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (not (= (p (getS (readHeap var3 (nthAddrRange var2 var0)))) (q (getS (readHeap var3 (nthAddrRange var2 var0))))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (and (and (and (and (and (inv_main22 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (not (= (p (getS (readHeap var3 (nthAddrRange var2 var0)))) (q (getS (readHeap var3 (nthAddrRange var2 var0))))))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))) (is-O_S (readHeap var3 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main25 var4 var3 var2 var1 var0) (= var0 0)))))
(check-sat)
