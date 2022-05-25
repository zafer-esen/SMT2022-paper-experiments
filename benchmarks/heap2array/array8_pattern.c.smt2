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
(declare-fun inv_main2 (Heap Int) Bool)
(declare-fun inv_main20 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main22 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main28 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main36 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main38 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main43 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main45 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main47 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 0))) (inv_main2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 AddrRange) (var17 Int) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main22 var18 var17 var16 var15 var14 var13 var12 var11 var10) (= var0 (+ var8 1))) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var8 var14)) (= var5 var15)) (= var6 var16)) (= var9 var17)) (= var7 (writeHeap var18 (nthAddrRange var15 var14) (O_Int 0)))) (is-O_Int (readHeap var18 (nthAddrRange var15 var14)))) (is-O_Int (readHeap var18 (nthAddrRange var15 var14)))) (<= 0 (+ (+ (* (- 1) (+ var8 1)) var9) (* (- 1) 1))))) (inv_main20 var7 var9 var6 var5 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Heap) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (and (batchAllocPostHeap emptyHeap var10 (O_Int var9) var8) (batchAllocPostHeap emptyHeap var16 (O_Int var15) var14)) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var19 var18) (= var2 0)) (= var3 (* (- 1) 1))) (= var4 0)) (or (and (<= 0 (+ var5 (* (- 1) 1))) (= var7 1)) (and (not (<= 0 (+ var5 (* (- 1) 1)))) (= var7 0)))) (= var8 var5)) (= var6 var19)) (not (= var7 0))) (= var12 (AddrRange (ite (<= 0 (+ var8 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var8))) (= var14 var8)) true) (= var11 (AddrRange (ite (<= 0 (+ var14 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var14))) (= var13 var12)) (= var17 var14)) true) (<= 0 (+ var17 (* (- 1) 1)))))) (inv_main20 var16 var17 var13 var11 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Heap) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var19 var18) (= var2 0)) (= var3 (* (- 1) 1))) (= var4 0)) (or (and (<= 0 (+ var5 (* (- 1) 1))) (= var7 1)) (and (not (<= 0 (+ var5 (* (- 1) 1)))) (= var7 0)))) (= var8 var5)) (= var6 var19)) (not (= var7 0))) (= var12 (AddrRange (ite (<= 0 (+ var8 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var8))) (= var14 var8)) true) (= var11 (AddrRange (ite (<= 0 (+ var14 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var14))) (= var13 var12)) (= var17 var14)) true) (<= 0 (+ var17 (* (- 1) 1))))) (batchAllocHeap emptyHeap emptyHeap (O_Int var9) var8 var8))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Heap) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var19 var18) (= var2 0)) (= var3 (* (- 1) 1))) (= var4 0)) (or (and (<= 0 (+ var5 (* (- 1) 1))) (= var7 1)) (and (not (<= 0 (+ var5 (* (- 1) 1)))) (= var7 0)))) (= var8 var5)) (= var6 var19)) (not (= var7 0))) (= var12 (AddrRange (ite (<= 0 (+ var8 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var8))) (= var14 var8)) true) (= var11 (AddrRange (ite (<= 0 (+ var14 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var14))) (= var13 var12)) (= var17 var14)) true) (<= 0 (+ var17 (* (- 1) 1))))) (batchAllocHeap emptyHeap emptyHeap (O_Int var15) var14 var14))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 Int) (var16 Int) (var17 Heap) (var18 Heap) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Int) (var27 AddrRange) (var28 AddrRange) (var29 Int) (var30 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main38 var30 var29 var28 var27 var26 var25 var24 var23 var22 var21) (= var0 var22)) (= var1 var23)) (= var5 var24)) (= var7 var25)) (= var9 var26)) (= var11 var27)) (= var13 var28)) (= var15 var29)) (= var17 (writeHeap var30 (nthAddrRange var27 var22) (O_Int var21)))) (is-O_Int (readHeap var30 (nthAddrRange var27 var22)))) (is-O_Int (readHeap var30 (nthAddrRange var27 var22)))) (not (= var3 0))) (or (and (<= 0 (+ (+ (* (- 1) var19) var15) (* (- 1) 1))) (= var20 1)) (and (not (<= 0 (+ (+ (* (- 1) var19) var15) (* (- 1) 1)))) (= var20 0)))) (= var2 var19)) (= var4 var3)) (= var6 var5)) (= var8 var7)) (= var10 var9)) (= var12 var11)) (= var14 var13)) (= var16 var15)) (= var18 var17)) (<= 0 var19)) (not (= var20 0)))) (inv_main28 var18 var16 var14 var12 var10 var8 var6 var4 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Heap) (var17 Heap) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 AddrRange) (var26 AddrRange) (var27 Int) (var28 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main22 var28 var27 var26 var25 var24 var23 var22 var21 var20) (= var0 var20)) (= var3 var21)) (= var5 var22)) (= var7 var23)) (= var1 var24)) (= var10 var25)) (= var12 var26)) (= var14 var27)) (= var16 (writeHeap var28 (nthAddrRange var25 var24) (O_Int 0)))) (is-O_Int (readHeap var28 (nthAddrRange var25 var24)))) (is-O_Int (readHeap var28 (nthAddrRange var25 var24)))) (not (<= 0 (+ (+ (* (- 1) (+ var1 1)) var14) (* (- 1) 1))))) (or (and (<= 0 (+ (+ (* (- 1) var18) var14) (* (- 1) 1))) (= var19 1)) (and (not (<= 0 (+ (+ (* (- 1) var18) var14) (* (- 1) 1)))) (= var19 0)))) (= var2 var18)) (= var4 var3)) (= var6 var5)) (= var8 var7)) (= var9 1)) (= var11 var10)) (= var13 var12)) (= var15 var14)) (= var17 var16)) (<= 0 var18)) (not (= var19 0)))) (inv_main28 var17 var15 var13 var11 var9 var8 var6 var4 var2))))
(assert (forall ((var0 Int) (var1 Heap) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Int) (var21 Heap) (var22 Heap) (var23 Int) (var24 Int) (var25 Int) (var26 Heap)) (or (not (and (and (batchAllocPostHeap emptyHeap var5 (O_Int var4) var3) (batchAllocPostHeap emptyHeap var21 (O_Int var8) var7)) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var26 var25) (or (and (<= 0 (+ var0 (* (- 1) 1))) (= var2 1)) (and (not (<= 0 (+ var0 (* (- 1) 1)))) (= var2 0)))) (= var3 var0)) (= var1 var26)) (not (= var2 0))) (= var6 (AddrRange (ite (<= 0 (+ var3 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var3))) (= var7 var3)) true) (= var15 (AddrRange (ite (<= 0 (+ var7 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var7))) (= var17 var6)) (= var19 var7)) true) (not (<= 0 (+ var19 (* (- 1) 1))))) (or (and (<= 0 (+ (+ (* (- 1) var23) var19) (* (- 1) 1))) (= var24 1)) (and (not (<= 0 (+ (+ (* (- 1) var23) var19) (* (- 1) 1)))) (= var24 0)))) (= var9 var23)) (= var11 var10)) (= var12 0)) (= var13 (* (- 1) 1))) (= var14 1)) (= var16 var15)) (= var18 var17)) (= var20 var19)) (= var22 var21)) (<= 0 var23)) (not (= var24 0))))) (inv_main28 var22 var20 var18 var16 var14 var13 var12 var11 var9))))
(assert (forall ((var0 Int) (var1 Heap) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Int) (var21 Heap) (var22 Heap) (var23 Int) (var24 Int) (var25 Int) (var26 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var26 var25) (or (and (<= 0 (+ var0 (* (- 1) 1))) (= var2 1)) (and (not (<= 0 (+ var0 (* (- 1) 1)))) (= var2 0)))) (= var3 var0)) (= var1 var26)) (not (= var2 0))) (= var6 (AddrRange (ite (<= 0 (+ var3 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var3))) (= var7 var3)) true) (= var15 (AddrRange (ite (<= 0 (+ var7 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var7))) (= var17 var6)) (= var19 var7)) true) (not (<= 0 (+ var19 (* (- 1) 1))))) (or (and (<= 0 (+ (+ (* (- 1) var23) var19) (* (- 1) 1))) (= var24 1)) (and (not (<= 0 (+ (+ (* (- 1) var23) var19) (* (- 1) 1)))) (= var24 0)))) (= var9 var23)) (= var11 var10)) (= var12 0)) (= var13 (* (- 1) 1))) (= var14 1)) (= var16 var15)) (= var18 var17)) (= var20 var19)) (= var22 var21)) (<= 0 var23)) (not (= var24 0)))) (batchAllocHeap emptyHeap emptyHeap (O_Int var4) var3 var3))))
(assert (forall ((var0 Int) (var1 Heap) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Int) (var21 Heap) (var22 Heap) (var23 Int) (var24 Int) (var25 Int) (var26 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main2 var26 var25) (or (and (<= 0 (+ var0 (* (- 1) 1))) (= var2 1)) (and (not (<= 0 (+ var0 (* (- 1) 1)))) (= var2 0)))) (= var3 var0)) (= var1 var26)) (not (= var2 0))) (= var6 (AddrRange (ite (<= 0 (+ var3 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var3))) (= var7 var3)) true) (= var15 (AddrRange (ite (<= 0 (+ var7 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var7))) (= var17 var6)) (= var19 var7)) true) (not (<= 0 (+ var19 (* (- 1) 1))))) (or (and (<= 0 (+ (+ (* (- 1) var23) var19) (* (- 1) 1))) (= var24 1)) (and (not (<= 0 (+ (+ (* (- 1) var23) var19) (* (- 1) 1)))) (= var24 0)))) (= var9 var23)) (= var11 var10)) (= var12 0)) (= var13 (* (- 1) 1))) (= var14 1)) (= var16 var15)) (= var18 var17)) (= var20 var19)) (= var22 var21)) (<= 0 var23)) (not (= var24 0)))) (batchAllocHeap emptyHeap emptyHeap (O_Int var8) var7 var7))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main38 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 0)) (= var1 var12)) (= var2 var13)) (= var3 var14)) (= var4 var15)) (= var5 var16)) (= var6 var17)) (= var7 var18)) (= var10 var19)) (= var8 (writeHeap var20 (nthAddrRange var17 var12) (O_Int var11)))) (is-O_Int (readHeap var20 (nthAddrRange var17 var12)))) (is-O_Int (readHeap var20 (nthAddrRange var17 var12)))) (= var9 0)) (not (<= 0 (+ var10 (* (- 1) 1)))))) (inv_main43 var8 var10 var7 var6 var0 var4 var3 var9 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main47 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 (+ var9 1))) (= var1 (+ var11 (getInt (readHeap var20 (nthAddrRange var17 var16)))))) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var9 var16)) (= var6 var17)) (= var7 var18)) (= var10 var19)) (= var8 var20)) (is-O_Int (readHeap var20 (nthAddrRange var17 var16)))) (not (<= 0 (+ (+ (* (- 1) (+ var9 1)) var10) (* (- 1) 1)))))) (inv_main43 var8 var10 var7 var6 var0 var5 var1 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main38 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 0)) (= var1 var12)) (= var2 var13)) (= var3 var14)) (= var4 var15)) (= var5 var16)) (= var6 var17)) (= var7 var18)) (= var10 var19)) (= var8 (writeHeap var20 (nthAddrRange var17 var12) (O_Int var11)))) (is-O_Int (readHeap var20 (nthAddrRange var17 var12)))) (is-O_Int (readHeap var20 (nthAddrRange var17 var12)))) (= var9 0)) (<= 0 (+ var10 (* (- 1) 1))))) (inv_main45 var8 var10 var7 var6 var0 var4 var3 var9 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main47 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 (+ var9 1))) (= var1 (+ var11 (getInt (readHeap var20 (nthAddrRange var17 var16)))))) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var9 var16)) (= var6 var17)) (= var7 var18)) (= var10 var19)) (= var8 var20)) (is-O_Int (readHeap var20 (nthAddrRange var17 var16)))) (<= 0 (+ (+ (* (- 1) (+ var9 1)) var10) (* (- 1) 1))))) (inv_main45 var8 var10 var7 var6 var0 var5 var1 var3 var2))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (or (not (and (and (and (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var9 (nthAddrRange var7 var5) (O_Int 0)))) (is-O_Int (readHeap var9 (nthAddrRange var7 var5)))) (is-O_Int (readHeap var9 (nthAddrRange var7 var5))))) (inv_main22 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (or (not (and (and (and (inv_main28 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var9 (nthAddrRange var7 var1) (O_Int (* (* var4 var5) var4))))) (is-O_Int (readHeap var9 (nthAddrRange var7 var1)))) (is-O_Int (readHeap var9 (nthAddrRange var7 var1))))) (inv_main36 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (or (not (and (and (inv_main45 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var3 (getInt (readHeap var9 (nthAddrRange var7 var5)))))) (is-O_Int (readHeap var9 (nthAddrRange var7 var5))))) (inv_main47 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int)) (or (not (and (and (and (and (and (and (and (and (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var9 (nthAddrRange var6 var1))))) (is-O_Int (readHeap var9 (nthAddrRange var6 var1)))) (= var10 0)) (= var1 (+ (* 2 var11) var10))) (or (not (<= 0 (+ (* (- 1) var10) (* (- 1) 1)))) (<= 0 (+ (* (- 1) var1) (* (- 1) 1))))) (or (not (<= 0 (+ var10 (* (- 1) 1)))) (<= 0 (+ var1 (* (- 1) 1))))) (<= 0 (+ (+ (* 1 var10) 2) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) var10) 2) (* (- 1) 1))))) (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int)) (or (not (and (and (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (* var4 var5))) (not (or (not (and (and (and (and (or (not (<= 0 (+ (* (- 1) var10) (* (- 1) 1)))) (<= 0 (+ (* (- 1) var1) (* (- 1) 1)))) (or (not (<= 0 (+ var10 (* (- 1) 1)))) (<= 0 (+ var1 (* (- 1) 1))))) (<= 0 (+ (+ (* 1 var10) 2) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) var10) 2) (* (- 1) 1)))) (= var1 (+ (* 2 var11) var10)))) (= var10 0))))) (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main20 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var6 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (and (inv_main20 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var6 (nthAddrRange var6 var4)))) (is-O_Int (readHeap var8 (nthAddrRange var6 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (and (inv_main20 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var6 var4))))) (is-O_Int (readHeap var8 (nthAddrRange var6 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main22 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (and (inv_main22 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var4)))) (is-O_Int (readHeap var8 (nthAddrRange var5 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (and (inv_main22 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var5 var4))))) (is-O_Int (readHeap var8 (nthAddrRange var5 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var6 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var6 (nthAddrRange var6 var0)))) (is-O_Int (readHeap var8 (nthAddrRange var6 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var6 var0))))) (is-O_Int (readHeap var8 (nthAddrRange var6 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int)) (not (and (and (and (and (and (and (and (inv_main36 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var5 var0))))) (= var9 0)) (= var0 (+ (* 2 var10) var9))) (or (not (<= 0 (+ (* (- 1) var9) (* (- 1) 1)))) (<= 0 (+ (* (- 1) var0) (* (- 1) 1))))) (or (not (<= 0 (+ var9 (* (- 1) 1)))) (<= 0 (+ var0 (* (- 1) 1))))) (<= 0 (+ (+ (* 1 var9) 2) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) var9) 2) (* (- 1) 1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int)) (not (and (and (and (and (and (and (and (and (inv_main36 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var5 (nthAddrRange var5 var0)))) (is-O_Int (readHeap var8 (nthAddrRange var5 var0)))) (= var9 0)) (= var0 (+ (* 2 var10) var9))) (or (not (<= 0 (+ (* (- 1) var9) (* (- 1) 1)))) (<= 0 (+ (* (- 1) var0) (* (- 1) 1))))) (or (not (<= 0 (+ var9 (* (- 1) 1)))) (<= 0 (+ var0 (* (- 1) 1))))) (<= 0 (+ (+ (* 1 var9) 2) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) var9) 2) (* (- 1) 1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var9 (nthAddrRange var6 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var6 (nthAddrRange var6 var1)))) (is-O_Int (readHeap var9 (nthAddrRange var6 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var9 (nthAddrRange var6 var1))))) (is-O_Int (readHeap var9 (nthAddrRange var6 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main45 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var8 (nthAddrRange var6 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (and (inv_main45 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var6 (nthAddrRange var6 var4)))) (is-O_Int (readHeap var8 (nthAddrRange var6 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main47 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var9 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (and (inv_main47 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var6 (nthAddrRange var6 var5)))) (is-O_Int (readHeap var9 (nthAddrRange var6 var5)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main43 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ 1 var7) (* (- 2) var2))))))))
(check-sat)
