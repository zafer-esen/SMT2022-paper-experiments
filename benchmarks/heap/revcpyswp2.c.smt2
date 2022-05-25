(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
(declare-heap Heap Addr HeapObject
 defObj
 ((HeapObject 0)) (
  (
   (O_Int (getInt Int))
   (O_UInt (getUInt Int))
   (O_Addr (getAddr Addr))
   (defObj)
  )
))
(declare-fun inv_main2 (Heap Int Int) Bool)
(declare-fun inv_main23 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main24 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main26 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main30 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main31 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main32 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main33 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main36 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main38 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main40 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main41 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main43 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main44 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main46 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main48 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main49 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main51 (Heap Int Int Int Int AddrRange AddrRange AddrRange AddrRange) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var2 emptyHeap) (= var1 0)) (= var0 100000))) (inv_main2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main36 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (is-O_Int (read var18 (nthAddrRange var13 var15))) (and (and (and (and (and (and (and (and (and (= var9 var18) (= var8 var17)) (= var7 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 (getInt (read var18 (nthAddrRange var13 var15)))))))) (inv_main38 var9 var8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main24 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (<= 0 (+ (+ var10 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var19 (nthAddrRange var11 var16))) (is-O_Int (read var19 (nthAddrRange var11 var16)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var11 var16) (O_Int var7))) (= var10 var18)) (= var6 var17)) (= var9 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)))) (= var0 (+ var9 1))))) (inv_main23 var8 var10 var6 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Heap) (var24 AddrRange) (var25 AddrRange) (var26 AddrRange) (var27 AddrRange) (var28 AddrRange) (var29 AddrRange) (var30 AddrRange) (var31 Int) (var32 Int) (var33 Int) (var34 Int) (var35 Int) (var36 Int) (var37 Int) (var38 Int) (var39 Heap) (var40 Heap) (var41 Int) (var42 Int) (var43 Int) (var44 Heap)) (or (not (and (inv_main2 var44 var43 var42) (and (and (and (and (and (and (<= 0 (+ var41 (- 1))) (and (and (and (and (and (and (and (and (= var40 (newBatchHeap (batchAlloc var39 (O_Int var38) var37))) (= var41 var37)) (= var36 var35)) (= var34 var33)) (= var32 var31)) (= var30 var29)) (= var28 var27)) (= var26 var25)) (= var24 (newAddrRange (batchAlloc var39 (O_Int var38) var37))))) (and (and (and (and (and (and (and (= var39 (newBatchHeap (batchAlloc var23 (O_Int var22) var21))) (= var37 var21)) (= var35 var20)) (= var33 var19)) (= var31 var18)) (= var29 var17)) (= var27 var16)) (= var25 (newAddrRange (batchAlloc var23 (O_Int var22) var21))))) (and (and (and (and (and (and (= var23 (newBatchHeap (batchAlloc var15 (O_Int var14) var13))) (= var21 var13)) (= var20 var12)) (= var19 var11)) (= var18 var10)) (= var17 var9)) (= var16 (newAddrRange (batchAlloc var15 (O_Int var14) var13))))) (and (and (and (and (and (= var15 (newBatchHeap (batchAlloc var8 (O_Int var7) var6))) (= var13 var6)) (= var12 var5)) (= var11 var4)) (= var10 var3)) (= var9 (newAddrRange (batchAlloc var8 (O_Int var7) var6))))) (and (not (= var2 0)) (and (<= 0 (+ (+ var1 (- 1)) (- 1))) (and (and (and (= var8 var44) (= var6 var1)) (= var5 var42)) (or (and (<= 0 (+ (+ var42 (* (- 1) var1)) (- 1))) (= var2 1)) (and (not (<= 0 (+ (+ var42 (* (- 1) var1)) (- 1)))) (= var2 0))))))) (= var0 0)))) (inv_main23 var40 var41 var36 var0 var32 var30 var28 var26 var24))))
(assert (forall ((var0 Heap) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main41 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var10 (nthAddrRange var5 var7))) (is-O_Int (read var10 (nthAddrRange var5 var7)))) (= var0 (write var10 (nthAddrRange var5 var7) (O_Int var1)))))) (inv_main40 var0 var9 var8 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main32 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var10 (nthAddrRange var2 (+ (+ var1 (* (- 1) var7)) (- 1))))) (= var0 (getInt (read var10 (nthAddrRange var2 (+ (+ var1 (* (- 1) var7)) (- 1))))))))) (inv_main33 var10 var9 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main49 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var10 (nthAddrRange var5 var7))) (is-O_Int (read var10 (nthAddrRange var5 var7)))) (= var0 (write var10 (nthAddrRange var5 var7) (O_Int var1)))))) (inv_main48 var0 var9 var8 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main48 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (and (is-O_Int (read var18 (nthAddrRange var12 var15))) (is-O_Int (read var18 (nthAddrRange var12 var15)))) (and (and (and (and (and (and (and (and (= var9 (write var18 (nthAddrRange var12 var15) (O_Int var14))) (= var8 var17)) (= var7 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10))) (= var0 (+ var6 1))))) (inv_main43 var9 var8 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main26 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var8 (- 1)))) (not (<= 0 (+ (+ var8 (* (- 1) var6)) (- 1))))) (= var0 0)))) (inv_main43 var9 var8 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main40 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ (+ var9 (* (- 1) (+ var8 1))) (- 1)))) (and (and (is-O_Int (read var18 (nthAddrRange var12 var15))) (is-O_Int (read var18 (nthAddrRange var12 var15)))) (and (and (and (and (and (and (and (and (= var7 (write var18 (nthAddrRange var12 var15) (O_Int var14))) (= var9 var17)) (= var6 var16)) (= var8 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)))) (= var0 0)))) (inv_main43 var7 var9 var6 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main46 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var3 var6))) (= var0 (getInt (read var9 (nthAddrRange var3 var6))))))) (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main31 var18 var17 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (is-O_Int (read var18 (nthAddrRange var13 var15))) (is-O_Int (read var18 (nthAddrRange var13 var15)))) (and (and (and (and (and (and (and (and (= var8 (write var18 (nthAddrRange var13 var15) (O_Int var9))) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10))))) (inv_main32 var8 var7 var6 var5 var4 var3 var2 var1 var0 var7))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main23 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (is-O_Int (read var18 (nthAddrRange var11 var15))) (is-O_Int (read var18 (nthAddrRange var11 var15)))) (and (and (and (and (and (and (and (and (= var9 (write var18 (nthAddrRange var11 var15) (O_Int var8))) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10))))) (inv_main24 var9 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var3 var6))) (= var0 (getInt (read var9 (nthAddrRange var3 var6))))))) (inv_main41 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main43 var8 var7 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ var7 (* (- 1) var5)) (- 1))))) (inv_main44 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main43 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var8 (- 1))) (not (<= 0 (+ (+ var8 (* (- 1) var6)) (- 1))))) (= var0 0)))) (inv_main51 var9 var8 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main51 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var8 (* (- 1) (+ var6 1))) (- 1))) (and (is-O_Int (read var9 (nthAddrRange var4 var6))) (is-O_Int (read var9 (nthAddrRange var2 (+ (+ var8 (* (- 1) var6)) (- 1))))))) (= var0 (+ var6 1))))) (inv_main51 var9 var8 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main44 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (is-O_Int (read var18 (nthAddrRange var13 var15))) (and (and (and (and (and (and (and (and (and (= var9 var18) (= var8 var17)) (= var7 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 (getInt (read var18 (nthAddrRange var13 var15)))))))) (inv_main46 var9 var8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main26 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var8 (- 1))) (not (<= 0 (+ (+ var8 (* (- 1) var6)) (- 1))))) (= var0 0)))) (inv_main36 var9 var8 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main40 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ var9 (* (- 1) (+ var8 1))) (- 1))) (and (and (is-O_Int (read var18 (nthAddrRange var12 var15))) (is-O_Int (read var18 (nthAddrRange var12 var15)))) (and (and (and (and (and (and (and (and (= var7 (write var18 (nthAddrRange var12 var15) (O_Int var14))) (= var9 var17)) (= var6 var16)) (= var8 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)))) (= var0 (+ var8 1))))) (inv_main36 var7 var9 var6 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main26 var8 var7 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ var7 (* (- 1) var5)) (- 1))))) (inv_main30 var8 var7 var6 var5 var4 var3 var2 var1 var0 var7))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main33 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (and (is-O_Int (read var19 (nthAddrRange var13 var16))) (is-O_Int (read var19 (nthAddrRange var13 var16)))) (and (and (and (and (and (and (and (and (= var9 (write var19 (nthAddrRange var13 var16) (O_Int var10))) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11))) (= var0 (+ var6 1))))) (inv_main26 var9 var8 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main24 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (not (<= 0 (+ (+ var10 (* (- 1) (+ var9 1))) (- 1)))) (and (and (is-O_Int (read var19 (nthAddrRange var11 var16))) (is-O_Int (read var19 (nthAddrRange var11 var16)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var11 var16) (O_Int var7))) (= var10 var18)) (= var6 var17)) (= var9 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)))) (= var0 0)))) (inv_main26 var8 var10 var6 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Heap) (var24 AddrRange) (var25 AddrRange) (var26 AddrRange) (var27 AddrRange) (var28 AddrRange) (var29 AddrRange) (var30 AddrRange) (var31 Int) (var32 Int) (var33 Int) (var34 Int) (var35 Int) (var36 Int) (var37 Int) (var38 Int) (var39 Heap) (var40 Heap) (var41 Int) (var42 Int) (var43 Int) (var44 Heap)) (or (not (and (inv_main2 var44 var43 var42) (and (and (and (and (and (and (not (<= 0 (+ var41 (- 1)))) (and (and (and (and (and (and (and (and (= var40 (newBatchHeap (batchAlloc var39 (O_Int var38) var37))) (= var41 var37)) (= var36 var35)) (= var34 var33)) (= var32 var31)) (= var30 var29)) (= var28 var27)) (= var26 var25)) (= var24 (newAddrRange (batchAlloc var39 (O_Int var38) var37))))) (and (and (and (and (and (and (and (= var39 (newBatchHeap (batchAlloc var23 (O_Int var22) var21))) (= var37 var21)) (= var35 var20)) (= var33 var19)) (= var31 var18)) (= var29 var17)) (= var27 var16)) (= var25 (newAddrRange (batchAlloc var23 (O_Int var22) var21))))) (and (and (and (and (and (and (= var23 (newBatchHeap (batchAlloc var15 (O_Int var14) var13))) (= var21 var13)) (= var20 var12)) (= var19 var11)) (= var18 var10)) (= var17 var9)) (= var16 (newAddrRange (batchAlloc var15 (O_Int var14) var13))))) (and (and (and (and (and (= var15 (newBatchHeap (batchAlloc var8 (O_Int var7) var6))) (= var13 var6)) (= var12 var5)) (= var11 var4)) (= var10 var3)) (= var9 (newAddrRange (batchAlloc var8 (O_Int var7) var6))))) (and (not (= var2 0)) (and (<= 0 (+ (+ var1 (- 1)) (- 1))) (and (and (and (= var8 var44) (= var6 var1)) (= var5 var42)) (or (and (<= 0 (+ (+ var42 (* (- 1) var1)) (- 1))) (= var2 1)) (and (not (<= 0 (+ (+ var42 (* (- 1) var1)) (- 1)))) (= var2 0))))))) (= var0 0)))) (inv_main26 var40 var41 var36 var0 var32 var30 var28 var26 var24))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main30 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var10 (nthAddrRange var3 (+ (+ var1 (* (- 1) var7)) (- 1))))) (= var0 (getInt (read var10 (nthAddrRange var3 (+ (+ var1 (* (- 1) var7)) (- 1))))))))) (inv_main31 var10 var9 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var1 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var1 var5))) (not (within var1 (nthAddrRange var1 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var1 var5))) (not (is-O_Int (read var8 (nthAddrRange var1 var5)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main24 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var0 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main24 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var5))) (not (within var0 (nthAddrRange var0 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main24 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var5))) (not (is-O_Int (read var8 (nthAddrRange var0 var5)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main30 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var2 (+ (+ var0 (* (- 1) var6)) (- 1))))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main30 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var2 (+ (+ var0 (* (- 1) var6)) (- 1))))) (not (within var2 (nthAddrRange var2 (+ (+ var0 (* (- 1) var6)) (- 1))))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main31 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var4 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main31 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var4 var6))) (not (within var4 (nthAddrRange var4 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main31 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var4 var6))) (not (is-O_Int (read var9 (nthAddrRange var4 var6)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main32 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var1 (+ (+ var0 (* (- 1) var6)) (- 1))))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main32 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var1 (+ (+ var0 (* (- 1) var6)) (- 1))))) (not (within var1 (nthAddrRange var1 (+ (+ var0 (* (- 1) var6)) (- 1))))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main33 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var3 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main33 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var3 var6))) (not (within var3 (nthAddrRange var3 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main33 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var3 var6))) (not (is-O_Int (read var9 (nthAddrRange var3 var6)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main36 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var3 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main36 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var3 var5))) (not (within var3 (nthAddrRange var3 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main38 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main38 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var2 var5))) (not (within var2 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main41 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var4 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main41 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var4 var6))) (not (within var4 (nthAddrRange var4 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main41 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var4 var6))) (not (is-O_Int (read var9 (nthAddrRange var4 var6)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main40 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main40 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var2 var5))) (not (within var2 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main40 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var2 var5))) (not (is-O_Int (read var8 (nthAddrRange var2 var5)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main44 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var3 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main44 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var3 var5))) (not (within var3 (nthAddrRange var3 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main46 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main46 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var2 var5))) (not (within var2 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var4 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var4 var6))) (not (within var4 (nthAddrRange var4 var6))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var4 var6))) (not (is-O_Int (read var9 (nthAddrRange var4 var6)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main48 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main48 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var2 var5))) (not (within var2 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main48 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var2 var5))) (not (is-O_Int (read var8 (nthAddrRange var2 var5)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var3 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var3 (nthAddrRange var3 var5)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var1 (+ (+ var7 (* (- 1) var5)) (- 1))))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var1 (nthAddrRange var1 (+ (+ var7 (* (- 1) var5)) (- 1)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var3 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var3 var5))) (not (within var3 (nthAddrRange var3 var5))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var3 var5))) (not (is-O_Int (read var8 (nthAddrRange var1 (+ (+ var7 (* (- 1) var5)) (- 1)))))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var8 (nthAddrRange var3 var5))) (is-O_Int (read var8 (nthAddrRange var1 (+ (+ var7 (* (- 1) var5)) (- 1)))))) (not (within var1 (nthAddrRange var1 (+ (+ var7 (* (- 1) var5)) (- 1))))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main51 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var8 (nthAddrRange var3 var5))) (is-O_Int (read var8 (nthAddrRange var1 (+ (+ var7 (* (- 1) var5)) (- 1)))))) (not (= (getInt (read var8 (nthAddrRange var3 var5))) (getInt (read var8 (nthAddrRange var1 (+ (+ var7 (* (- 1) var5)) (- 1))))))))))))
(check-sat)