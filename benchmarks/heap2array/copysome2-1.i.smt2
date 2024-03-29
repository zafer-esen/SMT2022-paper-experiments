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
(declare-fun inv_main14 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main16 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main17 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main19 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main22 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main24 (Heap AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main26 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main29 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main30 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main31 (Heap AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main32 (Heap AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main36 (Heap AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main7 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 Int) (var13 Heap) (var14 Heap)) (or (not (and (and (batchAllocPostHeap emptyHeap var10 (O_Int var9) 200000) (and (batchAllocPostHeap emptyHeap var13 (O_Int var12) 200000) (batchAllocPostHeap emptyHeap var6 (O_Int var5) 200000))) (and (and (and (and (and (and (and (and (and (= var7 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000)) (= var8 var11)) true) (= var11 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000))) true) (= var14 emptyHeap)) (= var2 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000))) (= var3 var7)) (= var4 var8)) true))) (inv_main7 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 Int) (var13 Heap) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (= var7 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000)) (= var8 var11)) true) (= var11 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000))) true) (= var14 emptyHeap)) (= var2 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000))) (= var3 var7)) (= var4 var8)) true)) (batchAllocHeap emptyHeap emptyHeap (O_Int var9) 200000 200000))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 Int) (var13 Heap) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (= var7 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000)) (= var8 var11)) true) (= var11 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000))) true) (= var14 emptyHeap)) (= var2 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000))) (= var3 var7)) (= var4 var8)) true)) (batchAllocHeap emptyHeap emptyHeap (O_Int var12) 200000 200000))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 Int) (var13 Heap) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (= var7 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000)) (= var8 var11)) true) (= var11 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000))) true) (= var14 emptyHeap)) (= var2 (AddrRange (ite (<= 0 199999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 200000))) (= var3 var7)) (= var4 var8)) true)) (batchAllocHeap emptyHeap emptyHeap (O_Int var5) 200000 200000))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (and (inv_main29 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var6 (nthAddrRange var4 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var4 var2))))) (inv_main31 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (or (not (and (and (inv_main7 var7 var6 var5 var4 var3 var2) (= var0 150000)) (= var1 0))) (inv_main14 var7 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main17 var13 var12 var11 var10 var9 var8) (= var0 (+ var7 1))) (= var1 var8)) (= var7 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var6 (writeHeap var13 (nthAddrRange var10 var9) (O_Int var5)))) (is-O_Int (readHeap var13 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var13 (nthAddrRange var10 var9)))) (<= 0 (+ (+ (* (- 1) (+ var7 1)) 200000) (* (- 1) 1))))) (inv_main14 var6 var4 var3 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (or (not (and (and (and (and (inv_main36 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var1 1))) (is-O_Int (readHeap var7 (nthAddrRange var4 var1)))) (is-O_Int (readHeap var7 (nthAddrRange var6 var1)))) (<= 0 (+ (+ (* (- 1) (+ var1 1)) 200000) (* (- 1) 1))))) (inv_main36 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (and (inv_main26 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var2) 200000) (* (- 1) 1)))))) (inv_main36 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 AddrRange) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main14 var12 var11 var10 var9 var8 var7) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var6 (writeHeap var12 (nthAddrRange var11 var8) (O_Int var5)))) (is-O_Int (readHeap var12 (nthAddrRange var11 var8)))) (is-O_Int (readHeap var12 (nthAddrRange var11 var8))))) (inv_main16 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main17 var13 var12 var11 var10 var9 var8) (= var0 0)) (= var1 var8)) (= var7 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var6 (writeHeap var13 (nthAddrRange var10 var9) (O_Int var5)))) (is-O_Int (readHeap var13 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var13 (nthAddrRange var10 var9)))) (not (<= 0 (+ (+ (* (- 1) (+ var7 1)) 200000) (* (- 1) 1)))))) (inv_main19 var6 var4 var3 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main24 var13 var12 var11 var10 var9 var8 var7) (= var0 (+ var2 1))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 (writeHeap var13 (nthAddrRange var11 var9) (O_Int var7)))) (is-O_Int (readHeap var13 (nthAddrRange var11 var9)))) (is-O_Int (readHeap var13 (nthAddrRange var11 var9))))) (inv_main19 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (and (and (inv_main19 var6 var5 var4 var3 var2 var1) (= var0 (+ var2 1))) (<= 0 (+ (+ (* (- 1) var2) 200000) (* (- 1) 1)))) (= var2 var1))) (inv_main19 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (and (inv_main22 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var6 (nthAddrRange var5 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var5 var2))))) (inv_main24 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 AddrRange) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main16 var12 var11 var10 var9 var8 var7) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var6 (writeHeap var12 (nthAddrRange var10 var8) (O_Int var5)))) (is-O_Int (readHeap var12 (nthAddrRange var10 var8)))) (is-O_Int (readHeap var12 (nthAddrRange var10 var8))))) (inv_main17 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (and (inv_main26 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var1) 200000) (* (- 1) 1)))) (not (= var1 var0)))) (inv_main29 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (and (inv_main30 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var6 (nthAddrRange var5 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var5 var2))))) (inv_main32 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (and (inv_main19 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var2) 200000) (* (- 1) 1)))))) (inv_main26 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main31 var13 var12 var11 var10 var9 var8 var7) (= var0 (+ var2 1))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 (writeHeap var13 (nthAddrRange var10 var9) (O_Int var7)))) (is-O_Int (readHeap var13 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var13 (nthAddrRange var10 var9))))) (inv_main26 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main32 var13 var12 var11 var10 var9 var8 var7) (= var0 (+ var2 1))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 (writeHeap var13 (nthAddrRange var10 var9) (O_Int var7)))) (is-O_Int (readHeap var13 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var13 (nthAddrRange var10 var9))))) (inv_main26 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (and (inv_main19 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var1) 200000) (* (- 1) 1)))) (not (= var1 var0)))) (inv_main22 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (and (inv_main26 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var1) 200000) (* (- 1) 1)))) (= var1 var0))) (inv_main30 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var1)))) (is-O_Int (readHeap var5 (nthAddrRange var4 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var4 var1))))) (is-O_Int (readHeap var5 (nthAddrRange var4 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main16 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main16 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var5 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main16 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var3 var1))))) (is-O_Int (readHeap var5 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))) (is-O_Int (readHeap var5 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var2 var1))))) (is-O_Int (readHeap var5 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main22 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main22 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var1)))) (is-O_Int (readHeap var5 (nthAddrRange var4 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var4 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main29 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main29 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var5 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main31 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main31 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main31 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main30 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main30 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var1)))) (is-O_Int (readHeap var5 (nthAddrRange var4 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var0))))) (is-O_Int (readHeap var6 (nthAddrRange var5 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (and (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (= (getInt (readHeap var6 (nthAddrRange var5 var0))) (getInt (readHeap var6 (nthAddrRange var3 var0)))))) (is-O_Int (readHeap var6 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var0)))))))
(check-sat)
