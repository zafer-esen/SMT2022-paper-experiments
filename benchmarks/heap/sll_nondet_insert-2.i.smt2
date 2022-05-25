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
   (node (next Addr))
  )
))
(declare-fun inv_main15 (Heap Int Int Addr) Bool)
(declare-fun inv_main19 (Heap Int Int Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main30 (Heap Int Addr Int Int Int) Bool)
(declare-fun inv_main36 (Heap Int Addr Int Int) Bool)
(declare-fun inv_main42 (Heap Int Addr Int Int Int Int Int) Bool)
(declare-fun inv_main47 (Heap Int Addr Int Int Int) Bool)
(declare-fun inv_main56 (Heap Int Addr Int Int Int Int Int Addr Int) Bool)
(declare-fun inv_main6 (Heap Int Int Int) Bool)
(declare-fun inv_main61 (Heap Int Addr Int Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main63 (Heap Int Addr Int Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main66 (Heap Int Addr Int Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main77 (Heap Int Addr Int Int Int Addr Int) Bool)
(declare-fun inv_main83 (Heap Int Addr Int Int Addr) Bool)
(declare-fun inv_main86 (Heap Int Addr Int Int) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Int) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Addr) (var20 Int) (var21 Heap)) (or (not (and (inv_main61 var21 var20 var19 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (not (= var10 nullAddr)) (and (is-O_node (read var21 var13)) (is-O_node (read var21 var13)))) (and (and (and (and (and (and (and (and (and (and (= var9 (write var21 var13 (O_node (node var11)))) (= var8 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14)) (= var1 var13)) (= var10 var12)) (= var0 var11))))) (inv_main66 var9 var8 var7 var6 var5 var4 var3 var2 var1 var10 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Addr) (var16 Int) (var17 Heap)) (or (not (and (inv_main77 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (not (= var9 nullAddr)) (and (is-O_node (read var17 var11)) (and (and (and (and (and (and (and (and (= var8 var17) (= var7 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var9 (next (getnode (read var17 var11))))))) (= var0 (+ var1 1))))) (inv_main77 var8 var7 var6 var5 var4 var3 var9 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (inv_main36 var6 var5 var4 var3 var2) (and (and (and (not (= var4 nullAddr)) (not (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1))))) (= var1 (+ var3 var5))) (= var0 1)))) (inv_main77 var6 var5 var4 var3 var2 var1 var4 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 node) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main15 var9 var8 var7 var6) (and (and (not (= nullAddr var5)) (and (and (and (and (= var4 (newHeap (alloc var9 (O_node var3)))) (= var2 var8)) (= var1 (+ var7 (- 1)))) (= var0 var6)) (= var5 (newAddr (alloc var9 (O_node var3)))))) (<= 0 (+ var7 (- 1)))))) (inv_main19 var4 var2 var1 var0 var5))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (or (not (and (inv_main30 var7 var6 var5 var4 var3 var2) (and (and (not (= var1 0)) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1)))) (= var0 (+ var2 1))))) (inv_main30 var7 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main15 var6 var5 var4 var3) (and (and (and (not (<= 0 (+ var4 (- 1)))) (= var2 0)) (= var1 (+ var5 (- 1)))) (= var0 0)))) (inv_main30 var6 var5 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (inv_main77 var16 var15 var14 var13 var12 var11 var10 var9) (and (not (= var8 var7)) (and (= var6 nullAddr) (and (is-O_node (read var16 var10)) (and (and (and (and (and (and (and (and (= var5 var16) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12)) (= var8 var11)) (= var0 var10)) (= var7 var9)) (= var6 (next (getnode (read var16 var10)))))))))) (inv_main86 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Heap)) (or (not (and (inv_main36 var4 var3 var2 var1 var0) (and (and (not (= (+ var1 var3) 0)) (= var2 nullAddr)) (not (<= 0 (+ (+ var1 (* (- 1) var0)) (- 1))))))) (inv_main86 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Addr) (var10 Int) (var11 Heap) (var12 Int) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Int) (var21 Addr) (var22 Int) (var23 Heap)) (or (not (and (inv_main63 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13) (and (and (<= 0 (+ var12 (- 1))) (and (is-O_node (read var23 var13)) (and (and (and (and (and (and (and (and (and (and (and (= var11 var23) (= var10 var22)) (= var9 var21)) (= var8 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var12 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 (next (getnode (read var23 var13))))))) (= var0 (+ var12 (- 1)))))) (inv_main63 var11 var10 var9 var8 var7 var6 var5 var0 var4 var1 var1))))
(assert (forall ((var0 Int) (var1 node) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Addr) (var15 Addr) (var16 Int) (var17 Int) (var18 Heap) (var19 Heap) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Addr) (var25 Int) (var26 Heap)) (or (not (and (inv_main47 var26 var25 var24 var23 var22 var21) (and (and (and (<= 0 (+ var20 (- 1))) (and (and (and (and (and (and (and (and (and (= var19 var18) (= var17 var16)) (= var15 var14)) (= var13 var12)) (= var11 var10)) (= var9 var8)) (= var7 var6)) (= var20 var5)) (= var4 var3)) (= var2 nullAddr))) (and (not (= nullAddr var3)) (and (and (and (and (and (and (and (and (= var18 (newHeap (alloc var26 (O_node var1)))) (= var16 var25)) (= var14 var24)) (= var12 var23)) (= var10 var22)) (= var8 var21)) (= var6 2)) (= var5 var21)) (= var3 (newAddr (alloc var26 (O_node var1))))))) (= var0 (+ var20 (- 1)))))) (inv_main63 var19 var17 var15 var13 var11 var9 var7 var0 var4 var15 var15))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Int) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap) (var13 Addr) (var14 Addr) (var15 Int) (var16 Int) (var17 Addr) (var18 Int) (var19 Heap)) (or (not (and (inv_main83 var19 var18 var17 var16 var15 var14) (and (not (= var13 nullAddr)) (and (and (is-O_node (read var19 var14)) (and (and (and (and (and (and (= var12 var19) (= var11 var18)) (= var10 var17)) (= var9 var16)) (= var8 var15)) (= var7 var14)) (= var6 (next (getnode (read var19 var14)))))) (and (and (and (and (and (and (= var5 (write var12 var7 defObj)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7)) (= var13 var6)))))) (inv_main83 var5 var4 var3 var2 var1 var13))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Heap) (var5 Addr) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (inv_main77 var16 var15 var14 var13 var12 var11 var10 var9) (and (not (= var8 nullAddr)) (and (= var7 var6) (and (= var5 nullAddr) (and (is-O_node (read var16 var10)) (and (and (and (and (and (and (and (and (= var4 var16) (= var3 var15)) (= var8 var14)) (= var2 var13)) (= var1 var12)) (= var7 var11)) (= var0 var10)) (= var6 var9)) (= var5 (next (getnode (read var16 var10))))))))))) (inv_main83 var4 var3 var8 var2 var1 var8))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Heap)) (or (not (and (inv_main36 var4 var3 var2 var1 var0) (and (not (= var2 nullAddr)) (and (and (= (+ var1 var3) 0) (= var2 nullAddr)) (not (<= 0 (+ (+ var1 (* (- 1) var0)) (- 1)))))))) (inv_main83 var4 var3 var2 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap)) (or (not (and (inv_main42 var9 var8 var7 var6 var5 var4 var3 var2) (and (and (not (= var1 0)) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1)))) (= var0 (+ var2 1))))) (inv_main42 var9 var8 var7 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (or (not (and (inv_main36 var7 var6 var5 var4 var3) (and (and (and (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))) (= var2 0)) (= var1 (+ var3 (+ var6 (- 1))))) (= var0 0)))) (inv_main42 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Addr) (var10 Int) (var11 Heap) (var12 Int) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Int) (var21 Addr) (var22 Int) (var23 Heap)) (or (not (and (inv_main63 var23 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13) (and (and (not (<= 0 (+ var12 (- 1)))) (and (is-O_node (read var23 var13)) (and (and (and (and (and (and (and (and (and (and (and (= var11 var23) (= var10 var22)) (= var9 var21)) (= var8 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var12 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 (next (getnode (read var23 var13))))))) (= var0 (+ var12 (- 1)))))) (inv_main61 var11 var10 var9 var8 var7 var6 var5 var0 var4 var3 var1))))
(assert (forall ((var0 Int) (var1 node) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Addr) (var15 Addr) (var16 Int) (var17 Int) (var18 Heap) (var19 Heap) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Addr) (var25 Int) (var26 Heap)) (or (not (and (inv_main47 var26 var25 var24 var23 var22 var21) (and (and (and (not (<= 0 (+ var20 (- 1)))) (and (and (and (and (and (and (and (and (and (= var19 var18) (= var17 var16)) (= var15 var14)) (= var13 var12)) (= var11 var10)) (= var9 var8)) (= var7 var6)) (= var20 var5)) (= var4 var3)) (= var2 nullAddr))) (and (not (= nullAddr var3)) (and (and (and (and (and (and (and (and (= var18 (newHeap (alloc var26 (O_node var1)))) (= var16 var25)) (= var14 var24)) (= var12 var23)) (= var10 var22)) (= var8 var21)) (= var6 2)) (= var5 var21)) (= var3 (newAddr (alloc var26 (O_node var1))))))) (= var0 (+ var20 (- 1)))))) (inv_main61 var19 var17 var15 var13 var11 var9 var7 var0 var4 var2 var15))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main6 var5 var4 var3 var2) (and (and (not (= var1 0)) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1)))) (= var0 (+ var2 1))))) (inv_main6 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Heap)) (or (not (and (inv_main2 var3) (and (and (= var2 2) (= var1 5)) (= var0 2)))) (inv_main6 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap)) (or (not (inv_main56 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main56 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 node) (var9 Heap) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (inv_main47 var16 var15 var14 var13 var12 var11) (and (and (= nullAddr var10) (and (and (and (and (and (and (and (and (= var9 (newHeap (alloc var16 (O_node var8)))) (= var7 var15)) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 2)) (= var1 var11)) (= var10 (newAddr (alloc var16 (O_node var8)))))) (= var0 1)))) (inv_main56 var9 var7 var6 var5 var4 var3 var2 var1 var10 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main19 var9 var8 var7 var6 var5) (and (and (is-O_node (read var9 var5)) (is-O_node (read var9 var5))) (and (and (and (and (= var4 (write var9 var5 (O_node (node var6)))) (= var3 var8)) (= var2 var7)) (= var1 var6)) (= var0 var5))))) (inv_main15 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (inv_main6 var4 var3 var2 var1) (and (not (<= 0 (+ (+ var2 (* (- 1) var1)) (- 1)))) (= var0 nullAddr)))) (inv_main15 var4 var1 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main6 var5 var4 var3 var2) (and (and (= var1 0) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1)))) (= var0 nullAddr)))) (inv_main15 var5 var2 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (or (not (and (inv_main42 var7 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ var1 (* (- 1) var0)) (- 1)))))) (inv_main47 var7 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap)) (or (not (and (inv_main42 var8 var7 var6 var5 var4 var3 var2 var1) (and (= var0 0) (<= 0 (+ (+ var2 (* (- 1) var1)) (- 1)))))) (inv_main47 var8 var7 var6 var5 var4 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (inv_main22 var5 var4 var3 var2 var1 var0)) (inv_main22 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 node) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main15 var10 var9 var8 var7) (and (and (and (= nullAddr var6) (and (and (and (and (= var5 (newHeap (alloc var10 (O_node var4)))) (= var3 var9)) (= var2 (+ var8 (- 1)))) (= var1 var7)) (= var6 (newAddr (alloc var10 (O_node var4)))))) (<= 0 (+ var8 (- 1)))) (= var0 1)))) (inv_main22 var5 var3 var2 var1 var6 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Addr) (var18 Int) (var19 Heap)) (or (not (and (inv_main66 var19 var18 var17 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (and (is-O_node (read var19 var10)) (is-O_node (read var19 var10))) (and (and (and (and (and (and (and (= var8 (write var19 var10 (O_node (node var11)))) (= var7 var18)) (= var6 var17)) (= var5 var16)) (= var4 var15)) (= var3 var14)) (= var2 var13)) (= var1 var12))) (= var0 (+ var4 1))))) (inv_main36 var8 var7 var6 var5 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 Int) (var20 Addr) (var21 Int) (var22 Heap)) (or (not (and (inv_main61 var22 var21 var20 var19 var18 var17 var16 var15 var14 var13 var12) (and (and (and (= var11 nullAddr) (and (is-O_node (read var22 var14)) (is-O_node (read var22 var14)))) (and (and (and (and (and (and (and (and (and (and (= var10 (write var22 var14 (O_node (node var12)))) (= var9 var21)) (= var8 var20)) (= var7 var19)) (= var6 var18)) (= var5 var17)) (= var4 var16)) (= var3 var15)) (= var2 var14)) (= var11 var13)) (= var1 var12))) (= var0 (+ var6 1))))) (inv_main36 var10 var9 var2 var7 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (inv_main30 var6 var5 var4 var3 var2 var1) (and (not (<= 0 (+ (+ var2 (* (- 1) var1)) (- 1)))) (= var0 0)))) (inv_main36 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (or (not (and (inv_main30 var7 var6 var5 var4 var3 var2) (and (and (= var1 0) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1)))) (= var0 0)))) (inv_main36 var7 var6 var5 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (not (and (inv_main63 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var10 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (not (and (inv_main61 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var10 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (not (and (inv_main61 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var10 var2)) (not (is-O_node (read var10 var2))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (not (and (inv_main66 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var10 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Heap)) (not (and (inv_main66 var10 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var10 var1)) (not (is-O_node (read var10 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Heap)) (not (and (inv_main77 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var1)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (inv_main83 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Heap)) (not (inv_main86 var4 var3 var2 var1 var0))))
(check-sat)
