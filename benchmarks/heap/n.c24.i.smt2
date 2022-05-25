(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status unsat)
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
(declare-fun inv_main10 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(declare-fun inv_main24 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(declare-fun inv_main39 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(declare-fun inv_main4 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(declare-fun inv_main40 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(declare-fun inv_main43 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(declare-fun inv_main46 (Heap Int Int Int Int Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main59 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(declare-fun inv_main61 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(declare-fun inv_main9 (Heap Int Int Int Int Int Int Int AddrRange) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Heap)) (or (not (and (and (= var10 emptyHeap) (= var9 (newBatchHeap (batchAlloc emptyHeap (O_Int var8) 1000)))) (= var7 (newAddrRange (batchAlloc emptyHeap (O_Int var8) 1000))))) (inv_main4 var9 var6 var5 var4 var3 var2 var1 var0 var7))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main43 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var1 var8))) (= var0 (AddrRange (nthAddrRange var1 var8) (+ (AddrRangeSize var1) (* (- 1) var8))))))) (inv_main46 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0 var8))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main40 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (= var9 1) (is-O_Int (read var18 (nthAddrRange var10 var17)))) (and (and (and (and (and (and (and (and (and (= var8 var18) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10)) (= var9 (getInt (read var18 (nthAddrRange var10 var17)))))))) (inv_main43 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main39 var20 var19 var18 var17 var16 var15 var14 var13 var12) (and (<= 0 (+ var11 (- 1))) (and (not (<= 0 (+ (+ var11 (- 20)) (- 1)))) (and (<= 0 var11) (and (= var10 (- 1)) (and (and (= var9 0) (is-O_Int (read var20 (nthAddrRange var12 var18)))) (and (and (and (and (and (and (and (and (and (= var8 var20) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14)) (= var1 var13)) (= var0 var12)) (= var9 (getInt (read var20 (nthAddrRange var12 var18)))))))))))) (inv_main61 var8 var7 var6 var10 var4 var3 var2 var11 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main24 var10 var9 var8 var7 var6 var5 var4 var3 var2) (and (and (not (= var1 (- 1))) (and (and (not (= var1 0)) (not (= var1 1))) (<= 0 (+ (+ var5 (* (- 1) var6)) (- 1))))) (= var0 0)))) (inv_main39 var10 var9 var0 var1 var6 var5 var1 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Int) (var14 AddrRange) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Heap)) (or (not (and (inv_main46 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13) (and (and (is-O_Int (read var23 (nthAddrRange var15 (+ var13 1)))) (and (and (and (and (and (and (and (and (and (and (and (= var12 var23) (= var11 var22)) (= var10 var21)) (= var9 var20)) (= var8 var19)) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 (AddrRange (nthAddrRange var15 (+ var13 1)) (+ (AddrRangeSize var15) (* (- 1) (+ var13 1)))))) (= var1 1001))) (= var0 (+ var10 1))))) (inv_main39 var12 var11 var0 var9 var8 var7 var6 var5 var4))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main40 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (not (= var10 1)) (is-O_Int (read var19 (nthAddrRange var11 var18)))) (and (and (and (and (and (and (and (and (and (= var9 var19) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var10 (getInt (read var19 (nthAddrRange var11 var18)))))) (= var0 (+ var7 1))))) (inv_main39 var9 var8 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main59 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (and (is-O_Int (read var18 (nthAddrRange var10 var17))) (is-O_Int (read var18 (nthAddrRange var10 var17)))) (and (and (and (and (and (and (and (and (= var9 (write var18 (nthAddrRange var10 var17) (O_Int 0))) (= var8 var17)) (= var7 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10))) (= var0 (+ var5 1))))) (inv_main24 var9 var8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main61 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (and (is-O_Int (read var18 (nthAddrRange var10 var17))) (is-O_Int (read var18 (nthAddrRange var10 var17)))) (and (and (and (and (and (and (and (and (= var9 (write var18 (nthAddrRange var10 var17) (O_Int (- 1)))) (= var8 var17)) (= var7 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10))) (= var0 (+ var5 1))))) (inv_main24 var9 var8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main24 var10 var9 var8 var7 var6 var5 var4 var3 var2) (and (and (= var1 (- 1)) (and (and (not (= var1 0)) (not (= var1 1))) (<= 0 (+ (+ var5 (* (- 1) var6)) (- 1))))) (= var0 (+ var6 1))))) (inv_main24 var10 var9 var8 var1 var0 var5 var1 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main39 var20 var19 var18 var17 var16 var15 var14 var13 var12) (and (and (not (= var11 (- 1))) (and (and (= var10 0) (is-O_Int (read var20 (nthAddrRange var12 var18)))) (and (and (and (and (and (and (and (and (and (= var9 var20) (= var8 var19)) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var10 (getInt (read var20 (nthAddrRange var12 var18))))))) (= var0 (+ var5 1))))) (inv_main24 var9 var8 var7 var11 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Int) (var21 Heap)) (or (not (and (inv_main39 var21 var20 var19 var18 var17 var16 var15 var14 var13) (and (and (not (<= 0 (+ var12 (- 1)))) (and (not (<= 0 (+ (+ var12 (- 20)) (- 1)))) (and (<= 0 var12) (and (= var11 (- 1)) (and (and (= var10 0) (is-O_Int (read var21 (nthAddrRange var13 var19)))) (and (and (and (and (and (and (and (and (and (= var9 var21) (= var8 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14)) (= var1 var13)) (= var10 (getInt (read var21 (nthAddrRange var13 var19)))))))))) (= var0 (+ var5 1))))) (inv_main24 var9 var8 var7 var11 var0 var4 var3 var12 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (inv_main24 var12 var11 var10 var9 var8 var7 var6 var5 var4) (and (and (and (and (not (<= 0 (+ (* (- 1) var3) (- 1)))) (and (= var2 0) (<= 0 (+ (+ 1000 (* (- 1) (+ var11 1))) (- 1))))) (not (<= 0 (+ (+ var7 (* (- 1) var8)) (- 1))))) (= var1 (+ var11 1))) (= var0 0)))) (inv_main24 var12 var1 var10 var2 var0 var3 var6 var5 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Heap)) (or (not (and (inv_main9 var22 var21 var20 var19 var18 var17 var16 var15 var14) (and (and (and (and (not (<= 0 (+ (* (- 1) var13) (- 1)))) (= var12 0)) (and (not (<= 0 (+ (+ 1000 (* (- 1) (+ var11 1))) (- 1)))) (and (and (is-O_Int (read var22 (nthAddrRange var14 var21))) (is-O_Int (read var22 (nthAddrRange var14 var21)))) (and (and (and (and (and (and (and (and (= var10 (write var22 (nthAddrRange var14 var21) (O_Int var9))) (= var11 var21)) (= var8 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14))))) (= var1 0)) (= var0 0)))) (inv_main24 var10 var1 var8 var12 var0 var13 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main4 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 0))) (inv_main9 var9 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main9 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (<= 0 (+ (+ 1000 (* (- 1) (+ var10 1))) (- 1))) (and (and (is-O_Int (read var19 (nthAddrRange var11 var18))) (is-O_Int (read var19 (nthAddrRange var11 var18)))) (and (and (and (and (and (and (and (and (= var9 (write var19 (nthAddrRange var11 var18) (O_Int var8))) (= var10 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)))) (= var0 (+ var10 1))))) (inv_main9 var9 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main39 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (= var9 0)) (is-O_Int (read var18 (nthAddrRange var10 var16)))) (and (and (and (and (and (and (and (and (and (= var8 var18) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10)) (= var9 (getInt (read var18 (nthAddrRange var10 var16)))))))) (inv_main40 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main39 var20 var19 var18 var17 var16 var15 var14 var13 var12) (and (<= 0 (+ (+ var11 (- 20)) (- 1))) (and (<= 0 var11) (and (= var10 (- 1)) (and (and (= var9 0) (is-O_Int (read var20 (nthAddrRange var12 var18)))) (and (and (and (and (and (and (and (and (and (= var8 var20) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14)) (= var1 var13)) (= var0 var12)) (= var9 (getInt (read var20 (nthAddrRange var12 var18))))))))))) (inv_main59 var8 var7 var6 var10 var4 var3 var2 var11 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main24 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ (+ 1000 (* (- 1) (+ var8 1))) (- 1)))) (not (<= 0 (+ (+ var4 (* (- 1) var5)) (- 1))))) (= var0 (+ var8 1))))) (inv_main10 var9 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var7))) (not (within var0 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var7))) (not (is-O_Int (read var8 (nthAddrRange var0 var7)))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main39 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var0 var6))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main39 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var6))) (not (within var0 (nthAddrRange var0 var6))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main40 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main40 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var7))) (not (within var0 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main43 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main43 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var7))) (not (within var0 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (not (and (inv_main46 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var10 (nthAddrRange var2 (+ var0 1)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (not (and (inv_main46 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var10 (nthAddrRange var2 (+ var0 1)))) (not (within var2 (nthAddrRange var2 (+ var0 1)))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main59 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main59 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var7))) (not (within var0 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main59 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var7))) (not (is-O_Int (read var8 (nthAddrRange var0 var7)))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main61 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main61 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var7))) (not (within var0 (nthAddrRange var0 var7))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main61 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var0 var7))) (not (is-O_Int (read var8 (nthAddrRange var0 var7)))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main10 var8 var7 var6 var5 var4 var3 var2 var1 var0) (or (not (<= 0 var4)) (not (<= 0 (+ 1000 (* (- 1) var4)))))))))
(check-sat)