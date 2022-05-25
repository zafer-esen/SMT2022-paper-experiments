(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status unsat)
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
(declare-fun inv_main10 (Heap Int AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main12 (Heap Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main14 (Heap Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main15 (Heap Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main17 (Heap Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main18 (Heap Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main21 (Heap Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main22 (Heap Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main26 (Heap Int AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main29 (Heap Int AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main6 (Heap Int AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main7 (Heap Int AddrRange AddrRange AddrRange) Bool)
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Heap)) (or (not (and (and (batchAllocPostHeap emptyHeap var2 (O_Int var1) 100000) (and (batchAllocPostHeap emptyHeap var7 (O_Int var6) 100000) (batchAllocPostHeap emptyHeap var12 (O_Int var11) 100000))) (and (and (and (and (and (and (and (and (and true (= var3 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var4 var8)) (= var5 var10)) true) (= var8 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var10 var9)) true) (= var13 emptyHeap)) (= var0 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))))) (inv_main6 var2 var5 var4 var3 var0))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and true (= var3 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var4 var8)) (= var5 var10)) true) (= var8 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var10 var9)) true) (= var13 emptyHeap)) (= var0 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000)))) (batchAllocHeap emptyHeap emptyHeap (O_Int var1) 100000 100000))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and true (= var3 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var4 var8)) (= var5 var10)) true) (= var8 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var10 var9)) true) (= var13 emptyHeap)) (= var0 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000)))) (batchAllocHeap emptyHeap emptyHeap (O_Int var6) 100000 100000))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and true (= var3 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var4 var8)) (= var5 var10)) true) (= var8 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var10 var9)) true) (= var13 emptyHeap)) (= var0 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000)))) (batchAllocHeap emptyHeap emptyHeap (O_Int var11) 100000 100000))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (or (not (and (and (inv_main10 var5 var4 var3 var2 var1) (= var0 (+ var4 1))) (not (<= 0 (+ (+ (* (- 1) (+ var4 1)) 100000) (* (- 1) 1)))))) (inv_main7 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main18 var12 var11 var10 var9 var8 var7) (= var6 (getInt (readHeap var12 (nthAddrRange var9 var11))))) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (is-O_Int (readHeap var12 (nthAddrRange var9 var11)))) (not (= var6 0)))) (inv_main22 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main18 var12 var11 var10 var9 var8 var7) (= var6 (getInt (readHeap var12 (nthAddrRange var9 var11))))) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (is-O_Int (readHeap var12 (nthAddrRange var9 var11)))) (= var6 0))) (inv_main21 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main7 var10 var9 var8 var7 var6) (= var0 0)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 (writeHeap var10 (nthAddrRange var8 15000) (O_Int 1)))) (is-O_Int (readHeap var10 (nthAddrRange var8 15000)))) (is-O_Int (readHeap var10 (nthAddrRange var8 15000))))) (inv_main26 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (or (not (and (and (inv_main29 var5 var4 var3 var2 var1) (= var0 (+ var4 1))) (is-O_Int (readHeap var5 (nthAddrRange var1 var4))))) (inv_main26 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (or (not (and (and (and (inv_main26 var5 var4 var3 var2 var1) (= var0 (+ var4 1))) (<= 0 (+ (+ (* (- 1) var4) 100000) (* (- 1) 1)))) (not (= var4 15000)))) (inv_main26 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap)) (or (not (and (and (and (inv_main21 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 (nthAddrRange var2 var5) (O_Int 0)))) (is-O_Int (readHeap var6 (nthAddrRange var2 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var2 var5))))) (inv_main10 var0 var5 var4 var3 var2))))
(assert (forall ((var0 Heap) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap)) (or (not (and (and (and (inv_main22 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 (nthAddrRange var2 var5) (O_Int 1)))) (is-O_Int (readHeap var6 (nthAddrRange var2 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var2 var5))))) (inv_main10 var0 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main14 var12 var11 var10 var9 var8 var7) (= var6 (getInt (readHeap var12 (nthAddrRange var10 var11))))) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (is-O_Int (readHeap var12 (nthAddrRange var10 var11)))) (= var6 0))) (inv_main10 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap)) (or (not (and (and (and (inv_main15 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 (nthAddrRange var4 var5) (O_Int 1)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var5))))) (inv_main17 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main14 var12 var11 var10 var9 var8 var7) (= var6 (getInt (readHeap var12 (nthAddrRange var10 var11))))) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (is-O_Int (readHeap var12 (nthAddrRange var10 var11)))) (not (= var6 0)))) (inv_main18 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap)) (or (not (and (inv_main6 var6 var5 var4 var3 var2) (= var1 0))) (inv_main12 var6 var1 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap)) (or (not (and (and (inv_main10 var6 var5 var4 var3 var2) (= var1 (+ var5 1))) (<= 0 (+ (+ (* (- 1) (+ var5 1)) 100000) (* (- 1) 1))))) (inv_main12 var6 var1 var4 var3 var2 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main12 var11 var10 var9 var8 var7 var6) (= var5 var6)) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 (writeHeap var11 (nthAddrRange var9 var10) (O_Int 0)))) (is-O_Int (readHeap var11 (nthAddrRange var9 var10)))) (is-O_Int (readHeap var11 (nthAddrRange var9 var10)))) (= var5 0))) (inv_main15 var4 var3 var2 var1 var0 var5))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (or (not (and (and (inv_main26 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var3) 100000) (* (- 1) 1)))) (= var3 15000))) (inv_main29 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int)) (or (not (and (and (and (and (and (and (and (and (inv_main17 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 (nthAddrRange var3 var5) (O_Int var7)))) (= var5 (+ (* 2 var8) var7))) (or (not (<= 0 (+ (* (- 1) var7) (* (- 1) 1)))) (<= 0 (+ (* (- 1) var5) (* (- 1) 1))))) (or (not (<= 0 (+ var7 (* (- 1) 1)))) (<= 0 (+ var5 (* (- 1) 1))))) (<= 0 (+ (+ (* 1 var7) 2) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) var7) 2) (* (- 1) 1)))) (is-O_Int (readHeap var6 (nthAddrRange var3 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var3 var5))))) (inv_main14 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main12 var11 var10 var9 var8 var7 var6) (= var5 var6)) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 (writeHeap var11 (nthAddrRange var9 var10) (O_Int 0)))) (is-O_Int (readHeap var11 (nthAddrRange var9 var10)))) (is-O_Int (readHeap var11 (nthAddrRange var9 var10)))) (not (= var5 0)))) (inv_main14 var4 var3 var2 var1 var0 var5))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (inv_main12 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var3 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main12 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var4)))) (is-O_Int (readHeap var5 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main12 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var3 var4))))) (is-O_Int (readHeap var5 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (inv_main15 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var3 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main15 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var4)))) (is-O_Int (readHeap var5 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main15 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var3 var4))))) (is-O_Int (readHeap var5 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var4)))) (is-O_Int (readHeap var5 (nthAddrRange var2 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var2 var4))))) (is-O_Int (readHeap var5 (nthAddrRange var2 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var3 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var4)))) (is-O_Int (readHeap var5 (nthAddrRange var3 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (inv_main18 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main18 var5 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var4)))) (is-O_Int (readHeap var5 (nthAddrRange var2 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (inv_main21 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var1 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main21 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var4)))) (is-O_Int (readHeap var5 (nthAddrRange var1 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main21 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var1 var4))))) (is-O_Int (readHeap var5 (nthAddrRange var1 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (inv_main22 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var1 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main22 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var4)))) (is-O_Int (readHeap var5 (nthAddrRange var1 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Heap)) (not (and (and (inv_main22 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var1 var4))))) (is-O_Int (readHeap var5 (nthAddrRange var1 var4)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main7 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var2 15000))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (inv_main7 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 15000)))) (is-O_Int (readHeap var4 (nthAddrRange var2 15000)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (inv_main7 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var2 15000))))) (is-O_Int (readHeap var4 (nthAddrRange var2 15000)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 var3))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 var3)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 var3))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (inv_main29 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 var3)))) (is-O_Int (readHeap var4 (nthAddrRange var0 var3)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (inv_main29 var4 var3 var2 var1 var0) (not (= (getInt (readHeap var4 (nthAddrRange var0 var3))) 0))) (is-O_Int (readHeap var4 (nthAddrRange var0 var3)))))))
(check-sat)