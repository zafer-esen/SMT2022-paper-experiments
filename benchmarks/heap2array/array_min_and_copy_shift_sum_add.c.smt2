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
(declare-fun inv_main25 (Heap Int Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main27 (Heap Int Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main28 (Heap Int Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main3 (Heap Int) Bool)
(declare-fun inv_main36 (Heap Int Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main40 (Heap Int Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main41 (Heap Int Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main43 (Heap Int Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main44 (Heap Int Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main46 (Heap Int Int Int Int AddrRange AddrRange) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (= var1 emptyHeap)) (inv_main3 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main43 var15 var14 var13 var12 var11 var10 var9 var8) (= var0 (+ var6 1))) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 (writeHeap var15 (nthAddrRange var9 var14) (O_Int (+ var8 (* (- 1) var13)))))) (is-O_Int (readHeap var15 (nthAddrRange var9 var14)))) (is-O_Int (readHeap var15 (nthAddrRange var9 var14))))) (inv_main40 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main36 var15 var14 var13 var12 var11 var10 var9) (= var0 0)) (= var1 (getInt (readHeap var15 (nthAddrRange var10 var14))))) (= var2 var9)) (= var3 var10)) (= var8 var11)) (= var4 var12)) (= var5 var13)) (= var7 var14)) (= var6 var15)) (is-O_Int (readHeap var15 (nthAddrRange var10 var14)))) (not (<= 0 (+ (+ (* (- 1) (+ var7 1)) var8) (* (- 1) 1)))))) (inv_main40 var6 var0 var1 var4 var8 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (and (inv_main27 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) (getInt (readHeap var7 (nthAddrRange var2 var6)))) var5) (* (- 1) 1))))) (is-O_Int (readHeap var7 (nthAddrRange var2 var6)))) (not (<= 0 (+ (+ (* (- 1) (+ var6 1)) var3) (* (- 1) 1)))))) (inv_main40 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Heap) (var27 Int) (var28 Int) (var29 Heap)) (or (not (and (and (batchAllocPostHeap emptyHeap var14 (O_Int var13) (+ var12 1)) (batchAllocPostHeap emptyHeap var26 (O_Int var25) var24)) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var29 var28) (= var0 0)) (or (and (and (<= 0 (+ (+ 10000 var1) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1)))) (= var2 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var1) (* (- 1) 1))))) (= var2 0)))) (= var4 var1)) (= var5 var28)) (= var6 var29)) (not (= var2 0))) (or (and (and (<= 0 (+ (+ 10000 var3) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1)))) (= var8 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var3) (* (- 1) 1))))) (= var8 0)))) (= var12 var3)) (= var9 0)) (= var10 var4)) (= var11 var5)) (= var7 var6)) (not (= var8 0))) (= var16 (AddrRange (ite (<= 0 (+ (+ var12 1) (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) (+ var12 1)))) (= var24 var12)) (= var18 var9)) (= var20 var10)) (= var22 var11)) true) (= var15 (AddrRange (ite (<= 0 (+ var24 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var24))) (= var17 var16)) (= var27 var24)) (= var19 var18)) (= var21 var20)) (= var23 var22)) true) (not (<= 0 (+ var27 (* (- 1) 1))))))) (inv_main40 var26 var0 var21 var19 var27 var17 var15))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Heap) (var27 Int) (var28 Int) (var29 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var29 var28) (= var0 0)) (or (and (and (<= 0 (+ (+ 10000 var1) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1)))) (= var2 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var1) (* (- 1) 1))))) (= var2 0)))) (= var4 var1)) (= var5 var28)) (= var6 var29)) (not (= var2 0))) (or (and (and (<= 0 (+ (+ 10000 var3) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1)))) (= var8 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var3) (* (- 1) 1))))) (= var8 0)))) (= var12 var3)) (= var9 0)) (= var10 var4)) (= var11 var5)) (= var7 var6)) (not (= var8 0))) (= var16 (AddrRange (ite (<= 0 (+ (+ var12 1) (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) (+ var12 1)))) (= var24 var12)) (= var18 var9)) (= var20 var10)) (= var22 var11)) true) (= var15 (AddrRange (ite (<= 0 (+ var24 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var24))) (= var17 var16)) (= var27 var24)) (= var19 var18)) (= var21 var20)) (= var23 var22)) true) (not (<= 0 (+ var27 (* (- 1) 1)))))) (batchAllocHeap emptyHeap emptyHeap (O_Int var13) (+ var12 1) (+ var12 1)))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Heap) (var27 Int) (var28 Int) (var29 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var29 var28) (= var0 0)) (or (and (and (<= 0 (+ (+ 10000 var1) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1)))) (= var2 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var1) (* (- 1) 1))))) (= var2 0)))) (= var4 var1)) (= var5 var28)) (= var6 var29)) (not (= var2 0))) (or (and (and (<= 0 (+ (+ 10000 var3) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1)))) (= var8 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var3) (* (- 1) 1))))) (= var8 0)))) (= var12 var3)) (= var9 0)) (= var10 var4)) (= var11 var5)) (= var7 var6)) (not (= var8 0))) (= var16 (AddrRange (ite (<= 0 (+ (+ var12 1) (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) (+ var12 1)))) (= var24 var12)) (= var18 var9)) (= var20 var10)) (= var22 var11)) true) (= var15 (AddrRange (ite (<= 0 (+ var24 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var24))) (= var17 var16)) (= var27 var24)) (= var19 var18)) (= var21 var20)) (= var23 var22)) true) (not (<= 0 (+ var27 (* (- 1) 1)))))) (batchAllocHeap emptyHeap emptyHeap (O_Int var25) var24 var24))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main40 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var6) var3) (* (- 1) 1))))) (<= 0 (+ var3 (* (- 1) 1))))) (inv_main46 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main46 var16 var15 var14 var13 var12 var11 var10) (= var0 (+ var2 var8))) (= var1 (+ var8 1))) (= var2 (+ var13 (getInt (readHeap var16 (nthAddrRange var10 var15)))))) (= var3 var10)) (= var4 var11)) (= var9 var12)) (= var5 var13)) (= var6 var14)) (= var8 var15)) (= var7 var16)) (is-O_Int (readHeap var16 (nthAddrRange var10 var15)))) (<= 0 (+ (+ (* (- 1) (+ var8 1)) var9) (* (- 1) 1))))) (inv_main46 var7 var1 var6 var0 var9 var4 var3))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main40 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var5) var2) (* (- 1) 1))))) (inv_main41 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main36 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var7 1))) (= var1 (getInt (readHeap var15 (nthAddrRange var10 var14))))) (= var2 var9)) (= var3 var10)) (= var8 var11)) (= var4 var12)) (= var5 var13)) (= var7 var14)) (= var6 var15)) (is-O_Int (readHeap var15 (nthAddrRange var10 var14)))) (<= 0 (+ (+ (* (- 1) (+ var7 1)) var8) (* (- 1) 1))))) (inv_main25 var6 var0 var1 var4 var8 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (and (inv_main27 var7 var6 var5 var4 var3 var2 var1) (= var0 (+ var6 1))) (not (<= 0 (+ (+ (* (- 1) (getInt (readHeap var7 (nthAddrRange var2 var6)))) var5) (* (- 1) 1))))) (is-O_Int (readHeap var7 (nthAddrRange var2 var6)))) (<= 0 (+ (+ (* (- 1) (+ var6 1)) var3) (* (- 1) 1))))) (inv_main25 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Heap) (var27 Int) (var28 Int) (var29 Heap)) (or (not (and (and (batchAllocPostHeap emptyHeap var14 (O_Int var13) (+ var12 1)) (batchAllocPostHeap emptyHeap var26 (O_Int var25) var24)) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var29 var28) (= var0 0)) (or (and (and (<= 0 (+ (+ 10000 var1) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1)))) (= var2 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var1) (* (- 1) 1))))) (= var2 0)))) (= var4 var1)) (= var5 var28)) (= var6 var29)) (not (= var2 0))) (or (and (and (<= 0 (+ (+ 10000 var3) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1)))) (= var8 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var3) (* (- 1) 1))))) (= var8 0)))) (= var12 var3)) (= var9 0)) (= var10 var4)) (= var11 var5)) (= var7 var6)) (not (= var8 0))) (= var16 (AddrRange (ite (<= 0 (+ (+ var12 1) (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) (+ var12 1)))) (= var24 var12)) (= var18 var9)) (= var20 var10)) (= var22 var11)) true) (= var15 (AddrRange (ite (<= 0 (+ var24 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var24))) (= var17 var16)) (= var27 var24)) (= var19 var18)) (= var21 var20)) (= var23 var22)) true) (<= 0 (+ var27 (* (- 1) 1)))))) (inv_main25 var26 var0 var21 var19 var27 var17 var15))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Heap) (var27 Int) (var28 Int) (var29 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var29 var28) (= var0 0)) (or (and (and (<= 0 (+ (+ 10000 var1) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1)))) (= var2 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var1) (* (- 1) 1))))) (= var2 0)))) (= var4 var1)) (= var5 var28)) (= var6 var29)) (not (= var2 0))) (or (and (and (<= 0 (+ (+ 10000 var3) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1)))) (= var8 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var3) (* (- 1) 1))))) (= var8 0)))) (= var12 var3)) (= var9 0)) (= var10 var4)) (= var11 var5)) (= var7 var6)) (not (= var8 0))) (= var16 (AddrRange (ite (<= 0 (+ (+ var12 1) (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) (+ var12 1)))) (= var24 var12)) (= var18 var9)) (= var20 var10)) (= var22 var11)) true) (= var15 (AddrRange (ite (<= 0 (+ var24 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var24))) (= var17 var16)) (= var27 var24)) (= var19 var18)) (= var21 var20)) (= var23 var22)) true) (<= 0 (+ var27 (* (- 1) 1))))) (batchAllocHeap emptyHeap emptyHeap (O_Int var13) (+ var12 1) (+ var12 1)))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Heap) (var27 Int) (var28 Int) (var29 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var29 var28) (= var0 0)) (or (and (and (<= 0 (+ (+ 10000 var1) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1)))) (= var2 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var1) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var1) (* (- 1) 1))))) (= var2 0)))) (= var4 var1)) (= var5 var28)) (= var6 var29)) (not (= var2 0))) (or (and (and (<= 0 (+ (+ 10000 var3) (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1)))) (= var8 1)) (and (not (and (<= 0 (+ (+ (* (- 1) var3) 10000) (* (- 1) 1))) (<= 0 (+ (+ 10000 var3) (* (- 1) 1))))) (= var8 0)))) (= var12 var3)) (= var9 0)) (= var10 var4)) (= var11 var5)) (= var7 var6)) (not (= var8 0))) (= var16 (AddrRange (ite (<= 0 (+ (+ var12 1) (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) (+ var12 1)))) (= var24 var12)) (= var18 var9)) (= var20 var10)) (= var22 var11)) true) (= var15 (AddrRange (ite (<= 0 (+ var24 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var24))) (= var17 var16)) (= var27 var24)) (= var19 var18)) (= var21 var20)) (= var23 var22)) true) (<= 0 (+ var27 (* (- 1) 1))))) (batchAllocHeap emptyHeap emptyHeap (O_Int var25) var24 var24))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (inv_main25 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var7 (nthAddrRange var2 var6))))) (is-O_Int (readHeap var7 (nthAddrRange var2 var6))))) (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main40 var7 var6 var5 var4 var3 var2 var1) (= var0 0)) (not (<= 0 (+ (+ (* (- 1) var6) var3) (* (- 1) 1))))) (not (<= 0 (+ var3 (* (- 1) 1)))))) (inv_main44 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main46 var16 var15 var14 var13 var12 var11 var10) (= var0 (+ var2 var8))) (= var1 (+ var8 1))) (= var2 (+ var13 (getInt (readHeap var16 (nthAddrRange var10 var15)))))) (= var3 var10)) (= var4 var11)) (= var9 var12)) (= var5 var13)) (= var6 var14)) (= var8 var15)) (= var7 var16)) (is-O_Int (readHeap var16 (nthAddrRange var10 var15)))) (not (<= 0 (+ (+ (* (- 1) (+ var8 1)) var9) (* (- 1) 1)))))) (inv_main44 var7 var1 var6 var0 var9 var4 var3))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (inv_main41 var7 var6 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var7 (nthAddrRange var2 var6))))) (is-O_Int (readHeap var7 (nthAddrRange var2 var6))))) (inv_main43 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main28 var23 var22 var21 var20 var19 var18 var17 var16) (or (and (<= 0 (+ (+ 10000 var7) (* (- 1) 1))) (= var15 1)) (and (not (<= 0 (+ (+ 10000 var7) (* (- 1) 1)))) (= var15 0)))) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 (getInt (readHeap var23 (nthAddrRange var18 var22))))) (= var8 var17)) (= var9 var18)) (= var10 var19)) (= var11 var20)) (= var12 var21)) (= var13 var22)) (= var14 var23)) (is-O_Int (readHeap var23 (nthAddrRange var18 var22)))) (<= 0 (+ (+ (* (- 1) var16) 10000) (* (- 1) 1)))) (not (= var15 0)))) (inv_main27 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (inv_main27 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) (getInt (readHeap var6 (nthAddrRange var1 var5)))) var4) (* (- 1) 1)))) (is-O_Int (readHeap var6 (nthAddrRange var1 var5))))) (inv_main36 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var1 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var1 var5)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var2 var6))))) (<= 0 (+ (+ (* (- 1) var0) 10000) (* (- 1) 1)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var6)))) (is-O_Int (readHeap var7 (nthAddrRange var2 var6)))) (<= 0 (+ (+ (* (- 1) var0) 10000) (* (- 1) 1)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main27 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var1 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main27 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var1 var5)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var1 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var1 var5)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main41 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var1 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main41 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var1 var5)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main43 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var1 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main43 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var6)))) (is-O_Int (readHeap var7 (nthAddrRange var1 var6)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main43 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var7 (nthAddrRange var1 var6))))) (is-O_Int (readHeap var7 (nthAddrRange var1 var6)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main46 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var0 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main46 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 var5)))) (is-O_Int (readHeap var6 (nthAddrRange var0 var5)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main44 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 var3))))))
(check-sat)