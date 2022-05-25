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
(declare-fun inv_main20 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main22 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main27 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main36 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main38 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main40 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main45 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main47 (Heap Int AddrRange AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main49 (Heap Int AddrRange AddrRange Int Int Int Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 0))) (inv_main2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 Int) (var17 Int) (var18 Heap) (var19 Heap) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 Int) (var26 Int) (var27 Int) (var28 AddrRange) (var29 AddrRange) (var30 Int) (var31 Heap)) (or (not (and (inv_main40 var31 var30 var29 var28 var27 var26 var25 var24 var23 var22) (and (and (not (= var21 0)) (and (<= 0 var20) (and (and (and (and (and (and (and (and (and (= var19 var18) (= var17 var16)) (= var15 var14)) (= var13 var12)) (= var11 var10)) (= var9 var8)) (= var7 var20)) (= var6 var5)) (= var4 var3)) (or (and (<= 0 (+ (+ var16 (* (- 1) var20)) (- 1))) (= var21 1)) (and (not (<= 0 (+ (+ var16 (* (- 1) var20)) (- 1)))) (= var21 0)))))) (and (not (= var5 0)) (and (and (is-O_Int (read var31 (nthAddrRange var28 (+ (+ var22 (- 1)) (* (- 1) var25))))) (is-O_Int (read var31 (nthAddrRange var28 (+ (+ var22 (- 1)) (* (- 1) var25)))))) (and (and (and (and (and (and (and (and (= var18 (write var31 (nthAddrRange var28 (+ (+ var22 (- 1)) (* (- 1) var25))) (O_Int (+ var2 (* var26 var25))))) (= var16 var30)) (= var14 var29)) (= var12 var28)) (= var10 var27)) (= var8 var26)) (= var1 var25)) (= var0 var24)) (= var3 var23))))))) (inv_main27 var19 var17 var15 var13 var11 var9 var7 var6 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Heap) (var17 Heap) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Int) (var25 AddrRange) (var26 AddrRange) (var27 Int) (var28 Heap)) (or (not (and (inv_main22 var28 var27 var26 var25 var24 var23 var22 var21 var20) (and (and (not (= var19 0)) (and (<= 0 var18) (and (and (and (and (and (and (and (and (and (= var17 var16) (= var15 var14)) (= var13 var12)) (= var11 var10)) (= var9 (+ var8 1))) (= var7 var6)) (= var5 var18)) (= var4 var3)) (= var2 var1)) (or (and (<= 0 (+ (+ var14 (* (- 1) var18)) (- 1))) (= var19 1)) (and (not (<= 0 (+ (+ var14 (* (- 1) var18)) (- 1)))) (= var19 0)))))) (and (not (<= 0 (+ (+ var14 (* (- 1) (+ var8 1))) (- 1)))) (and (and (is-O_Int (read var28 (nthAddrRange var25 var24))) (is-O_Int (read var28 (nthAddrRange var25 var24)))) (and (and (and (and (and (and (and (and (= var16 (write var28 (nthAddrRange var25 var24) (O_Int 0))) (= var14 var27)) (= var12 var26)) (= var10 var25)) (= var8 var24)) (= var6 var23)) (= var0 var22)) (= var3 var21)) (= var1 var20))))))) (inv_main27 var17 var15 var13 var11 var9 var7 var5 var4 var2))))
(assert (forall ((var0 Int) (var1 Heap) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Int) (var21 Heap) (var22 Heap) (var23 Int) (var24 Int) (var25 Int) (var26 Heap)) (or (not (and (inv_main2 var26 var25) (and (and (not (= var24 0)) (and (<= 0 var23) (and (and (and (and (and (and (and (and (and (= var22 var21) (= var20 var19)) (= var18 var17)) (= var16 var15)) (= var14 0)) (= var13 (- 1))) (= var12 var23)) (= var11 var10)) (= var9 0)) (or (and (<= 0 (+ (+ var19 (* (- 1) var23)) (- 1))) (= var24 1)) (and (not (<= 0 (+ (+ var19 (* (- 1) var23)) (- 1)))) (= var24 0)))))) (and (and (and (not (<= 0 (+ var19 (- 1)))) (and (and (and (= var21 (newBatchHeap (batchAlloc emptyHeap (O_Int var8) var7))) (= var19 var7)) (= var17 var6)) (= var15 (newAddrRange (batchAlloc emptyHeap (O_Int var8) var7))))) (and (and (= var5 (newBatchHeap (batchAlloc emptyHeap (O_Int var4) var3))) (= var7 var3)) (= var6 (newAddrRange (batchAlloc emptyHeap (O_Int var4) var3))))) (and (not (= var2 0)) (and (and (= var1 var26) (= var3 var0)) (or (and (<= 0 (+ var0 (- 1))) (= var2 1)) (and (not (<= 0 (+ var0 (- 1)))) (= var2 0))))))))) (inv_main27 var22 var20 var18 var16 var14 var13 var12 var11 var9))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 AddrRange) (var17 Int) (var18 Heap)) (or (not (and (inv_main22 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ var9 (* (- 1) (+ var8 1))) (- 1))) (and (and (is-O_Int (read var18 (nthAddrRange var15 var14))) (is-O_Int (read var18 (nthAddrRange var15 var14)))) (and (and (and (and (and (and (and (and (= var7 (write var18 (nthAddrRange var15 var14) (O_Int 0))) (= var9 var17)) (= var6 var16)) (= var5 var15)) (= var8 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)))) (= var0 (+ var8 1))))) (inv_main20 var7 var9 var6 var5 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Int) (var16 Heap) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (inv_main2 var19 var18) (and (and (and (and (and (and (<= 0 (+ var17 (- 1))) (and (and (and (= var16 (newBatchHeap (batchAlloc emptyHeap (O_Int var15) var14))) (= var17 var14)) (= var13 var12)) (= var11 (newAddrRange (batchAlloc emptyHeap (O_Int var15) var14))))) (and (and (= var10 (newBatchHeap (batchAlloc emptyHeap (O_Int var9) var8))) (= var14 var8)) (= var12 (newAddrRange (batchAlloc emptyHeap (O_Int var9) var8))))) (and (not (= var7 0)) (and (and (= var6 var19) (= var8 var5)) (or (and (<= 0 (+ var5 (- 1))) (= var7 1)) (and (not (<= 0 (+ var5 (- 1)))) (= var7 0)))))) (= var4 0)) (= var3 (- 1))) (= var2 0)))) (inv_main20 var16 var17 var13 var11 var4 var3 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 AddrRange) (var19 AddrRange) (var20 Int) (var21 Heap)) (or (not (and (inv_main40 var21 var20 var19 var18 var17 var16 var15 var14 var13 var12) (and (and (not (<= 0 (+ var11 (- 1)))) (and (= var10 0) (and (and (is-O_Int (read var21 (nthAddrRange var18 (+ (+ var12 (- 1)) (* (- 1) var15))))) (is-O_Int (read var21 (nthAddrRange var18 (+ (+ var12 (- 1)) (* (- 1) var15)))))) (and (and (and (and (and (and (and (and (= var9 (write var21 (nthAddrRange var18 (+ (+ var12 (- 1)) (* (- 1) var15))) (O_Int (+ var8 (* var16 var15))))) (= var11 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14)) (= var1 var13))))) (= var0 0)))) (inv_main45 var9 var11 var7 var6 var0 var4 var3 var10 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Heap)) (or (not (and (inv_main49 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (not (<= 0 (+ (+ var10 (* (- 1) (+ var9 1))) (- 1)))) (and (is-O_Int (read var20 (nthAddrRange var17 var16))) (and (and (and (and (and (and (and (and (and (= var8 var20) (= var10 var19)) (= var7 var18)) (= var6 var17)) (= var9 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 (+ var11 (getInt (read var20 (nthAddrRange var17 var16)))))))) (= var0 (+ var9 1))))) (inv_main45 var8 var10 var7 var6 var0 var5 var4 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 AddrRange) (var19 AddrRange) (var20 Int) (var21 Heap)) (or (not (and (inv_main40 var21 var20 var19 var18 var17 var16 var15 var14 var13 var12) (and (and (<= 0 (+ var11 (- 1))) (and (= var10 0) (and (and (is-O_Int (read var21 (nthAddrRange var18 (+ (+ var12 (- 1)) (* (- 1) var15))))) (is-O_Int (read var21 (nthAddrRange var18 (+ (+ var12 (- 1)) (* (- 1) var15)))))) (and (and (and (and (and (and (and (and (= var9 (write var21 (nthAddrRange var18 (+ (+ var12 (- 1)) (* (- 1) var15))) (O_Int (+ var8 (* var16 var15))))) (= var11 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14)) (= var1 var13))))) (= var0 0)))) (inv_main47 var9 var11 var7 var6 var0 var4 var3 var10 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Heap)) (or (not (and (inv_main49 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (<= 0 (+ (+ var10 (* (- 1) (+ var9 1))) (- 1))) (and (is-O_Int (read var20 (nthAddrRange var17 var16))) (and (and (and (and (and (and (and (and (and (= var8 var20) (= var10 var19)) (= var7 var18)) (= var6 var17)) (= var9 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 (+ var11 (getInt (read var20 (nthAddrRange var17 var16)))))))) (= var0 (+ var9 1))))) (inv_main47 var8 var10 var7 var6 var0 var5 var4 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 AddrRange) (var18 Int) (var19 Heap)) (or (not (and (inv_main38 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (is-O_Int (read var19 (nthAddrRange var16 (+ (+ var10 (- 1)) (* (- 1) var13))))) (and (and (and (and (and (and (and (and (and (= var9 var19) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var0 (getInt (read var19 (nthAddrRange var16 (+ (+ var10 (- 1)) (* (- 1) var13)))))))))) (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var8))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (or (not (and (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var9 (nthAddrRange var7 var5))) (is-O_Int (read var9 (nthAddrRange var7 var5)))) (= var0 (write var9 (nthAddrRange var7 var5) (O_Int 0)))))) (inv_main22 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (or (not (and (inv_main27 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var7 var3))) (= var0 (getInt (read var9 (nthAddrRange var7 var3))))))) (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 AddrRange) (var17 Int) (var18 Heap)) (or (not (and (inv_main36 var18 var17 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (is-O_Int (read var18 (nthAddrRange var16 var12))) (is-O_Int (read var18 (nthAddrRange var16 var12)))) (and (and (and (and (and (and (and (and (= var8 (write var18 (nthAddrRange var16 var12) (O_Int (+ var9 (* (* var13 var13) var12))))) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10))))) (inv_main38 var8 var7 var6 var5 var4 var3 var2 var1 var0 var7))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (or (not (and (inv_main47 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var7 var5))) (= var0 (+ var1 (getInt (read var9 (nthAddrRange var7 var5)))))))) (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main20 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var6 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main20 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var6 var4))) (not (within var6 (nthAddrRange var6 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main20 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var6 var4))) (not (is-O_Int (read var8 (nthAddrRange var6 var4)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main22 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main22 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main22 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var5 var4))) (not (is-O_Int (read var8 (nthAddrRange var5 var4)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main27 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var6 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main27 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var6 var2))) (not (within var6 (nthAddrRange var6 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var7 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var7 var3))) (not (within var7 (nthAddrRange var7 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var7 var3))) (not (is-O_Int (read var9 (nthAddrRange var7 var3)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var6 (+ (+ var0 (- 1)) (* (- 1) var3))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 (+ (+ var0 (- 1)) (* (- 1) var3))))) (not (within var6 (nthAddrRange var6 (+ (+ var0 (- 1)) (* (- 1) var3))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var6 (+ (+ var0 (- 1)) (* (- 1) var3))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 (+ (+ var0 (- 1)) (* (- 1) var3))))) (not (within var6 (nthAddrRange var6 (+ (+ var0 (- 1)) (* (- 1) var3))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 (+ (+ var0 (- 1)) (* (- 1) var3))))) (not (is-O_Int (read var9 (nthAddrRange var6 (+ (+ var0 (- 1)) (* (- 1) var3)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main47 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var6 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main47 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var6 var4))) (not (within var6 (nthAddrRange var6 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap)) (not (and (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 var5))) (not (within var6 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap)) (not (and (inv_main45 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (= var0 0))))))
(check-sat)
