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
(declare-fun inv_main13 (Heap Int Addr Int Addr Int AddrRange Int) Bool)
(declare-fun inv_main18 (Heap Int Addr Int Addr Int AddrRange Int) Bool)
(declare-fun inv_main2 (Heap Int Addr) Bool)
(declare-fun inv_main23 (Heap Int Addr Int Addr Int AddrRange Int) Bool)
(declare-fun inv_main28 (Heap Int Addr Int Addr Int AddrRange Int) Bool)
(declare-fun inv_main31 (Heap Int Addr Int Addr Int AddrRange Int) Bool)
(declare-fun inv_main35 (Heap Int Addr Int Addr Int AddrRange Int Int) Bool)
(declare-fun inv_main36 (Heap Int Addr Int Addr Int AddrRange Int Int Int) Bool)
(declare-fun inv_main37 (Heap Int Addr Int Addr Int AddrRange Int Int Int) Bool)
(declare-fun inv_main38 (Heap Int Addr Int Addr Int AddrRange Int Int Int Int) Bool)
(declare-fun inv_main46 (Heap Int Addr Int Addr Int AddrRange Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main49 (Heap Int Addr Int Addr Int AddrRange Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main51 (Heap Int Addr Int Addr Int AddrRange Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main53 (Heap Int Addr Int Addr Int AddrRange Int Int AddrRange Int Int Int Int) Bool)
(declare-fun inv_main54 (Heap Int Addr Int Addr Int AddrRange Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main56 (Heap Int Addr Int Addr Int AddrRange Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main57 (Heap Int Addr Int Addr Int AddrRange Int Int AddrRange Int Int Int Int) Bool)
(assert (forall ((var0 Addr) (var1 Int) (var2 Heap)) (or (not (= var2 emptyHeap)) (inv_main2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap)) (or (not (and (and (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var9 (nthAddrRange var3 var2))))) (is-O_Int (readHeap var9 (nthAddrRange var3 var2))))) (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (inv_main36 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var10 (nthAddrRange var4 var2))))) (is-O_Int (readHeap var10 (nthAddrRange var4 var2))))) (inv_main38 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Addr) (var11 Int) (var12 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var9 (O_Int var8) var7) (and (and (and (and (and (and (and (and (inv_main2 var12 var11 var10) (not (<= 0 (+ (+ (* (- 1) var11) 2) (* (- 1) 1))))) (= var1 (AddrRange (ite (<= 0 (+ var7 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var7))) (= var2 var7)) (= var3 var10)) (= var4 var11)) (= var5 var10)) (= var6 var11)) true))) (inv_main13 var9 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Addr) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main2 var12 var11 var10) (not (<= 0 (+ (+ (* (- 1) var11) 2) (* (- 1) 1))))) (= var1 (AddrRange (ite (<= 0 (+ var7 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var7))) (= var2 var7)) (= var3 var10)) (= var4 var11)) (= var5 var10)) (= var6 var11)) true)) (batchAllocHeap emptyHeap emptyHeap (O_Int var8) var7 var7))))
(assert true)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Addr) (var13 Int) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main23 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var8 (* (- 1) 1)))) (= var8 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (= var7 (writeHeap var16 (nthAddrRange var10 var9) (O_Int (+ (+ (* (- 1) 1) var11) (* (- 1) var9)))))) (is-O_Int (readHeap var16 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var16 (nthAddrRange var10 var9)))) (<= 0 (+ var8 (* (- 1) 1))))) (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap) (var10 Int) (var11 Int)) (or (not (and (and (and (and (and (and (and (inv_main31 var9 var8 var7 var6 var5 var4 var3 var2) (= var1 (+ var2 var10))) (= var0 (+ (* var11 (+ var4 (* (- 1) var2))) var10))) (or (not (<= 0 (+ (* (- 1) var10) (* (- 1) 1)))) (<= 0 (+ (* (- 1) var0) (* (- 1) 1))))) (or (not (<= 0 (+ var10 (* (- 1) 1)))) (<= 0 (+ var0 (* (- 1) 1))))) (or (and (<= 0 (+ var4 (* (- 1) var2))) (<= 0 (+ (+ (+ (* 1 var10) (* (- 1) var2)) var4) (* (- 1) 1)))) (and (not (<= 0 (+ var4 (* (- 1) var2)))) (<= 0 (+ (+ (* 1 var10) (* (- 1) (+ var4 (* (- 1) var2)))) (* (- 1) 1)))))) (or (and (<= 0 (+ var4 (* (- 1) var2))) (<= 0 (+ (+ (+ (* (- 1) var10) (* (- 1) var2)) var4) (* (- 1) 1)))) (and (not (<= 0 (+ var4 (* (- 1) var2)))) (<= 0 (+ (+ (* (- 1) var10) (* (- 1) (+ var4 (* (- 1) var2)))) (* (- 1) 1)))))) (<= 0 (+ (+ (* (- 1) var2) var4) (* (- 1) 1))))) (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Addr) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap)) (or (not (and (and (inv_main13 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (<= 0 (+ var3 (* (- 1) 1))))) (inv_main28 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Addr) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Addr) (var13 Int) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main28 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var7 1))) (= var7 var9)) (= var1 var10)) (= var8 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 (writeHeap var16 (nthAddrRange var10 var9) (O_Int var9)))) (is-O_Int (readHeap var16 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var16 (nthAddrRange var10 var9)))) (<= 0 (+ (+ (* (- 1) (+ var7 1)) var8) (* (- 1) 1))))) (inv_main28 var6 var5 var4 var3 var2 var8 var1 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Addr) (var11 Int) (var12 Addr) (var13 Int) (var14 Heap)) (or (not (and (and (and (inv_main57 var14 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var14 (nthAddrRange var5 (+ var3 (* (- 1) 1))) (O_Int var1)))) (is-O_Int (readHeap var14 (nthAddrRange var5 (+ var3 (* (- 1) 1)))))) (is-O_Int (readHeap var14 (nthAddrRange var5 (+ var3 (* (- 1) 1))))))) (inv_main56 var0 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (or (not (and (and (and (inv_main46 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ var1 (* (- 1) var2)))) (<= 0 (+ (+ (* (- 1) var1) var4) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) (+ var1 (* (- 1) 1))) var4) (* (- 1) 1))))) (inv_main49 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 Int) (var19 Int) (var20 AddrRange) (var21 Int) (var22 Addr) (var23 Int) (var24 Addr) (var25 Int) (var26 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main51 var26 var25 var24 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14) (= var0 (getInt (readHeap var26 (nthAddrRange var17 (+ var15 (* (- 1) 1))))))) (= var1 var14)) (= var2 var15)) (= var3 var16)) (= var4 var17)) (= var5 var18)) (= var6 var19)) (= var7 var20)) (= var8 var21)) (= var9 var22)) (= var10 var23)) (= var11 var24)) (= var12 var25)) (= var13 var26)) (is-O_Int (readHeap var26 (nthAddrRange var17 (+ var15 (* (- 1) 1))))))) (inv_main54 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Addr) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Addr) (var15 Int) (var16 Addr) (var17 Int) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main37 var18 var17 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var1 1))) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 (writeHeap var18 (nthAddrRange var12 var10) (O_Int var9)))) (is-O_Int (readHeap var18 (nthAddrRange var12 var10)))) (is-O_Int (readHeap var18 (nthAddrRange var12 var10))))) (inv_main31 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Addr) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap)) (or (not (and (and (inv_main13 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ var3 (* (- 1) 1)))))) (inv_main31 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Addr) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Addr) (var13 Int) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main28 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 0)) (= var7 var9)) (= var1 var10)) (= var8 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 (writeHeap var16 (nthAddrRange var10 var9) (O_Int var9)))) (is-O_Int (readHeap var16 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var16 (nthAddrRange var10 var9)))) (not (<= 0 (+ (+ (* (- 1) (+ var7 1)) var8) (* (- 1) 1)))))) (inv_main31 var6 var5 var4 var3 var2 var8 var1 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Addr) (var8 Int) (var9 Addr) (var10 Int) (var11 Heap)) (or (not (and (and (and (inv_main38 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var11 (nthAddrRange var5 var4) (O_Int var1)))) (is-O_Int (readHeap var11 (nthAddrRange var5 var4)))) (is-O_Int (readHeap var11 (nthAddrRange var5 var4))))) (inv_main37 var0 var10 var9 var8 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Addr) (var11 Int) (var12 Addr) (var13 Int) (var14 Heap)) (or (not (and (and (and (and (inv_main46 var14 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2) (= var0 (+ var6 (* (- 1) 1)))) (= var1 (+ var4 1))) (not (<= 0 (+ var3 (* (- 1) var4))))) (<= 0 (+ (+ (* (- 1) (+ var4 1)) var6) (* (- 1) 1))))) (inv_main46 var14 var13 var12 var11 var10 var9 var8 var7 var6 var5 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 Int) (var19 Int) (var20 AddrRange) (var21 Int) (var22 Addr) (var23 Int) (var24 Addr) (var25 Int) (var26 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main56 var26 var25 var24 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14) (= var0 (+ var2 (* (- 1) 1)))) (= var1 var14)) (= var2 var15)) (= var3 var16)) (= var4 var17)) (= var5 var18)) (= var6 var19)) (= var7 var20)) (= var8 var21)) (= var9 var22)) (= var10 var23)) (= var11 var24)) (= var12 var25)) (= var13 (writeHeap var26 (nthAddrRange var17 var15) (O_Int var14)))) (is-O_Int (readHeap var26 (nthAddrRange var17 var15)))) (is-O_Int (readHeap var26 (nthAddrRange var17 var15))))) (inv_main46 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (or (not (and (and (and (inv_main46 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var2 (* (- 1) 1)))) (<= 0 (+ var2 (* (- 1) var3)))) (or (not (<= 0 (+ (+ (* (- 1) (+ var2 (* (- 1) 1))) var5) (* (- 1) 1)))) (not (<= 0 (+ (+ (* (- 1) var2) var5) (* (- 1) 1))))))) (inv_main46 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Addr) (var11 Int) (var12 Addr) (var13 Int) (var14 Heap)) (or (not (and (and (and (inv_main53 var14 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var3 (* (- 1) 1)))) (not (<= 0 (+ (+ (* (- 1) (getInt (readHeap var14 (nthAddrRange var5 var3)))) var1) (* (- 1) 1))))) (is-O_Int (readHeap var14 (nthAddrRange var5 var3))))) (inv_main46 var14 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (inv_main31 var10 var9 var8 var7 var6 var5 var4 var3) (= var1 (+ var5 (* (- 1) 1)))) (= var2 1)) (not (<= 0 (+ (+ (* (- 1) var3) var5) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) 1) var5) (* (- 1) 1))))) (inv_main46 var10 var9 var8 var7 var6 var5 var4 var3 var5 var4 var2 var1 var0))))
(assert true)
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Int) (var15 Addr) (var16 Int) (var17 Addr) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main18 var19 var18 var17 var16 var15 var14 var13 var12) (= var1 (+ var11 (* (- 1) 1)))) (= var2 1)) (= var3 (+ var10 1))) (= var10 var12)) (= var4 var13)) (= var11 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 var18)) (= var9 (writeHeap var19 (nthAddrRange var13 var12) (O_Int var12)))) (is-O_Int (readHeap var19 (nthAddrRange var13 var12)))) (is-O_Int (readHeap var19 (nthAddrRange var13 var12)))) (not (<= 0 (+ (+ (* (- 1) (+ var10 1)) var11) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) 1) var11) (* (- 1) 1))))) (inv_main46 var9 var8 var7 var6 var5 var11 var4 var3 var11 var4 var2 var1 var0))))
(assert true)
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Int) (var15 Addr) (var16 Int) (var17 Addr) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main23 var19 var18 var17 var16 var15 var14 var13 var12) (= var1 (+ var11 (* (- 1) 1)))) (= var2 1)) (= var3 (+ var10 (* (- 1) 1)))) (= var10 var12)) (= var4 var13)) (= var11 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 var18)) (= var9 (writeHeap var19 (nthAddrRange var13 var12) (O_Int (+ (+ (* (- 1) 1) var14) (* (- 1) var12)))))) (is-O_Int (readHeap var19 (nthAddrRange var13 var12)))) (is-O_Int (readHeap var19 (nthAddrRange var13 var12)))) (not (<= 0 (+ var10 (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) 1) var11) (* (- 1) 1))))) (inv_main46 var9 var8 var7 var6 var5 var11 var4 var3 var11 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (or (not (and (and (inv_main49 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var13 (nthAddrRange var4 (+ var2 (* (- 1) 1))))))) (is-O_Int (readHeap var13 (nthAddrRange var4 (+ var2 (* (- 1) 1))))))) (inv_main53 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (or (not (and (and (inv_main54 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var13 (nthAddrRange var4 var2))))) (is-O_Int (readHeap var13 (nthAddrRange var4 var2))))) (inv_main57 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert true)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Addr) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Addr) (var13 Int) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main18 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var7 1))) (= var7 var9)) (= var1 var10)) (= var8 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 (writeHeap var16 (nthAddrRange var10 var9) (O_Int var9)))) (is-O_Int (readHeap var16 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var16 (nthAddrRange var10 var9)))) (<= 0 (+ (+ (* (- 1) (+ var7 1)) var8) (* (- 1) 1))))) (inv_main18 var6 var5 var4 var3 var2 var8 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (or (not (and (and (inv_main53 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) (getInt (readHeap var13 (nthAddrRange var4 var2)))) var0) (* (- 1) 1)))) (is-O_Int (readHeap var13 (nthAddrRange var4 var2))))) (inv_main51 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (and (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))) (is-O_Int (readHeap var7 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (and (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var1 var0))))) (is-O_Int (readHeap var7 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))) (is-O_Int (readHeap var7 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var1 var0))))) (is-O_Int (readHeap var7 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))) (is-O_Int (readHeap var7 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var1 var0))))) (is-O_Int (readHeap var7 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Addr) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap)) (not (and (inv_main35 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Addr) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap)) (not (and (and (inv_main35 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))) (is-O_Int (readHeap var8 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap)) (not (and (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var9 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap)) (not (and (and (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var9 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (not (and (inv_main38 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var10 (nthAddrRange var4 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (not (and (and (inv_main38 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var3)))) (is-O_Int (readHeap var10 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (not (and (and (inv_main38 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var10 (nthAddrRange var4 var3))))) (is-O_Int (readHeap var10 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap)) (not (and (inv_main37 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var9 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap)) (not (and (and (inv_main37 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var9 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap)) (not (and (and (inv_main37 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var9 (nthAddrRange var3 var1))))) (is-O_Int (readHeap var9 (nthAddrRange var3 var1)))))))
(assert true)
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (inv_main49 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var12 (nthAddrRange var3 (+ var1 (* (- 1) 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (and (inv_main49 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 (+ var1 (* (- 1) 1)))))) (is-O_Int (readHeap var12 (nthAddrRange var3 (+ var1 (* (- 1) 1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (not (and (inv_main53 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var13 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (not (and (and (inv_main53 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var2)))) (is-O_Int (readHeap var13 (nthAddrRange var4 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (inv_main51 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var12 (nthAddrRange var3 (+ var1 (* (- 1) 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (and (inv_main51 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 (+ var1 (* (- 1) 1)))))) (is-O_Int (readHeap var12 (nthAddrRange var3 (+ var1 (* (- 1) 1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (inv_main54 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var12 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (and (inv_main54 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var12 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (not (and (inv_main57 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var13 (nthAddrRange var4 (+ var2 (* (- 1) 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (not (and (and (inv_main57 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 (+ var2 (* (- 1) 1)))))) (is-O_Int (readHeap var13 (nthAddrRange var4 (+ var2 (* (- 1) 1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (not (and (and (inv_main57 var13 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var13 (nthAddrRange var4 (+ var2 (* (- 1) 1))))))) (is-O_Int (readHeap var13 (nthAddrRange var4 (+ var2 (* (- 1) 1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (inv_main56 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var12 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (and (inv_main56 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var12 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (not (and (and (inv_main56 var12 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var12 (nthAddrRange var3 var1))))) (is-O_Int (readHeap var12 (nthAddrRange var3 var1)))))))
(check-sat)
