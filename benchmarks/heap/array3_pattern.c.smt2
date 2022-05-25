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
(declare-fun inv_main20 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main22 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main27 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main36 (Heap Int AddrRange AddrRange Int Int Int Int Int Int Int) Bool)
(declare-fun inv_main38 (Heap Int AddrRange AddrRange Int Int Int Int Int Int Int) Bool)
(declare-fun inv_main40 (Heap Int AddrRange AddrRange Int Int Int Int Int Int Int) Bool)
(declare-fun inv_main45 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main47 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main49 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 0))) (inv_main2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Heap) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Int) (var21 AddrRange) (var22 AddrRange) (var23 Int) (var24 Heap) (var25 Int) (var26 Int) (var27 Int) (var28 Int) (var29 Int) (var30 Int) (var31 AddrRange) (var32 AddrRange) (var33 Int) (var34 Heap)) (or (not (and (inv_main47 var34 var33 var32 var31 var30 var29 var28 var27 var26 var25) (and (and (and (is-O_Int (read var34 (nthAddrRange var32 var30))) (and (and (and (and (and (and (and (and (and (and (and (= var24 var34) (= var23 var33)) (= var22 var32)) (= var21 var31)) (= var20 var30)) (= var19 var29)) (= var18 var28)) (= var17 var27)) (= var16 var26)) (= var15 var25)) (= var14 var28)) (= var13 (getInt (read var34 (nthAddrRange var32 var30)))))) (and (and (and (and (and (and (and (and (and (and (and (= var12 var24) (= var11 var23)) (= var10 var22)) (= var9 var21)) (= var8 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14)) (= var1 (* var13 var13)))) (= var0 (+ var2 var1))))) (inv_main49 var12 var11 var10 var9 var8 var7 var0 var5 var4 var3))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Int) (var20 Heap) (var21 Heap) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Int) (var27 Int) (var28 Int) (var29 Int) (var30 Int) (var31 AddrRange) (var32 AddrRange) (var33 Int) (var34 Heap)) (or (not (and (inv_main40 var34 var33 var32 var31 var30 var29 var28 var27 var26 var25 var24) (and (and (not (= var23 0)) (and (<= 0 var22) (and (and (and (and (and (and (and (and (and (and (= var21 var20) (= var19 var18)) (= var17 var16)) (= var15 var14)) (= var13 var12)) (= var11 var10)) (= var9 var8)) (= var7 var6)) (= var5 var4)) (= var3 var22)) (or (and (<= 0 (+ (+ var18 (* (- 1) var22)) (- 1))) (= var23 1)) (and (not (<= 0 (+ (+ var18 (* (- 1) var22)) (- 1)))) (= var23 0)))))) (and (not (= var4 0)) (and (and (is-O_Int (read var34 (nthAddrRange var31 (+ (+ var24 (- 1)) (* (- 1) var25))))) (is-O_Int (read var34 (nthAddrRange var31 (+ (+ var24 (- 1)) (* (- 1) var25)))))) (and (and (and (and (and (and (and (and (and (= var20 (write var34 (nthAddrRange var31 (+ (+ var24 (- 1)) (* (- 1) var25))) (O_Int (+ var2 (* var29 var25))))) (= var18 var33)) (= var16 var32)) (= var14 var31)) (= var12 var30)) (= var10 var29)) (= var8 var28)) (= var6 var27)) (= var1 var26)) (= var0 var25))))))) (inv_main27 var21 var19 var17 var15 var13 var11 var9 var7 var5 var3))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Heap) (var19 Heap) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Int) (var27 Int) (var28 AddrRange) (var29 AddrRange) (var30 Int) (var31 Heap)) (or (not (and (inv_main22 var31 var30 var29 var28 var27 var26 var25 var24 var23 var22) (and (and (not (= var21 0)) (and (<= 0 var20) (and (and (and (and (and (and (and (and (and (and (= var19 var18) (= var17 var16)) (= var15 var14)) (= var13 var12)) (= var11 (+ var10 1))) (= var9 var8)) (= var7 var6)) (= var5 var4)) (= var3 var2)) (= var1 var20)) (or (and (<= 0 (+ (+ var16 (* (- 1) var20)) (- 1))) (= var21 1)) (and (not (<= 0 (+ (+ var16 (* (- 1) var20)) (- 1)))) (= var21 0)))))) (and (not (<= 0 (+ (+ var16 (* (- 1) (+ var10 1))) (- 1)))) (and (and (is-O_Int (read var31 (nthAddrRange var28 var27))) (is-O_Int (read var31 (nthAddrRange var28 var27)))) (and (and (and (and (and (and (and (and (and (= var18 (write var31 (nthAddrRange var28 var27) (O_Int 0))) (= var16 var30)) (= var14 var29)) (= var12 var28)) (= var10 var27)) (= var8 var26)) (= var6 var25)) (= var4 var24)) (= var2 var23)) (= var0 var22))))))) (inv_main27 var19 var17 var15 var13 var11 var9 var7 var5 var3 var1))))
(assert (forall ((var0 Int) (var1 Heap) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 AddrRange) (var20 Int) (var21 Int) (var22 Heap) (var23 Heap) (var24 Int) (var25 Int) (var26 Int) (var27 Heap)) (or (not (and (inv_main2 var27 var26) (and (and (not (= var25 0)) (and (<= 0 var24) (and (and (and (and (and (and (and (and (and (and (= var23 var22) (= var21 var20)) (= var19 var18)) (= var17 var16)) (= var15 0)) (= var14 (- 1))) (= var13 0)) (= var12 0)) (= var11 var10)) (= var9 var24)) (or (and (<= 0 (+ (+ var20 (* (- 1) var24)) (- 1))) (= var25 1)) (and (not (<= 0 (+ (+ var20 (* (- 1) var24)) (- 1)))) (= var25 0)))))) (and (and (and (not (<= 0 (+ var20 (- 1)))) (and (and (and (= var22 (newBatchHeap (batchAlloc emptyHeap (O_Int var8) var7))) (= var20 var7)) (= var18 var6)) (= var16 (newAddrRange (batchAlloc emptyHeap (O_Int var8) var7))))) (and (and (= var5 (newBatchHeap (batchAlloc emptyHeap (O_Int var4) var3))) (= var7 var3)) (= var6 (newAddrRange (batchAlloc emptyHeap (O_Int var4) var3))))) (and (not (= var2 0)) (and (and (= var1 var27) (= var3 var0)) (or (and (<= 0 (+ var0 (- 1))) (= var2 1)) (and (not (<= 0 (+ var0 (- 1)))) (= var2 0))))))))) (inv_main27 var23 var21 var19 var17 var15 var14 var13 var12 var11 var9))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (or (not (and (inv_main20 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var10 (nthAddrRange var8 var6))) (is-O_Int (read var10 (nthAddrRange var8 var6)))) (= var0 (write var10 (nthAddrRange var8 var6) (O_Int 0)))))) (inv_main22 var0 var9 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 AddrRange) (var21 AddrRange) (var22 Int) (var23 Heap)) (or (not (and (inv_main40 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13) (and (and (<= 0 (+ var12 (- 1))) (and (= var11 0) (and (and (is-O_Int (read var23 (nthAddrRange var20 (+ (+ var13 (- 1)) (* (- 1) var14))))) (is-O_Int (read var23 (nthAddrRange var20 (+ (+ var13 (- 1)) (* (- 1) var14)))))) (and (and (and (and (and (and (and (and (and (= var10 (write var23 (nthAddrRange var20 (+ (+ var13 (- 1)) (* (- 1) var14))) (O_Int (+ var9 (* var18 var14))))) (= var12 var22)) (= var8 var21)) (= var7 var20)) (= var6 var19)) (= var5 var18)) (= var4 var17)) (= var3 var16)) (= var2 var15)) (= var1 var14))))) (= var0 0)))) (inv_main47 var10 var12 var8 var7 var0 var5 var4 var3 var11 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Heap) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 AddrRange) (var21 AddrRange) (var22 Int) (var23 Heap) (var24 Int) (var25 Int) (var26 Int) (var27 Int) (var28 Int) (var29 Int) (var30 Int) (var31 Int) (var32 AddrRange) (var33 AddrRange) (var34 Int) (var35 Heap)) (or (not (and (inv_main49 var35 var34 var33 var32 var31 var30 var29 var28 var27 var26) (and (and (and (<= 0 (+ (+ var25 (* (- 1) (+ var24 1))) (- 1))) (and (and (is-O_Int (read var35 (nthAddrRange var32 var31))) (and (and (and (and (and (and (and (and (and (and (and (= var23 var35) (= var22 var34)) (= var21 var33)) (= var20 var32)) (= var19 var31)) (= var18 var30)) (= var17 var29)) (= var16 var28)) (= var15 var27)) (= var14 var26)) (= var13 var28)) (= var12 (getInt (read var35 (nthAddrRange var32 var31)))))) (and (and (and (and (and (and (and (and (and (and (and (= var11 var23) (= var25 var22)) (= var10 var21)) (= var9 var20)) (= var24 var19)) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 (* var12 var12))))) (= var1 (+ var24 1))) (= var0 (+ var3 var2))))) (inv_main47 var11 var25 var10 var9 var1 var8 var7 var0 var5 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (or (not (and (inv_main27 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var10 (nthAddrRange var8 var1))) (= var0 (getInt (read var10 (nthAddrRange var8 var1))))))) (inv_main36 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 AddrRange) (var19 AddrRange) (var20 Int) (var21 Heap)) (or (not (and (inv_main38 var21 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (is-O_Int (read var21 (nthAddrRange var18 (+ (+ var11 (- 1)) (* (- 1) var12))))) (and (and (and (and (and (and (and (and (and (and (= var10 var21) (= var9 var20)) (= var8 var19)) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var0 (getInt (read var21 (nthAddrRange var18 (+ (+ var11 (- 1)) (* (- 1) var12)))))))))) (inv_main40 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var9))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Heap)) (or (not (and (inv_main36 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (is-O_Int (read var20 (nthAddrRange var18 var11))) (is-O_Int (read var20 (nthAddrRange var18 var11)))) (and (and (and (and (and (and (and (and (and (= var9 (write var20 (nthAddrRange var18 var11) (O_Int (+ var10 (* var15 (* var15 var11)))))) (= var8 var19)) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var0 var11))))) (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0 var8))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Heap)) (or (not (and (inv_main22 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (<= 0 (+ (+ var10 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var20 (nthAddrRange var17 var16))) (is-O_Int (read var20 (nthAddrRange var17 var16)))) (and (and (and (and (and (and (and (and (and (= var8 (write var20 (nthAddrRange var17 var16) (O_Int 0))) (= var10 var19)) (= var7 var18)) (= var6 var17)) (= var9 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)))) (= var0 (+ var9 1))))) (inv_main20 var8 var10 var7 var6 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Heap) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 Int) (var16 Int) (var17 Heap) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main2 var20 var19) (and (and (and (and (and (and (and (<= 0 (+ var18 (- 1))) (and (and (and (= var17 (newBatchHeap (batchAlloc emptyHeap (O_Int var16) var15))) (= var18 var15)) (= var14 var13)) (= var12 (newAddrRange (batchAlloc emptyHeap (O_Int var16) var15))))) (and (and (= var11 (newBatchHeap (batchAlloc emptyHeap (O_Int var10) var9))) (= var15 var9)) (= var13 (newAddrRange (batchAlloc emptyHeap (O_Int var10) var9))))) (and (not (= var8 0)) (and (and (= var7 var20) (= var9 var6)) (or (and (<= 0 (+ var6 (- 1))) (= var8 1)) (and (not (<= 0 (+ var6 (- 1)))) (= var8 0)))))) (= var5 0)) (= var4 (- 1))) (= var3 0)) (= var2 0)))) (inv_main20 var17 var18 var14 var12 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 AddrRange) (var21 AddrRange) (var22 Int) (var23 Heap)) (or (not (and (inv_main40 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13) (and (and (not (<= 0 (+ var12 (- 1)))) (and (= var11 0) (and (and (is-O_Int (read var23 (nthAddrRange var20 (+ (+ var13 (- 1)) (* (- 1) var14))))) (is-O_Int (read var23 (nthAddrRange var20 (+ (+ var13 (- 1)) (* (- 1) var14)))))) (and (and (and (and (and (and (and (and (and (= var10 (write var23 (nthAddrRange var20 (+ (+ var13 (- 1)) (* (- 1) var14))) (O_Int (+ var9 (* var18 var14))))) (= var12 var22)) (= var8 var21)) (= var7 var20)) (= var6 var19)) (= var5 var18)) (= var4 var17)) (= var3 var16)) (= var2 var15)) (= var1 var14))))) (= var0 0)))) (inv_main45 var10 var12 var8 var7 var0 var5 var4 var3 var11 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Heap) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 AddrRange) (var21 AddrRange) (var22 Int) (var23 Heap) (var24 Int) (var25 Int) (var26 Int) (var27 Int) (var28 Int) (var29 Int) (var30 Int) (var31 Int) (var32 AddrRange) (var33 AddrRange) (var34 Int) (var35 Heap)) (or (not (and (inv_main49 var35 var34 var33 var32 var31 var30 var29 var28 var27 var26) (and (and (and (not (<= 0 (+ (+ var25 (* (- 1) (+ var24 1))) (- 1)))) (and (and (is-O_Int (read var35 (nthAddrRange var32 var31))) (and (and (and (and (and (and (and (and (and (and (and (= var23 var35) (= var22 var34)) (= var21 var33)) (= var20 var32)) (= var19 var31)) (= var18 var30)) (= var17 var29)) (= var16 var28)) (= var15 var27)) (= var14 var26)) (= var13 var28)) (= var12 (getInt (read var35 (nthAddrRange var32 var31)))))) (and (and (and (and (and (and (and (and (and (and (and (= var11 var23) (= var25 var22)) (= var10 var21)) (= var9 var20)) (= var24 var19)) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 (* var12 var12))))) (= var1 (+ var24 1))) (= var0 (+ var3 var2))))) (inv_main45 var11 var25 var10 var9 var1 var8 var7 var0 var5 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var7 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var7 var5))) (not (within var7 (nthAddrRange var7 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var7 var5))) (not (is-O_Int (read var9 (nthAddrRange var7 var5)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main22 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main22 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 var5))) (not (within var6 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main22 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 var5))) (not (is-O_Int (read var9 (nthAddrRange var6 var5)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main27 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var7 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main27 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var7 var0))) (not (within var7 (nthAddrRange var7 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main36 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var10 (nthAddrRange var8 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main36 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var10 (nthAddrRange var8 var1))) (not (within var8 (nthAddrRange var8 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main36 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var10 (nthAddrRange var8 var1))) (not (is-O_Int (read var10 (nthAddrRange var8 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main38 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var10 (nthAddrRange var7 (+ (+ var0 (- 1)) (* (- 1) var1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main38 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var10 (nthAddrRange var7 (+ (+ var0 (- 1)) (* (- 1) var1))))) (not (within var7 (nthAddrRange var7 (+ (+ var0 (- 1)) (* (- 1) var1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main40 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var10 (nthAddrRange var7 (+ (+ var0 (- 1)) (* (- 1) var1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main40 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var10 (nthAddrRange var7 (+ (+ var0 (- 1)) (* (- 1) var1))))) (not (within var7 (nthAddrRange var7 (+ (+ var0 (- 1)) (* (- 1) var1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap)) (not (and (inv_main40 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var10 (nthAddrRange var7 (+ (+ var0 (- 1)) (* (- 1) var1))))) (not (is-O_Int (read var10 (nthAddrRange var7 (+ (+ var0 (- 1)) (* (- 1) var1)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main47 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var7 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main47 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var7 var5))) (not (within var7 (nthAddrRange var7 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 var5))) (not (within var6 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main45 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (= var3 var2))))))
(check-sat)
