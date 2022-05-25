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
(declare-fun inv_main2 (Heap Int) Bool)
(declare-fun inv_main29 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main34 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main35 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main37 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main38 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main40 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main41 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main43 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main44 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main45 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main46 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main48 (Heap Int Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main51 (Heap Int Int Int AddrRange Int Int Int Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 0))) (inv_main2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main37 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ var9 (* (- 1) var8)))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))) (O_Int var13))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var9 var12)) (= var1 var11)) (= var0 var10))))) (inv_main41 var7 var6 var8 var5 var4 var3 var2 var9 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main38 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ var9 (* (- 1) var8)))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))) (O_Int 0))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var9 var12)) (= var1 var11)) (= var0 var10))))) (inv_main41 var7 var6 var8 var5 var4 var3 var2 var9 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main40 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (* (- 1) var8))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))) (O_Int var12))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)) (= var0 var10))))) (inv_main43 var7 var6 var8 var5 var4 var3 var2 var1 var9 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main41 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (* (- 1) var8))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))) (O_Int 0))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)) (= var0 var10))))) (inv_main43 var7 var6 var8 var5 var4 var3 var2 var1 var9 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main34 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (* (- 1) var8))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))) (O_Int var14))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var9 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10))))) (inv_main37 var7 var6 var8 var5 var4 var3 var9 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main35 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (* (- 1) var8))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))) (O_Int 0))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var9 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10))))) (inv_main37 var7 var6 var8 var5 var4 var3 var9 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main43 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ var9 (* (- 1) var8)))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))) (O_Int var11))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var0 var11)) (= var9 var10))))) (inv_main46 var7 var6 var8 var5 var4 var3 var2 var1 var0 var9))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main44 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ var9 (* (- 1) var8)))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))) (O_Int 0))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var0 var11)) (= var9 var10))))) (inv_main46 var7 var6 var8 var5 var4 var3 var2 var1 var0 var9))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main40 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ var9 (* (- 1) var8)))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))) (O_Int var12))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)) (= var0 var10))))) (inv_main44 var7 var6 var8 var5 var4 var3 var2 var1 var9 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main41 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ var9 (* (- 1) var8)))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 3))) (O_Int 0))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)) (= var0 var10))))) (inv_main44 var7 var6 var8 var5 var4 var3 var2 var1 var9 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Int) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main45 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (is-O_Int (read var20 (nthAddrRange var16 (+ (* 5 var17) (- 1))))) (is-O_Int (read var20 (nthAddrRange var16 (+ (* 5 var17) (- 1)))))) (and (and (and (and (and (and (and (and (and (= var10 (write var20 (nthAddrRange var16 (+ (* 5 var17) (- 1))) (O_Int var11))) (= var9 var19)) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11))) (= var0 (+ var7 1))))) (inv_main29 var10 var9 var8 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Int) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main46 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (is-O_Int (read var20 (nthAddrRange var16 (+ (* 5 var17) (- 1))))) (is-O_Int (read var20 (nthAddrRange var16 (+ (* 5 var17) (- 1)))))) (and (and (and (and (and (and (and (and (and (= var10 (write var20 (nthAddrRange var16 (+ (* 5 var17) (- 1))) (O_Int 0))) (= var9 var19)) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11))) (= var0 (+ var7 1))))) (inv_main29 var10 var9 var8 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap) (var19 Heap) (var20 Int) (var21 Int) (var22 Heap) (var23 Int) (var24 Int) (var25 Int) (var26 Int) (var27 Int) (var28 Int)) (or (not (and (inv_main2 var22 var21) (and (and (and (and (and (not (= var20 0)) (and (and (and (and (and (and (and (and (and (and (= var19 var18) (= var17 var16)) (= var15 var14)) (= var13 var12)) (= var11 var10)) (= var9 2)) (= var8 5)) (= var7 7)) (= var6 3)) (= var5 1)) (or (and (and (and (and (and (and (<= 0 (+ (+ 5 (* (- 1) var23)) (- 1))) (<= 0 (+ (+ 5 (* 1 var23)) (- 1)))) (or (not (<= 0 (+ var23 (- 1)))) (<= 0 (+ var16 (- 1))))) (or (not (<= 0 (+ (* (- 1) var23) (- 1)))) (<= 0 (+ (* (- 1) var16) (- 1))))) (= var16 (+ (* 5 var24) var23))) (= var23 0)) (= var20 1)) (and (not (or (not (and (and (and (and (<= 0 (+ (+ 5 (* (- 1) var25)) (- 1))) (<= 0 (+ (+ 5 (* 1 var25)) (- 1)))) (or (not (<= 0 (+ var25 (- 1)))) (<= 0 (+ var16 (- 1))))) (or (not (<= 0 (+ (* (- 1) var25) (- 1)))) (<= 0 (+ (* (- 1) var16) (- 1))))) (= var16 (+ (* 5 var26) var25)))) (= var25 0))) (= var20 0))))) (and (and (and (and (and (<= 0 (+ (+ 5 (* (- 1) var27)) (- 1))) (<= 0 (+ (+ 5 (* 1 var27)) (- 1)))) (or (not (<= 0 (+ var27 (- 1)))) (<= 0 (+ var16 (- 1))))) (or (not (<= 0 (+ (* (- 1) var27) (- 1)))) (<= 0 (+ (* (- 1) var16) (- 1))))) (= var16 (+ (* 5 var28) var27))) (= var27 0))) (and (and (and (and (= var18 (newBatchHeap (batchAlloc emptyHeap (O_Int var4) var3))) (= var16 var3)) (= var14 var2)) (= var12 var1)) (= var10 (newAddrRange (batchAlloc emptyHeap (O_Int var4) var3))))) (<= 0 (+ (+ var3 (- 1)) (- 1)))) (= var0 1)))) (inv_main29 var19 var17 var15 var0 var11 var9 var8 var7 var6 var5))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main34 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ var9 (* (- 1) var8)))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))) (O_Int var14))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var9 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10))))) (inv_main38 var7 var6 var8 var5 var4 var3 var9 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main35 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ var9 (* (- 1) var8)))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 5))) (O_Int 0))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var9 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10))))) (inv_main38 var7 var6 var8 var5 var4 var3 var9 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main37 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (* (- 1) var8))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))) (O_Int var13))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var9 var12)) (= var1 var11)) (= var0 var10))))) (inv_main40 var7 var6 var8 var5 var4 var3 var2 var9 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main38 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (* (- 1) var8))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 4))) (O_Int 0))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var9 var12)) (= var1 var11)) (= var0 var10))))) (inv_main40 var7 var6 var8 var5 var4 var3 var2 var9 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 Int)) (or (not (and (inv_main29 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var9 (- 1))) (not (or (not (and (and (and (<= 0 (+ (+ 5 (* (- 1) (+ var9 (* (- 5) var11)))) (- 1))) (<= 0 (+ (+ 5 (* 1 (+ var9 (* (- 5) var11)))) (- 1)))) (or (not (<= 0 (+ (+ var9 (* (- 5) var11)) (- 1)))) (<= 0 (+ var9 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var9 (* (- 5) var11))) (- 1)))) (<= 0 (+ (* (- 1) var9) (- 1)))))) (<= 0 (+ var11 (* (- 1) var7)))))) (= var0 0)))) (inv_main48 var10 var9 var8 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main51 var11 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (<= 0 (+ (+ var10 (* (- 1) (+ var8 1))) (- 1))) (= var0 (+ var8 1))))) (inv_main48 var11 var10 var9 var0 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int)) (or (not (and (inv_main29 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (<= 0 (+ var4 (* (- 1) var7))) (and (and (and (and (<= 0 (+ (+ 5 (* (- 1) (+ var8 (* (- 5) var10)))) (- 1))) (<= 0 (+ (+ 5 (* 1 (+ var8 (* (- 5) var10)))) (- 1)))) (or (not (<= 0 (+ (+ var8 (* (- 5) var10)) (- 1)))) (<= 0 (+ var8 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var8 (* (- 5) var10))) (- 1)))) (<= 0 (+ (* (- 1) var8) (- 1))))) (<= 0 (+ var10 (* (- 1) var6))))))) (inv_main34 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int)) (or (not (and (inv_main29 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (not (<= 0 (+ var4 (* (- 1) var7)))) (and (and (and (and (<= 0 (+ (+ 5 (* (- 1) (+ var8 (* (- 5) var10)))) (- 1))) (<= 0 (+ (+ 5 (* 1 (+ var8 (* (- 5) var10)))) (- 1)))) (or (not (<= 0 (+ (+ var8 (* (- 5) var10)) (- 1)))) (<= 0 (+ var8 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var8 (* (- 5) var10))) (- 1)))) (<= 0 (+ (* (- 1) var8) (- 1))))) (<= 0 (+ var10 (* (- 1) var6))))))) (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Int) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main48 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (is-O_Int (read var20 (nthAddrRange var16 var17))) (not (<= 0 (+ (getInt (read var20 (nthAddrRange var16 var17))) (* (- 1) var18))))) (is-O_Int (read var20 (nthAddrRange var16 var17)))) (and (and (and (and (and (and (and (and (and (and (= var10 var20) (= var9 var19)) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (or (and (= (getInt (read var20 (nthAddrRange var16 var17))) 0) (= var0 1)) (and (not (= (getInt (read var20 (nthAddrRange var16 var17))) 0)) (= var0 0))))))) (inv_main51 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main48 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var10 (nthAddrRange var6 var7))) (<= 0 (+ (getInt (read var10 (nthAddrRange var6 var7))) (* (- 1) var8)))) (= var0 1)))) (inv_main51 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main43 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (* (- 1) var8))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))) (O_Int var11))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var0 var11)) (= var9 var10))))) (inv_main45 var7 var6 var8 var5 var4 var3 var2 var1 var0 var9))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main44 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (* (- 1) var8))) (and (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))))) (is-O_Int (read var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))))))) (and (and (and (and (and (and (and (and (and (= var7 (write var19 (nthAddrRange var15 (+ (* 5 var16) (- 2))) (O_Int 0))) (= var6 var18)) (= var8 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var0 var11)) (= var9 var10))))) (inv_main45 var7 var6 var8 var5 var4 var3 var2 var1 var0 var9))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main34 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 5))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main34 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 5))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 5))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main34 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 5))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 5)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 5))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 5))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 5))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 5))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 5)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main37 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 4))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main37 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 4))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 4))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main37 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 4))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 4)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 4))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 4))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 4))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 4))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 4)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 3))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 3))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 3))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 3))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 3)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main41 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 3))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main41 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 3))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 3))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main41 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 3))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 3)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main43 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 2))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main43 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 2))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 2))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main43 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 2))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 2)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 2))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 2))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 2))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 2))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 2)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main45 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main45 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 1))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main45 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 1))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 1)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main46 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main46 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 1))))) (not (within var5 (nthAddrRange var5 (+ (* 5 var6) (- 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main46 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 1))))) (not (is-O_Int (read var9 (nthAddrRange var5 (+ (* 5 var6) (- 1)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main48 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 var6))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main48 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var5 (nthAddrRange var5 var6)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main48 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 var6))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main48 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var5 (nthAddrRange var5 var6)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main48 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 var6))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main48 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 var6))) (not (within var5 (nthAddrRange var5 var6))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main48 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var9 (nthAddrRange var5 var6))) (not (<= 0 (+ (getInt (read var9 (nthAddrRange var5 var6))) (* (- 1) var7))))) (not (is-O_Int (read var9 (nthAddrRange var5 var6)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main48 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (and (and (is-O_Int (read var9 (nthAddrRange var5 var6))) (not (<= 0 (+ (getInt (read var9 (nthAddrRange var5 var6))) (* (- 1) var7))))) (is-O_Int (read var9 (nthAddrRange var5 var6)))) (not (within var5 (nthAddrRange var5 var6))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (not (and (inv_main51 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (= var0 0)))))
(check-sat)