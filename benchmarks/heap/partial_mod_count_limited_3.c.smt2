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
(declare-fun inv_main17 (Heap Int Int Int Int AddrRange Int Int) Bool)
(declare-fun inv_main20 (Heap Int Int Int Int AddrRange Int Int) Bool)
(declare-fun inv_main21 (Heap Int Int Int Int AddrRange Int Int) Bool)
(declare-fun inv_main29 (Heap Int Int Int Int AddrRange Int Int) Bool)
(declare-fun inv_main3 (Heap Int Int Int Int AddrRange) Bool)
(declare-fun inv_main31 (Heap Int Int Int Int AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Heap)) (or (not (and (and (and (and (and (= var7 emptyHeap) (= var6 1000)) (= var5 (newBatchHeap (batchAlloc emptyHeap (O_Int var4) var6)))) (= var3 0)) (= var2 0)) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var4) var6))))) (inv_main3 var5 var6 var0 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 Int)) (or (not (and (inv_main21 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var8 (nthAddrRange var3 var6))) (is-O_Int (read var8 (nthAddrRange var3 var6)))) (and (and (and (and (and (or (and (<= 0 var1) (<= 0 (+ (+ var1 (* (- 1) var9)) (- 1)))) (and (not (<= 0 var1)) (<= 0 (+ (+ (* (- 1) var1) (* (- 1) var9)) (- 1))))) (or (and (<= 0 var1) (<= 0 (+ (+ var1 (* 1 var9)) (- 1)))) (and (not (<= 0 var1)) (<= 0 (+ (+ (* (- 1) var1) (* 1 var9)) (- 1)))))) (or (not (<= 0 (+ var9 (- 1)))) (<= 0 (+ var6 (- 1))))) (or (not (<= 0 (+ (* (- 1) var9) (- 1)))) (<= 0 (+ (* (- 1) var6) (- 1))))) (= var6 (+ (* var10 var1) var9))) (= var0 (write var8 (nthAddrRange var3 var6) (O_Int var9))))))) (inv_main20 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap) (var16 Int)) (or (not (and (inv_main17 var15 var14 var13 var12 var11 var10 var9 var8) (and (and (or (not (or (not (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ var6 (* (- 2) var16)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ var6 (* (- 2) var16)))) (- 1)))) (or (not (<= 0 (+ (+ var6 (* (- 2) var16)) (- 1)))) (<= 0 (+ var6 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var6 (* (- 2) var16))) (- 1)))) (<= 0 (+ (* (- 1) var6) (- 1)))))) (<= 0 (+ (+ var7 (* (- 1) var16)) (- 1))))) (not (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1))))) (and (is-O_Int (read var15 (nthAddrRange var10 var13))) (is-O_Int (read var15 (nthAddrRange var10 var13))))) (and (and (and (and (and (and (and (= var3 (write var15 (nthAddrRange var10 var13) (O_Int (+ var13 1)))) (= var6 var14)) (= var7 var13)) (= var2 var12)) (= var4 var11)) (= var1 var10)) (= var5 var9)) (= var0 var8))))) (inv_main20 var3 var6 var7 var2 var4 var1 var5 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap) (var16 Int)) (or (not (and (inv_main17 var15 var14 var13 var12 var11 var10 var9 var8) (and (and (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ var6 (* (- 2) var16)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ var6 (* (- 2) var16)))) (- 1)))) (or (not (<= 0 (+ (+ var6 (* (- 2) var16)) (- 1)))) (<= 0 (+ var6 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var6 (* (- 2) var16))) (- 1)))) (<= 0 (+ (* (- 1) var6) (- 1))))) (<= 0 (+ (+ var7 (* (- 1) var16)) (- 1)))) (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1)))) (and (is-O_Int (read var15 (nthAddrRange var10 var13))) (is-O_Int (read var15 (nthAddrRange var10 var13))))) (and (and (and (and (and (and (and (= var3 (write var15 (nthAddrRange var10 var13) (O_Int (+ var13 1)))) (= var6 var14)) (= var7 var13)) (= var2 var12)) (= var4 var11)) (= var1 var10)) (= var5 var9)) (= var0 var8))))) (inv_main21 var3 var6 var7 var2 var4 var1 var5 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main20 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (<= 0 (+ (+ var10 (* (- 1) (+ var9 1))) (- 1))) (and (and (= var8 0) (is-O_Int (read var18 (nthAddrRange var13 var16)))) (and (and (and (and (and (and (and (and (= var7 var18) (= var10 var17)) (= var9 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var8 (getInt (read var18 (nthAddrRange var13 var16))))))) (= var1 (+ var9 1))) (= var0 (+ var5 1))))) (inv_main17 var7 var10 var1 var6 var0 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Heap)) (or (not (and (inv_main20 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ var9 (* (- 1) (+ var8 1))) (- 1))) (and (and (not (= var7 0)) (is-O_Int (read var17 (nthAddrRange var12 var15)))) (and (and (and (and (and (and (and (and (= var6 var17) (= var9 var16)) (= var8 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var7 (getInt (read var17 (nthAddrRange var12 var15))))))) (= var0 (+ var8 1))))) (inv_main17 var6 var9 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap) (var17 Int) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int)) (or (not (and (inv_main3 var16 var15 var14 var13 var12 var11) (and (and (<= 0 (+ var10 (- 1))) (and (and (not (= var9 0)) (<= 0 (+ var8 (- 1)))) (and (and (and (and (and (and (and (and (= var7 var16) (= var10 var15)) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var8)) (= var1 3)) (or (and (and (and (and (and (and (and (and (= var20 var15) (= var19 (+ var20 (* (- 1) (* var17 var18))))) (= var18 3)) (or (and (<= 0 var18) (<= 0 (+ (+ var18 (* (- 1) var19)) (- 1)))) (and (not (<= 0 var18)) (<= 0 (+ (+ (* (- 1) var18) (* (- 1) var19)) (- 1)))))) (or (and (<= 0 var18) (<= 0 (+ (+ var18 (* 1 var19)) (- 1)))) (and (not (<= 0 var18)) (<= 0 (+ (+ (* (- 1) var18) (* 1 var19)) (- 1)))))) (or (not (<= 0 (+ var19 (- 1)))) (<= 0 (+ var20 (- 1))))) (or (not (<= 0 (+ (* (- 1) var19) (- 1)))) (<= 0 (+ (* (- 1) var20) (- 1))))) (<= 0 (+ (+ var17 (* (- 1) var8)) (- 1)))) (= var9 1)) (and (not (or (not (and (and (and (and (and (and (= var24 var15) (= var23 (+ var24 (* (- 1) (* var21 var22))))) (= var22 3)) (or (and (<= 0 var22) (<= 0 (+ (+ var22 (* (- 1) var23)) (- 1)))) (and (not (<= 0 var22)) (<= 0 (+ (+ (* (- 1) var22) (* (- 1) var23)) (- 1)))))) (or (and (<= 0 var22) (<= 0 (+ (+ var22 (* 1 var23)) (- 1)))) (and (not (<= 0 var22)) (<= 0 (+ (+ (* (- 1) var22) (* 1 var23)) (- 1)))))) (or (not (<= 0 (+ var23 (- 1)))) (<= 0 (+ var24 (- 1))))) (or (not (<= 0 (+ (* (- 1) var23) (- 1)))) (<= 0 (+ (* (- 1) var24) (- 1)))))) (<= 0 (+ (+ var21 (* (- 1) var8)) (- 1))))) (= var9 0)))))) (= var0 0)))) (inv_main17 var7 var10 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main31 var8 var7 var6 var5 var4 var3 var2 var1) (and (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1))) (= var0 (+ var6 1))))) (inv_main29 var8 var7 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main20 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (<= 0 (+ var10 (- 1))) (and (not (<= 0 (+ (+ var10 (* (- 1) (+ var9 1))) (- 1)))) (and (and (= var8 0) (is-O_Int (read var18 (nthAddrRange var13 var16)))) (and (and (and (and (and (and (and (and (= var7 var18) (= var10 var17)) (= var9 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var8 (getInt (read var18 (nthAddrRange var13 var16)))))))) (= var1 0)) (= var0 (+ var5 1))))) (inv_main29 var7 var10 var1 var6 var0 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Heap)) (or (not (and (inv_main20 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ var9 (- 1))) (and (not (<= 0 (+ (+ var9 (* (- 1) (+ var8 1))) (- 1)))) (and (and (not (= var7 0)) (is-O_Int (read var17 (nthAddrRange var12 var15)))) (and (and (and (and (and (and (and (and (= var6 var17) (= var9 var16)) (= var8 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var7 (getInt (read var17 (nthAddrRange var12 var15)))))))) (= var0 0)))) (inv_main29 var6 var9 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap) (var17 Int) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int)) (or (not (and (inv_main3 var16 var15 var14 var13 var12 var11) (and (and (<= 0 (+ var10 (- 1))) (and (not (<= 0 (+ var10 (- 1)))) (and (and (not (= var9 0)) (<= 0 (+ var8 (- 1)))) (and (and (and (and (and (and (and (and (= var7 var16) (= var10 var15)) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var8)) (= var1 3)) (or (and (and (and (and (and (and (and (and (= var20 var15) (= var19 (+ var20 (* (- 1) (* var17 var18))))) (= var18 3)) (or (and (<= 0 var18) (<= 0 (+ (+ var18 (* (- 1) var19)) (- 1)))) (and (not (<= 0 var18)) (<= 0 (+ (+ (* (- 1) var18) (* (- 1) var19)) (- 1)))))) (or (and (<= 0 var18) (<= 0 (+ (+ var18 (* 1 var19)) (- 1)))) (and (not (<= 0 var18)) (<= 0 (+ (+ (* (- 1) var18) (* 1 var19)) (- 1)))))) (or (not (<= 0 (+ var19 (- 1)))) (<= 0 (+ var20 (- 1))))) (or (not (<= 0 (+ (* (- 1) var19) (- 1)))) (<= 0 (+ (* (- 1) var20) (- 1))))) (<= 0 (+ (+ var17 (* (- 1) var8)) (- 1)))) (= var9 1)) (and (not (or (not (and (and (and (and (and (and (= var24 var15) (= var23 (+ var24 (* (- 1) (* var21 var22))))) (= var22 3)) (or (and (<= 0 var22) (<= 0 (+ (+ var22 (* (- 1) var23)) (- 1)))) (and (not (<= 0 var22)) (<= 0 (+ (+ (* (- 1) var22) (* (- 1) var23)) (- 1)))))) (or (and (<= 0 var22) (<= 0 (+ (+ var22 (* 1 var23)) (- 1)))) (and (not (<= 0 var22)) (<= 0 (+ (+ (* (- 1) var22) (* 1 var23)) (- 1)))))) (or (not (<= 0 (+ var23 (- 1)))) (<= 0 (+ var24 (- 1))))) (or (not (<= 0 (+ (* (- 1) var23) (- 1)))) (<= 0 (+ (* (- 1) var24) (- 1)))))) (<= 0 (+ (+ var21 (* (- 1) var8)) (- 1))))) (= var9 0))))))) (= var0 0)))) (inv_main29 var7 var10 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Heap)) (or (not (and (inv_main29 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (and (= var9 0) (is-O_Int (read var17 (nthAddrRange var12 var15)))) (and (and (and (and (and (and (and (and (= var8 var17) (= var7 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var9 (getInt (read var17 (nthAddrRange var12 var15)))))) (= var0 (+ var5 1))))) (inv_main31 var8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (inv_main29 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (not (= var8 0)) (is-O_Int (read var16 (nthAddrRange var11 var14)))) (and (and (and (and (and (and (and (and (= var7 var16) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 var9)) (= var8 (getInt (read var16 (nthAddrRange var11 var14)))))))) (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main17 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main17 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var5))) (not (within var2 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main17 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var5))) (not (is-O_Int (read var7 (nthAddrRange var2 var5)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main21 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main21 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var5))) (not (within var2 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main21 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var5))) (not (is-O_Int (read var7 (nthAddrRange var2 var5)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main20 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main20 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var5))) (not (within var2 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main29 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main29 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var5))) (not (within var2 (nthAddrRange var2 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int)) (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0) (not (or (not (and (and (and (and (and (and (= var11 var6) (= var10 (+ var11 (* (- 1) (* var8 var9))))) (= var9 (* 2 var0))) (or (and (<= 0 var9) (<= 0 (+ (+ var9 (* (- 1) var10)) (- 1)))) (and (not (<= 0 var9)) (<= 0 (+ (+ (* (- 1) var9) (* (- 1) var10)) (- 1)))))) (or (and (<= 0 var9) (<= 0 (+ (+ var9 (* 1 var10)) (- 1)))) (and (not (<= 0 var9)) (<= 0 (+ (+ (* (- 1) var9) (* 1 var10)) (- 1)))))) (or (not (<= 0 (+ var10 (- 1)))) (<= 0 (+ var11 (- 1))))) (or (not (<= 0 (+ (* (- 1) var10) (- 1)))) (<= 0 (+ (* (- 1) var11) (- 1)))))) (<= 0 (+ (+ (+ var8 2) (* (- 1) var4)) (- 1)))))))))
(check-sat)