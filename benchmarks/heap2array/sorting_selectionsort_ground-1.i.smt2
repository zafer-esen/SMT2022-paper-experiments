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
(declare-fun inv_main12 (Heap AddrRange Int Int Int Int) Bool)
(declare-fun inv_main17 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main19 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main23 (Heap AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main25 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main27 (Heap AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main28 (Heap AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main29 (Heap AddrRange Int Int Int Int Int Int Int) Bool)
(declare-fun inv_main31 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main35 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main39 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main45 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main46 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main6 (Heap AddrRange Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var5 (O_Int var4) 100000) (and (and (and (= var3 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000)) true) (= var6 emptyHeap)) (= var2 0)))) (inv_main6 var5 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Heap)) (or (not (and (and (and (= var3 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000)) true) (= var6 emptyHeap)) (= var2 0))) (batchAllocHeap emptyHeap emptyHeap (O_Int var4) 100000 100000))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (and (and (inv_main29 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var9 (nthAddrRange var8 var3) (O_Int var1)))) (is-O_Int (readHeap var9 (nthAddrRange var8 var3)))) (is-O_Int (readHeap var9 (nthAddrRange var8 var3))))) (inv_main28 var0 var8 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main28 var15 var14 var13 var12 var11 var10 var9 var8) (= var0 0)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 (writeHeap var15 (nthAddrRange var14 var13) (O_Int var8)))) (is-O_Int (readHeap var15 (nthAddrRange var14 var13)))) (is-O_Int (readHeap var15 (nthAddrRange var14 var13))))) (inv_main31 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (and (and (inv_main17 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var2) 100000) (* (- 1) 1))))) (= var1 var5))) (inv_main31 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (and (and (inv_main31 var8 var7 var6 var5 var4 var3 var2) (= var0 (+ var5 1))) (= var1 (+ var5 1))) (<= 0 (+ (+ (* (- 1) var5) var6) (* (- 1) 1)))) (not (<= 0 (+ (+ (* (- 1) (+ var5 1)) var6) (* (- 1) 1)))))) (inv_main31 var8 var7 var6 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (and (and (and (inv_main35 var8 var7 var6 var5 var4 var3 var2) (= var0 (+ var4 1))) (= var1 (+ var5 1))) (is-O_Int (readHeap var8 (nthAddrRange var7 var4)))) (is-O_Int (readHeap var8 (nthAddrRange var7 var5)))) (not (<= 0 (+ (+ (* (- 1) (+ var4 1)) var6) (* (- 1) 1)))))) (inv_main31 var8 var7 var6 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (and (and (inv_main46 var5 var4 var3 var2 var1) (= var0 (+ var1 1))) (is-O_Int (readHeap var5 (nthAddrRange var4 var1)))) (is-O_Int (readHeap var5 (nthAddrRange var4 var2))))) (inv_main45 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (and (and (and (inv_main45 var6 var5 var4 var3 var2) (= var0 (+ (+ 1 var3) 1))) (= var1 (+ var3 1))) (not (<= 0 (+ (+ (* (- 1) var2) 100000) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) (+ var3 1)) 100000) (* (- 1) 1))))) (inv_main45 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main39 var9 var8 var7 var6 var5 var4 var3) (= var0 1)) (= var1 0)) (= var2 (+ var7 1))) (is-O_Int (readHeap var9 (nthAddrRange var8 var7)))) (is-O_Int (readHeap var9 (nthAddrRange var8 var6)))) (not (<= 0 (+ (+ (* (- 1) (+ var6 1)) 100000) (* (- 1) 1))))) (not (<= 0 (+ (+ (* (- 1) (+ var7 1)) 100000) (* (- 1) 1)))))) (inv_main45 var9 var8 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main45 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var0) 100000) (* (- 1) 1))))) (inv_main46 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (inv_main27 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var8 (nthAddrRange var7 var6))))) (is-O_Int (readHeap var8 (nthAddrRange var7 var6))))) (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (and (and (inv_main31 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var4 1))) (<= 0 (+ (+ (* (- 1) var4) var5) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) (+ var4 1)) var5) (* (- 1) 1))))) (inv_main35 var7 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (and (and (and (inv_main35 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var3 1))) (is-O_Int (readHeap var7 (nthAddrRange var6 var3)))) (is-O_Int (readHeap var7 (nthAddrRange var6 var4)))) (<= 0 (+ (+ (* (- 1) (+ var3 1)) var5) (* (- 1) 1))))) (inv_main35 var7 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (and (inv_main17 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1))))) (not (= var0 var4)))) (inv_main25 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (and (inv_main19 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var7 (nthAddrRange var6 var2))))) (is-O_Int (readHeap var7 (nthAddrRange var6 var2))))) (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (and (inv_main25 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var7 (nthAddrRange var6 var1))))) (is-O_Int (readHeap var7 (nthAddrRange var6 var1))))) (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var3 1))) (<= 0 (+ (+ (* (- 1) var1) (getInt (readHeap var8 (nthAddrRange var7 var2)))) (* (- 1) 1)))) (is-O_Int (readHeap var8 (nthAddrRange var7 var2))))) (inv_main17 var8 var7 var6 var5 var4 var0 var3))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (and (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var3 1))) (not (<= 0 (+ (+ (* (- 1) var1) (getInt (readHeap var8 (nthAddrRange var7 var2)))) (* (- 1) 1))))) (is-O_Int (readHeap var8 (nthAddrRange var7 var2))))) (inv_main17 var8 var7 var6 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main39 var10 var9 var8 var7 var6 var5 var4) (= var0 (+ var8 1))) (= var1 (+ (+ 1 var8) 1))) (= var2 (+ var7 1))) (= var3 (+ var8 1))) (is-O_Int (readHeap var10 (nthAddrRange var9 var8)))) (is-O_Int (readHeap var10 (nthAddrRange var9 var7)))) (not (<= 0 (+ (+ (* (- 1) (+ var7 1)) 100000) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) (+ var8 1)) 100000) (* (- 1) 1))))) (inv_main17 var10 var9 var3 var2 var6 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main12 var15 var14 var13 var12 var11 var10) (= var0 0)) (= var1 1)) (= var2 0)) (= var9 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var8 (writeHeap var15 (nthAddrRange var14 var10) (O_Int var7)))) (is-O_Int (readHeap var15 (nthAddrRange var14 var10)))) (is-O_Int (readHeap var15 (nthAddrRange var14 var10)))) (not (<= 0 (+ (+ (* (- 1) (+ var9 1)) 100000) (* (- 1) 1)))))) (inv_main17 var8 var6 var2 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (and (inv_main31 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var4) var5) (* (- 1) 1)))))) (inv_main39 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (and (and (and (inv_main39 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var4 1))) (is-O_Int (readHeap var7 (nthAddrRange var6 var5)))) (is-O_Int (readHeap var7 (nthAddrRange var6 var4)))) (<= 0 (+ (+ (* (- 1) (+ var4 1)) 100000) (* (- 1) 1))))) (inv_main39 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main17 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1))))) (inv_main19 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main6 var5 var4 var3 var2 var1) (= var0 0))) (inv_main12 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main12 var13 var12 var11 var10 var9 var8) (= var0 (+ var7 1))) (= var7 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var6 (writeHeap var13 (nthAddrRange var12 var8) (O_Int var5)))) (is-O_Int (readHeap var13 (nthAddrRange var12 var8)))) (is-O_Int (readHeap var13 (nthAddrRange var12 var8)))) (<= 0 (+ (+ (* (- 1) (+ var7 1)) 100000) (* (- 1) 1))))) (inv_main12 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (inv_main12 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main12 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var0)))) (is-O_Int (readHeap var5 (nthAddrRange var4 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (and (inv_main12 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var4 var0))))) (is-O_Int (readHeap var5 (nthAddrRange var4 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var1)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var6 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var6 (nthAddrRange var6 var1)))) (is-O_Int (readHeap var7 (nthAddrRange var6 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (and (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var6 (nthAddrRange var6 var5)))) (is-O_Int (readHeap var7 (nthAddrRange var6 var5)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (not (and (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var7 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (not (and (and (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var7 (nthAddrRange var7 var2)))) (is-O_Int (readHeap var8 (nthAddrRange var7 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (not (and (and (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var7 var2))))) (is-O_Int (readHeap var8 (nthAddrRange var7 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var6 (nthAddrRange var6 var5)))) (is-O_Int (readHeap var7 (nthAddrRange var6 var5)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var6 var5))))) (is-O_Int (readHeap var7 (nthAddrRange var6 var5)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var3)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (getInt (readHeap var6 (nthAddrRange var5 var2))) (* (- 1) (getInt (readHeap var6 (nthAddrRange var5 var3)))))))) (is-O_Int (readHeap var6 (nthAddrRange var5 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var3)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var5 var4))))) (is-O_Int (readHeap var6 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var4)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var4)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (and (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (getInt (readHeap var6 (nthAddrRange var5 var3))) (* (- 1) (getInt (readHeap var6 (nthAddrRange var5 var4)))))))) (is-O_Int (readHeap var6 (nthAddrRange var5 var4)))) (is-O_Int (readHeap var6 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main46 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var4 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (inv_main46 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var3 var0))))) (is-O_Int (readHeap var4 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (and (inv_main46 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var4 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var4 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (and (and (inv_main46 var4 var3 var2 var1 var0) (not (<= 0 (+ (getInt (readHeap var4 (nthAddrRange var3 var0))) (* (- 1) (getInt (readHeap var4 (nthAddrRange var3 var1)))))))) (is-O_Int (readHeap var4 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var4 (nthAddrRange var3 var1)))))))
(check-sat)
