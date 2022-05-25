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
(declare-fun inv_main11 (Heap Int AddrRange Int Int) Bool)
(declare-fun inv_main16 (Heap Int AddrRange Int Int) Bool)
(declare-fun inv_main17 (Heap Int AddrRange Int Int) Bool)
(declare-fun inv_main25 (Heap Int AddrRange Int Int AddrRange Int) Bool)
(declare-fun inv_main28 (Heap Int AddrRange Int Int AddrRange Int) Bool)
(declare-fun inv_main31 (Heap Int AddrRange Int Int AddrRange Int) Bool)
(declare-fun inv_main34 (Heap Int AddrRange Int Int AddrRange Int Int) Bool)
(declare-fun inv_main39 (Heap Int AddrRange Int Int AddrRange Int AddrRange Int Int Int) Bool)
(declare-fun inv_main44 (Heap Int AddrRange Int Int AddrRange Int AddrRange Int Int) Bool)
(declare-fun inv_main48 (Heap Int AddrRange Int Int AddrRange Int) Bool)
(declare-fun inv_main52 (Heap Int AddrRange Int Int AddrRange Int) Bool)
(declare-fun inv_main58 (Heap Int AddrRange Int Int AddrRange Int) Bool)
(declare-fun inv_main59 (Heap Int AddrRange Int Int AddrRange Int) Bool)
(declare-fun inv_main6 (Heap Int AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap) (var6 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var5 (O_Int var4) 100000) (and (and (and (= var6 emptyHeap) (= var2 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var3 0)) true))) (inv_main6 var5 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap) (var6 Heap)) (or (not (and (and (and (= var6 emptyHeap) (= var2 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var3 0)) true)) (batchAllocHeap emptyHeap emptyHeap (O_Int var4) 100000 100000))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap)) (or (not (and (inv_main6 var5 var4 var3 var2 var1) (= var0 0))) (inv_main11 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main11 var11 var10 var9 var8 var7) (= var0 (+ var6 1))) (= var1 var7)) (= var6 var8)) (= var2 var9)) (= var3 var10)) (= var5 (writeHeap var11 (nthAddrRange var9 var8) (O_Int var4)))) (is-O_Int (readHeap var11 (nthAddrRange var9 var8)))) (is-O_Int (readHeap var11 (nthAddrRange var9 var8)))) (<= 0 (+ (+ (* (- 1) (+ var6 1)) 100000) (* (- 1) 1))))) (inv_main11 var5 var3 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main25 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var8 1))) (= var8 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var7 (writeHeap var15 (nthAddrRange var10 var9) (O_Int var6)))) (is-O_Int (readHeap var15 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var15 (nthAddrRange var10 var9)))) (<= 0 (+ (+ (* (- 1) (+ var8 1)) 100000) (* (- 1) 1))))) (inv_main25 var7 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var7 (O_Int var6) 100000) (and (and (and (and (and (and (and (and (and (inv_main16 var12 var11 var10 var9 var8) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var8) var11) (* (- 1) 1))))) (not (<= 0 (+ (+ (* (- 1) (+ var9 1)) var11) (* (- 1) 1))))) (= var1 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var2 var8)) (= var3 (+ var9 1))) (= var4 var10)) (= var5 var11)) true))) (inv_main25 var7 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main16 var12 var11 var10 var9 var8) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var8) var11) (* (- 1) 1))))) (not (<= 0 (+ (+ (* (- 1) (+ var9 1)) var11) (* (- 1) 1))))) (= var1 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var2 var8)) (= var3 (+ var9 1))) (= var4 var10)) (= var5 var11)) true)) (batchAllocHeap emptyHeap emptyHeap (O_Int var6) 100000 100000))))
(assert (forall ((var0 Int) (var1 Int) (var2 Heap) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Int) (var18 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var13 (O_Int var12) 100000) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main11 var18 var17 var16 var15 var14) (= var0 0)) (= var5 var14)) (= var3 var15)) (= var8 var16)) (= var10 var17)) (= var2 (writeHeap var18 (nthAddrRange var16 var15) (O_Int var1)))) (is-O_Int (readHeap var18 (nthAddrRange var16 var15)))) (is-O_Int (readHeap var18 (nthAddrRange var16 var15)))) (not (<= 0 (+ (+ (* (- 1) (+ var3 1)) 100000) (* (- 1) 1))))) (not (<= 0 (+ var10 (* (- 1) 1))))) (= var4 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var6 var5)) (= var7 0)) (= var9 var8)) (= var11 var10)) true))) (inv_main25 var13 var11 var9 var7 var6 var4 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Heap) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Int) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main11 var18 var17 var16 var15 var14) (= var0 0)) (= var5 var14)) (= var3 var15)) (= var8 var16)) (= var10 var17)) (= var2 (writeHeap var18 (nthAddrRange var16 var15) (O_Int var1)))) (is-O_Int (readHeap var18 (nthAddrRange var16 var15)))) (is-O_Int (readHeap var18 (nthAddrRange var16 var15)))) (not (<= 0 (+ (+ (* (- 1) (+ var3 1)) 100000) (* (- 1) 1))))) (not (<= 0 (+ var10 (* (- 1) 1))))) (= var4 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var6 var5)) (= var7 0)) (= var9 var8)) (= var11 var10)) true)) (batchAllocHeap emptyHeap emptyHeap (O_Int var12) 100000 100000))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (or (not (and (inv_main58 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var2) var5) (* (- 1) 1))))) (inv_main59 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Heap) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Int) (var16 AddrRange) (var17 Int) (var18 Int) (var19 AddrRange) (var20 Int) (var21 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main44 var21 var20 var19 var18 var17 var16 var15 var14 var13 var12) (= var0 0)) (= var1 (+ var3 1))) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 var18)) (= var9 var19)) (= var10 var20)) (= var11 (writeHeap var21 (nthAddrRange var14 var13) (O_Int var12)))) (is-O_Int (readHeap var21 (nthAddrRange var14 var13)))) (is-O_Int (readHeap var21 (nthAddrRange var14 var13))))) (inv_main48 var11 var1 var9 var0 var7 var6 var5))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap)) (or (not (and (and (inv_main34 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (= var1 0))) (inv_main48 var8 var7 var6 var0 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap)) (or (not (and (and (and (and (inv_main48 var8 var7 var6 var5 var4 var3 var2) (= var0 (+ var5 1))) (= var1 (+ var5 1))) (<= 0 (+ (+ (* (- 1) var5) var7) (* (- 1) 1)))) (not (<= 0 (+ (+ (* (- 1) (+ var5 1)) var7) (* (- 1) 1)))))) (inv_main48 var8 var7 var6 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap)) (or (not (and (and (and (and (and (inv_main52 var8 var7 var6 var5 var4 var3 var2) (= var0 (+ var4 1))) (= var1 (+ var5 1))) (is-O_Int (readHeap var8 (nthAddrRange var6 var4)))) (is-O_Int (readHeap var8 (nthAddrRange var6 var5)))) (not (<= 0 (+ (+ (* (- 1) (+ var4 1)) var7) (* (- 1) 1)))))) (inv_main48 var8 var7 var6 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Int) (var18 AddrRange) (var19 Int) (var20 Int) (var21 AddrRange) (var22 Int) (var23 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main39 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13) (= var0 (+ var11 1))) (= var10 (getInt (readHeap var23 (nthAddrRange var16 var13))))) (= var11 var13)) (= var9 var14)) (= var12 var15)) (= var1 var16)) (= var2 var17)) (= var3 var18)) (= var4 var19)) (= var5 var20)) (= var6 var21)) (= var7 var22)) (= var8 var23)) (is-O_Int (readHeap var23 (nthAddrRange var16 var13)))) (not (= var10 var9))) (<= 0 (+ (+ (* (- 1) (+ var11 1)) var12) (* (- 1) 1))))) (inv_main39 var8 var7 var6 var5 var4 var3 var2 var1 var12 var9 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main28 var17 var16 var15 var14 var13 var12 var11) (= var0 0)) (= var1 (getInt (readHeap var17 (nthAddrRange var12 var11))))) (= var10 var16)) (= var2 var15)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 var15)) (= var8 var16)) (= var9 var17)) (is-O_Int (readHeap var17 (nthAddrRange var12 var11)))) (<= 0 (+ var10 (* (- 1) 1))))) (inv_main39 var9 var8 var7 var6 var5 var4 var3 var2 var10 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Heap)) (or (not (and (and (inv_main31 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var7 (nthAddrRange var2 var1))))) (is-O_Int (readHeap var7 (nthAddrRange var2 var1))))) (inv_main44 var7 var6 var5 var4 var3 var2 var1 var5 var6 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main48 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var1 1))) (not (<= 0 (+ (+ (* (- 1) var4) var6) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) (+ var1 1)) 100000) (* (- 1) 1))))) (inv_main28 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main25 var15 var14 var13 var12 var11 var10 var9) (= var0 0)) (= var8 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var7 (writeHeap var15 (nthAddrRange var10 var9) (O_Int var6)))) (is-O_Int (readHeap var15 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var15 (nthAddrRange var10 var9)))) (not (<= 0 (+ (+ (* (- 1) (+ var8 1)) 100000) (* (- 1) 1)))))) (inv_main28 var7 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main48 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var4 1))) (<= 0 (+ (+ (* (- 1) var4) var6) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) (+ var4 1)) var6) (* (- 1) 1))))) (inv_main52 var7 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Heap)) (or (not (and (and (and (and (inv_main52 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var3 1))) (is-O_Int (readHeap var7 (nthAddrRange var5 var3)))) (is-O_Int (readHeap var7 (nthAddrRange var5 var4)))) (<= 0 (+ (+ (* (- 1) (+ var3 1)) var6) (* (- 1) 1))))) (inv_main52 var7 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Int) (var18 AddrRange) (var19 Int) (var20 Int) (var21 AddrRange) (var22 Int) (var23 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main39 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13) (= var0 1)) (= var12 (getInt (readHeap var23 (nthAddrRange var16 var13))))) (= var1 var13)) (= var11 var14)) (= var2 var15)) (= var3 var16)) (= var4 var17)) (= var5 var18)) (= var6 var19)) (= var7 var20)) (= var8 var21)) (= var9 var22)) (= var10 var23)) (is-O_Int (readHeap var23 (nthAddrRange var16 var13)))) (= var12 var11))) (inv_main34 var10 var9 var8 var7 var6 var5 var4 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Int) (var18 AddrRange) (var19 Int) (var20 Int) (var21 AddrRange) (var22 Int) (var23 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main39 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13) (= var0 0)) (= var10 (getInt (readHeap var23 (nthAddrRange var16 var13))))) (= var11 var13)) (= var9 var14)) (= var12 var15)) (= var1 var16)) (= var2 var17)) (= var3 var18)) (= var4 var19)) (= var5 var20)) (= var6 var21)) (= var7 var22)) (= var8 var23)) (is-O_Int (readHeap var23 (nthAddrRange var16 var13)))) (not (= var10 var9))) (not (<= 0 (+ (+ (* (- 1) (+ var11 1)) var12) (* (- 1) 1)))))) (inv_main34 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main28 var17 var16 var15 var14 var13 var12 var11) (= var0 0)) (= var1 (getInt (readHeap var17 (nthAddrRange var12 var11))))) (= var10 var16)) (= var2 var15)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 var15)) (= var8 var16)) (= var9 var17)) (is-O_Int (readHeap var17 (nthAddrRange var12 var11)))) (not (<= 0 (+ var10 (* (- 1) 1)))))) (inv_main34 var9 var8 var7 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main59 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var3 1))) (is-O_Int (readHeap var7 (nthAddrRange var5 var3)))) (is-O_Int (readHeap var7 (nthAddrRange var5 var4))))) (inv_main58 var7 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap)) (or (not (and (and (and (and (inv_main58 var8 var7 var6 var5 var4 var3 var2) (= var0 (+ (+ 1 var5) 1))) (= var1 (+ var5 1))) (not (<= 0 (+ (+ (* (- 1) var4) var7) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) (+ var5 1)) var7) (* (- 1) 1))))) (inv_main58 var8 var7 var6 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap)) (or (not (and (and (and (and (and (and (inv_main48 var9 var8 var7 var6 var5 var4 var3) (= var0 (+ var3 1))) (= var1 1)) (= var2 0)) (not (<= 0 (+ (+ (* (- 1) var6) var8) (* (- 1) 1))))) (not (<= 0 (+ (+ (* (- 1) (+ var3 1)) 100000) (* (- 1) 1))))) (<= 0 (+ var8 (* (- 1) 1))))) (inv_main58 var9 var8 var7 var2 var1 var4 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (or (not (and (inv_main16 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var0) var3) (* (- 1) 1))))) (inv_main17 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap)) (or (not (and (and (and (inv_main17 var5 var4 var3 var2 var1) (= var0 (+ var1 1))) (is-O_Int (readHeap var5 (nthAddrRange var3 var1)))) (is-O_Int (readHeap var5 (nthAddrRange var3 var2))))) (inv_main16 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (inv_main16 var6 var5 var4 var3 var2) (= var0 (+ (+ 1 var3) 1))) (= var1 (+ var3 1))) (not (<= 0 (+ (+ (* (- 1) var2) var5) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) (+ var3 1)) var5) (* (- 1) 1))))) (inv_main16 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main11 var12 var11 var10 var9 var8) (= var0 1)) (= var1 0)) (= var2 var8)) (= var6 var9)) (= var3 var10)) (= var7 var11)) (= var5 (writeHeap var12 (nthAddrRange var10 var9) (O_Int var4)))) (is-O_Int (readHeap var12 (nthAddrRange var10 var9)))) (is-O_Int (readHeap var12 (nthAddrRange var10 var9)))) (not (<= 0 (+ (+ (* (- 1) (+ var6 1)) 100000) (* (- 1) 1))))) (<= 0 (+ var7 (* (- 1) 1))))) (inv_main16 var5 var7 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Heap)) (or (not (and (inv_main34 var7 var6 var5 var4 var3 var2 var1 var0) (not (= var0 0)))) (inv_main31 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main11 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (inv_main11 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))) (is-O_Int (readHeap var4 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (inv_main11 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var2 var1))))) (is-O_Int (readHeap var4 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (inv_main17 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))) (is-O_Int (readHeap var4 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var2 var0))))) (is-O_Int (readHeap var4 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (and (inv_main17 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_Int (readHeap var4 (nthAddrRange var2 var0)))) (is-O_Int (readHeap var4 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap)) (not (and (and (and (inv_main17 var4 var3 var2 var1 var0) (= (getInt (readHeap var4 (nthAddrRange var2 var1))) (getInt (readHeap var4 (nthAddrRange var2 var0))))) (is-O_Int (readHeap var4 (nthAddrRange var2 var0)))) (is-O_Int (readHeap var4 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var1 var0))))) (is-O_Int (readHeap var6 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main28 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (inv_main28 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main39 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var10 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (and (inv_main39 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var10 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main31 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (inv_main31 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var9 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))) (is-O_Int (readHeap var9 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var9 (nthAddrRange var2 var1))))) (is-O_Int (readHeap var9 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var2)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var3)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (= (getInt (readHeap var6 (nthAddrRange var4 var3))) (getInt (readHeap var6 (nthAddrRange var4 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var4 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var2)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var3)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var4 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var4 (nthAddrRange var4 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var3)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap)) (not (and (and (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (= (getInt (readHeap var6 (nthAddrRange var4 var3))) (getInt (readHeap var6 (nthAddrRange var4 var2))))) (is-O_Int (readHeap var6 (nthAddrRange var4 var2)))) (is-O_Int (readHeap var6 (nthAddrRange var4 var3)))))))
(check-sat)