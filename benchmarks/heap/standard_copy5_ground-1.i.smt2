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
(declare-fun inv_main14 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main18 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main20 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main23 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main25 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main28 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main30 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main33 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main35 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main38 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main40 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main44 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main9 (Heap AddrRange AddrRange AddrRange AddrRange AddrRange AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 AddrRange) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 Int) (var15 Heap) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 AddrRange) (var20 Int) (var21 Heap) (var22 AddrRange) (var23 AddrRange) (var24 AddrRange) (var25 Int) (var26 Heap) (var27 AddrRange) (var28 AddrRange) (var29 Int) (var30 Heap) (var31 AddrRange) (var32 Int) (var33 Heap) (var34 Heap)) (or (not (and (and (and (and (and (and (= var34 emptyHeap) (and (= var33 (newBatchHeap (batchAlloc emptyHeap (O_Int var32) 100000))) (= var31 (newAddrRange (batchAlloc emptyHeap (O_Int var32) 100000))))) (and (and (= var30 (newBatchHeap (batchAlloc emptyHeap (O_Int var29) 100000))) (= var28 var31)) (= var27 (newAddrRange (batchAlloc emptyHeap (O_Int var29) 100000))))) (and (and (and (= var26 (newBatchHeap (batchAlloc emptyHeap (O_Int var25) 100000))) (= var24 var28)) (= var23 var27)) (= var22 (newAddrRange (batchAlloc emptyHeap (O_Int var25) 100000))))) (and (and (and (and (= var21 (newBatchHeap (batchAlloc emptyHeap (O_Int var20) 100000))) (= var19 var24)) (= var18 var23)) (= var17 var22)) (= var16 (newAddrRange (batchAlloc emptyHeap (O_Int var20) 100000))))) (and (and (and (and (and (= var15 (newBatchHeap (batchAlloc emptyHeap (O_Int var14) 100000))) (= var13 var19)) (= var12 var18)) (= var11 var17)) (= var10 var16)) (= var9 (newAddrRange (batchAlloc emptyHeap (O_Int var14) 100000))))) (and (and (and (and (and (and (= var8 (newBatchHeap (batchAlloc emptyHeap (O_Int var7) 100000))) (= var6 var13)) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var7) 100000)))))) (inv_main9 var8 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main18 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var8 var1))) (= var0 (getInt (read var9 (nthAddrRange var8 var1))))))) (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main23 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var7 var1))) (= var0 (getInt (read var9 (nthAddrRange var7 var1))))))) (inv_main25 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main35 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var19 (nthAddrRange var14 var11))) (is-O_Int (read var19 (nthAddrRange var14 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var14 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 (+ var9 1))))) (inv_main33 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main30 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1)))) (and (and (is-O_Int (read var19 (nthAddrRange var15 var11))) (is-O_Int (read var19 (nthAddrRange var15 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var15 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 0)))) (inv_main33 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main30 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var19 (nthAddrRange var15 var11))) (is-O_Int (read var19 (nthAddrRange var15 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var15 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 (+ var9 1))))) (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main25 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1)))) (and (and (is-O_Int (read var19 (nthAddrRange var16 var11))) (is-O_Int (read var19 (nthAddrRange var16 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var16 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 0)))) (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main38 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var4 var1))) (= var0 (getInt (read var9 (nthAddrRange var4 var1))))))) (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main25 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var19 (nthAddrRange var16 var11))) (is-O_Int (read var19 (nthAddrRange var16 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var16 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 (+ var9 1))))) (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main20 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1)))) (and (and (is-O_Int (read var19 (nthAddrRange var17 var11))) (is-O_Int (read var19 (nthAddrRange var17 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var17 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 0)))) (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 0))) (inv_main14 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 AddrRange) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 Heap)) (or (not (and (inv_main14 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var17 (nthAddrRange var16 var10))) (is-O_Int (read var17 (nthAddrRange var16 var10)))) (and (and (and (and (and (and (and (= var8 (write var17 (nthAddrRange var16 var10) (O_Int var7))) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var9 var10)))) (= var0 (+ var9 1))))) (inv_main14 var8 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 AddrRange) (var10 Heap)) (or (not (and (inv_main44 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var1 1))) (- 1))) (and (is-O_Int (read var10 (nthAddrRange var9 var1))) (is-O_Int (read var10 (nthAddrRange var4 var1))))) (= var0 (+ var1 1))))) (inv_main44 var10 var9 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 AddrRange) (var20 Heap)) (or (not (and (inv_main40 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var10 1))) (- 1)))) (and (and (is-O_Int (read var20 (nthAddrRange var14 var12))) (is-O_Int (read var20 (nthAddrRange var14 var12)))) (and (and (and (and (and (and (and (and (= var9 (write var20 (nthAddrRange var14 var12) (O_Int var11))) (= var8 var19)) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var10 var12)))) (= var1 (+ var10 1))) (= var0 0)))) (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main40 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var19 (nthAddrRange var13 var11))) (is-O_Int (read var19 (nthAddrRange var13 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var13 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 (+ var9 1))))) (inv_main38 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main35 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1)))) (and (and (is-O_Int (read var19 (nthAddrRange var14 var11))) (is-O_Int (read var19 (nthAddrRange var14 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var14 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 0)))) (inv_main38 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 AddrRange) (var19 Heap)) (or (not (and (inv_main20 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var19 (nthAddrRange var17 var11))) (is-O_Int (read var19 (nthAddrRange var17 var11)))) (and (and (and (and (and (and (and (and (= var8 (write var19 (nthAddrRange var17 var11) (O_Int var10))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var9 var11)))) (= var0 (+ var9 1))))) (inv_main18 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 AddrRange) (var13 AddrRange) (var14 AddrRange) (var15 AddrRange) (var16 AddrRange) (var17 AddrRange) (var18 Heap)) (or (not (and (inv_main14 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var10 1))) (- 1)))) (and (and (is-O_Int (read var18 (nthAddrRange var17 var11))) (is-O_Int (read var18 (nthAddrRange var17 var11)))) (and (and (and (and (and (and (and (= var9 (write var18 (nthAddrRange var17 var11) (O_Int var8))) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var10 var11)))) (= var1 (+ var10 1))) (= var0 0)))) (inv_main18 var9 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main33 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var5 var1))) (= var0 (getInt (read var9 (nthAddrRange var5 var1))))))) (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main28 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var9 (nthAddrRange var6 var1))) (= var0 (getInt (read var9 (nthAddrRange var6 var1))))))) (inv_main30 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (not (and (inv_main14 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var6 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (not (and (inv_main14 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var6 var0))) (not (within var6 (nthAddrRange var6 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (not (and (inv_main14 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var6 var0))) (not (is-O_Int (read var7 (nthAddrRange var6 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main18 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var7 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main18 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var7 var0))) (not (within var7 (nthAddrRange var7 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var7 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var7 var1))) (not (within var7 (nthAddrRange var7 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main20 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var7 var1))) (not (is-O_Int (read var9 (nthAddrRange var7 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var6 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var6 var0))) (not (within var6 (nthAddrRange var6 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main25 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var6 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main25 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 var1))) (not (within var6 (nthAddrRange var6 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main25 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var6 var1))) (not (is-O_Int (read var9 (nthAddrRange var6 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var5 var0))) (not (within var5 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main30 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var5 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main30 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 var1))) (not (within var5 (nthAddrRange var5 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main30 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var5 var1))) (not (is-O_Int (read var9 (nthAddrRange var5 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main33 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main33 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var4 var0))) (not (within var4 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var4 var1))) (not (within var4 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var4 var1))) (not (is-O_Int (read var9 (nthAddrRange var4 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main38 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (not (and (inv_main38 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var3 var0))) (not (within var3 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var3 var1))) (not (within var3 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main40 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var3 var1))) (not (is-O_Int (read var9 (nthAddrRange var3 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var8 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var8 (nthAddrRange var8 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var3 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var9 (nthAddrRange var8 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var8 var0))) (not (within var8 (nthAddrRange var8 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var9 (nthAddrRange var8 var0))) (not (is-O_Int (read var9 (nthAddrRange var3 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var9 (nthAddrRange var8 var0))) (is-O_Int (read var9 (nthAddrRange var3 var0)))) (not (within var3 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (not (and (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var9 (nthAddrRange var8 var0))) (is-O_Int (read var9 (nthAddrRange var3 var0)))) (not (= (getInt (read var9 (nthAddrRange var8 var0))) (getInt (read var9 (nthAddrRange var3 var0))))))))))
(check-sat)
