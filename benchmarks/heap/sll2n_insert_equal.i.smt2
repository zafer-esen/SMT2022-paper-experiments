(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
(declare-heap Heap Addr HeapObject
 defObj
 ((HeapObject 0) (node 0)) (
  (
   (O_Int (getInt Int))
   (O_UInt (getUInt Int))
   (O_Addr (getAddr Addr))
   (O_node (getnode node))
   (defObj)
  )
  (
   (node (data Int) (next Addr))
  )
))
(declare-fun inv_main10 (Heap Int Int Int Int Addr) Bool)
(declare-fun inv_main17 (Heap Int Int Int Int Addr Int Addr) Bool)
(declare-fun inv_main20 (Heap Int Int Int Int Addr Int Addr Int) Bool)
(declare-fun inv_main23 (Heap Int Int Int Int Addr Int Addr) Bool)
(declare-fun inv_main25 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main36 (Heap Int Int Addr Int Int Int Int Addr) Bool)
(declare-fun inv_main39 (Heap Int Int Addr Int Int Int Int Addr Int) Bool)
(declare-fun inv_main4 (Heap Int Int) Bool)
(declare-fun inv_main42 (Heap Int Int Addr Int Int Int Int Addr) Bool)
(declare-fun inv_main46 (Heap Int Int Addr Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main49 (Heap Int Int Addr Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main52 (Heap Int Int Addr Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main53 (Heap Int Int Addr Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main56 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main58 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main59 (Heap Int Int Addr Addr Int Addr) Bool)
(declare-fun inv_main71 (Heap Int Int Addr Addr Int Addr) Bool)
(declare-fun inv_main74 (Heap Int Int Addr Addr Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var2 emptyHeap) (= var1 2)) (= var0 1))) (inv_main4 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Int) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Heap) (var15 Addr) (var16 Addr) (var17 Int) (var18 Addr) (var19 Addr) (var20 Int) (var21 Int) (var22 Heap)) (or (not (and (inv_main71 var22 var21 var20 var19 var18 var17 var16) (and (not (= var15 nullAddr)) (and (and (is-O_node (read var22 var16)) (and (and (and (and (and (and (and (= var14 var22) (= var13 var21)) (= var12 var20)) (= var11 var19)) (= var10 var18)) (= var9 var17)) (= var8 var16)) (= var7 (next (getnode (read var22 var16)))))) (and (and (and (and (and (and (and (= var6 (write var14 var8 defObj)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8)) (= var15 var7)))))) (inv_main71 var6 var5 var4 var3 var2 var1 var15))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main56 var5 var4 var3 var2 var1 var0) (and (not (= var2 nullAddr)) (and (= var0 (+ 1 var4)) (= var1 nullAddr))))) (inv_main71 var5 var4 var3 var2 var1 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main46 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (not (= var1 nullAddr)) (not (<= 0 (+ var3 (- 1))))))) (inv_main53 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 node) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main10 var14 var13 var12 var11 var10 var9) (and (and (not (= nullAddr var8)) (and (and (and (and (and (and (and (= var7 (newHeap (alloc var14 (O_node var6)))) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var10)) (= var8 (newAddr (alloc var14 (O_node var6)))))) (<= 0 (+ var11 (- 1)))))) (inv_main17 var7 var5 var4 var3 var2 var1 var0 var8))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main59 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var7 var3)) (= var5 (data (getnode (read var7 var3))))) (= var0 (+ var2 1))))) (inv_main56 var7 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Addr) (var15 Int) (var16 Int) (var17 Heap)) (or (not (and (inv_main52 var17 var16 var15 var14 var13 var12 var11 var10 var9 var8) (and (and (and (is-O_node (read var17 var10)) (is-O_node (read var17 var10))) (and (and (and (and (and (and (= var7 (write var17 var10 (O_node (node (data (getnode (read var17 var10))) var8)))) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11))) (= var0 0)))) (inv_main56 var7 var6 var5 var4 var4 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main17 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var8 var1)) (is-O_node (read var8 var1))) (= var0 (write var8 var1 (O_node (node (data (getnode (read var8 var1))) nullAddr))))))) (inv_main23 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main56 var5 var4 var3 var2 var1 var0) (not (= var1 nullAddr)))) (inv_main58 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main23 var15 var14 var13 var12 var11 var10 var9 var8) (and (and (is-O_node (read var15 var8)) (is-O_node (read var15 var8))) (and (and (and (and (and (and (and (= var7 (write var15 var8 (O_node (node var9 (next (getnode (read var15 var8))))))) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8))))) (inv_main25 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main25 var14 var13 var12 var11 var10 var9 var8) (and (and (and (is-O_node (read var14 var8)) (is-O_node (read var14 var8))) (and (and (and (and (and (and (= var7 (write var14 var8 (O_node (node (data (getnode (read var14 var8))) var9)))) (= var6 var13)) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 (+ var4 (- 1)))))) (inv_main10 var7 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main4 var8 var7 var6) (and (and (and (and (and (= var5 var8) (= var4 var7)) (= var3 var6)) (= var2 var7)) (= var1 var6)) (= var0 nullAddr)))) (inv_main10 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Int) (var11 Heap) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Int) (var16 Int) (var17 Int) (var18 Addr) (var19 Int) (var20 Int) (var21 Heap)) (or (not (and (inv_main49 var21 var20 var19 var18 var17 var16 var15 var14 var13 var12) (and (and (is-O_node (read var21 var12)) (and (and (and (and (and (and (and (and (and (and (= var11 var21) (= var10 var20)) (= var9 var19)) (= var8 var18)) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 (next (getnode (read var21 var12)))))) (= var0 (+ var5 (- 1)))))) (inv_main46 var11 var10 var9 var8 var7 var6 var0 var4 var3 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap) (var17 Heap) (var18 Addr) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Addr) (var24 Int) (var25 Int) (var26 Heap)) (or (not (and (inv_main42 var26 var25 var24 var23 var22 var21 var20 var19 var18) (and (and (and (and (and (and (and (and (and (= var17 var16) (= var15 var14)) (= var13 var12)) (= var11 var10)) (= var9 var8)) (= var7 var6)) (= var5 var4)) (= var3 var2)) (= var1 nullAddr)) (and (and (is-O_node (read var26 var18)) (is-O_node (read var26 var18))) (and (and (and (and (and (and (and (and (= var16 (write var26 var18 (O_node (node var19 (next (getnode (read var26 var18))))))) (= var14 var25)) (= var12 var24)) (= var10 var23)) (= var8 var22)) (= var6 var21)) (= var4 var20)) (= var0 var19)) (= var2 var18)))))) (inv_main46 var17 var15 var13 var11 var9 var7 var5 var3 var1 var11))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main53 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var10 var2)) (is-O_node (read var10 var2))) (= var0 (write var10 var2 (O_node (node (data (getnode (read var10 var2))) var3))))))) (inv_main52 var0 var9 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main46 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (= var1 nullAddr) (not (<= 0 (+ var3 (- 1))))))) (inv_main52 var9 var8 var7 var2 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 node) (var14 Heap) (var15 Heap) (var16 Addr) (var17 Addr) (var18 Int) (var19 Int) (var20 Int) (var21 Int) (var22 Heap) (var23 Int)) (or (not (and (inv_main10 var22 var21 var20 var19 var18 var17) (and (and (and (not (= nullAddr var16)) (and (and (and (and (and (and (and (and (= var15 (newHeap (alloc var14 (O_node var13)))) (= var12 var11)) (= var10 var9)) (= var8 var7)) (= var6 var5)) (= var4 var3)) (= var2 var1)) (= var0 var3)) (= var16 (newAddr (alloc var14 (O_node var13)))))) (and (and (and (and (and (and (= var14 var22) (= var11 var21)) (= var9 var20)) (= var7 var17)) (= var5 3)) (= var3 var20)) (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ var21 (* (- 2) var23)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ var21 (* (- 2) var23)))) (- 1)))) (or (not (<= 0 (+ (+ var21 (* (- 2) var23)) (- 1)))) (<= 0 (+ var21 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var21 (* (- 2) var23))) (- 1)))) (<= 0 (+ (* (- 1) var21) (- 1))))) (= var1 var23)))) (not (<= 0 (+ var19 (- 1))))))) (inv_main36 var15 var12 var10 var8 var6 var4 var2 var0 var16))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main46 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ var3 (- 1))))) (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var0 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main36 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var9 var1)) (is-O_node (read var9 var1))) (= var0 (write var9 var1 (O_node (node (data (getnode (read var9 var1))) nullAddr))))))) (inv_main42 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (inv_main20 var8 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main20 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 node) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main10 var15 var14 var13 var12 var11 var10) (and (and (and (= nullAddr var9) (and (and (and (and (and (and (and (= var8 (newHeap (alloc var15 (O_node var7)))) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var11)) (= var9 (newAddr (alloc var15 (O_node var7)))))) (<= 0 (+ var12 (- 1)))) (= var0 1)))) (inv_main20 var8 var6 var5 var4 var3 var2 var1 var9 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main58 var6 var5 var4 var3 var2 var1) (and (is-O_node (read var6 var2)) (= var0 (next (getnode (read var6 var2))))))) (inv_main59 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var2)) (not (= var4 (data (getnode (read var6 var2)))))))) (inv_main74 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main56 var5 var4 var3 var2 var1 var0) (and (not (= var0 (+ 1 var4))) (= var1 nullAddr)))) (inv_main74 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (inv_main39 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main39 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 node) (var15 Heap) (var16 Heap) (var17 Addr) (var18 Addr) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Heap) (var24 Int)) (or (not (and (inv_main10 var23 var22 var21 var20 var19 var18) (and (and (and (and (= nullAddr var17) (and (and (and (and (and (and (and (and (= var16 (newHeap (alloc var15 (O_node var14)))) (= var13 var12)) (= var11 var10)) (= var9 var8)) (= var7 var6)) (= var5 var4)) (= var3 var2)) (= var1 var4)) (= var17 (newAddr (alloc var15 (O_node var14)))))) (and (and (and (and (and (and (= var15 var23) (= var12 var22)) (= var10 var21)) (= var8 var18)) (= var6 3)) (= var4 var21)) (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ var22 (* (- 2) var24)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ var22 (* (- 2) var24)))) (- 1)))) (or (not (<= 0 (+ (+ var22 (* (- 2) var24)) (- 1)))) (<= 0 (+ var22 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var22 (* (- 2) var24))) (- 1)))) (<= 0 (+ (* (- 1) var22) (- 1))))) (= var2 var24)))) (not (<= 0 (+ var20 (- 1))))) (= var0 1)))) (inv_main39 var16 var13 var11 var9 var7 var5 var3 var1 var17 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main17 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main17 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var7 var0)) (not (is-O_node (read var7 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var7 var0)) (not (is-O_node (read var7 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var0)) (not (is-O_node (read var6 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main36 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main36 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var0)) (not (is-O_node (read var8 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main42 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main42 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var0)) (not (is-O_node (read var8 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main49 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var9 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main53 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var9 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main53 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var9 var1)) (not (is-O_node (read var9 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main52 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var9 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (not (and (inv_main52 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var9 var2)) (not (is-O_node (read var9 var2))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main58 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var2)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main71 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (inv_main74 var5 var4 var3 var2 var1 var0))))
(check-sat)