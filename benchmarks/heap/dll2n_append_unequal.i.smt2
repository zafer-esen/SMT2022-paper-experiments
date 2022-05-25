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
   (node (data Int) (next Addr) (prev Addr))
  )
))
(declare-fun inv_main15 (Heap Int Int Int Int Addr Int Addr) Bool)
(declare-fun inv_main18 (Heap Int Int Int Int Addr Int Addr Int) Bool)
(declare-fun inv_main21 (Heap Int Int Int Int Addr Int Addr) Bool)
(declare-fun inv_main22 (Heap Int Int Int Int Addr Int Addr) Bool)
(declare-fun inv_main24 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main25 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main28 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main4 (Heap Int Int) Bool)
(declare-fun inv_main41 (Heap Int Int Addr Int Int Int Int Addr) Bool)
(declare-fun inv_main44 (Heap Int Int Addr Int Int Int Int Addr Int) Bool)
(declare-fun inv_main47 (Heap Int Int Addr Int Int Int Int Addr) Bool)
(declare-fun inv_main48 (Heap Int Int Addr Int Int Int Int Addr) Bool)
(declare-fun inv_main53 (Heap Int Int Addr Int Int Int Addr Addr) Bool)
(declare-fun inv_main54 (Heap Int Int Addr Int Int Int Addr Addr) Bool)
(declare-fun inv_main55 (Heap Int Int Addr Int Int Int Addr Addr) Bool)
(declare-fun inv_main57 (Heap Int Int Addr Int Int Int Addr Addr) Bool)
(declare-fun inv_main59 (Heap Int Int Addr Int Addr Int) Bool)
(declare-fun inv_main61 (Heap Int Int Addr Int Addr Int) Bool)
(declare-fun inv_main63 (Heap Int Int Addr Int Addr Int) Bool)
(declare-fun inv_main64 (Heap Int Int Addr Int Addr Int) Bool)
(declare-fun inv_main65 (Heap Int Int Addr Int Addr Int) Bool)
(declare-fun inv_main8 (Heap Int Int Int Int Addr) Bool)
(declare-fun inv_main80 (Heap Int Int Addr Int Addr Int Addr) Bool)
(declare-fun inv_main83 (Heap Int Int Addr Int Addr Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var2 emptyHeap) (= var1 2)) (= var0 1))) (inv_main4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (inv_main18 var8 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main18 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 node) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main8 var15 var14 var13 var12 var11 var10) (and (and (and (= nullAddr var9) (and (and (and (and (and (and (and (= var8 (newHeap (alloc var15 (O_node var7)))) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var11)) (= var9 (newAddr (alloc var15 (O_node var7)))))) (<= 0 (+ var12 (- 1)))) (= var0 1)))) (inv_main18 var8 var6 var5 var4 var3 var2 var1 var9 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (not (= (next (getnode (read var6 var1))) nullAddr))))) (inv_main61 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap) (var9 Int) (var10 Addr) (var11 Int) (var12 Addr) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main65 var15 var14 var13 var12 var11 var10 var9) (and (and (is-O_node (read var15 var10)) (and (and (and (and (and (and (and (= var8 var15) (= var7 var14)) (= var6 var13)) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 (next (getnode (read var15 var10)))))) (= var0 (+ var2 1))))) (inv_main61 var8 var7 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main28 var14 var13 var12 var11 var10 var9 var8) (and (and (and (is-O_node (read var14 var9)) (is-O_node (read var14 var9))) (and (and (and (and (and (and (= var7 (write var14 var9 (O_node (node (data (getnode (read var14 var9))) (next (getnode (read var14 var9))) var8)))) (= var6 var13)) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 (+ var4 (- 1)))))) (inv_main8 var7 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main25 var14 var13 var12 var11 var10 var9 var8) (and (and (and (= var7 nullAddr) (and (is-O_node (read var14 var8)) (is-O_node (read var14 var8)))) (and (and (and (and (and (and (= var6 (write var14 var8 (O_node (node (data (getnode (read var14 var8))) var9 (prev (getnode (read var14 var8))))))) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var7 var9)) (= var1 var8))) (= var0 (+ var3 (- 1)))))) (inv_main8 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (or (not (and (inv_main4 var3 var2 var1) (= var0 nullAddr))) (inv_main8 var3 var2 var1 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Int) (var7 node) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main8 var15 var14 var13 var12 var11 var10) (and (and (not (= nullAddr var9)) (and (and (and (and (and (and (and (and (= var8 (newHeap (alloc var15 (O_node var7)))) (= var6 var14)) (= var5 var13)) (= var4 var10)) (= var3 5)) (= var2 3)) (= var1 5)) (= var0 5)) (= var9 (newAddr (alloc var15 (O_node var7)))))) (not (<= 0 (+ var12 (- 1))))))) (inv_main41 var8 var6 var5 var4 var3 var2 var1 var0 var9))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main64 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (= var4 (data (getnode (read var6 var1))))))) (inv_main65 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main53 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var0)) (= (next (getnode (read var8 var0))) nullAddr)))) (inv_main54 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main22 var15 var14 var13 var12 var11 var10 var9 var8) (and (and (is-O_node (read var15 var8)) (is-O_node (read var15 var8))) (and (and (and (and (and (and (and (= var7 (write var15 var8 (O_node (node var9 (next (getnode (read var15 var8))) (prev (getnode (read var15 var8))))))) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8))))) (inv_main24 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main21 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var8 var1)) (is-O_node (read var8 var1))) (= var0 (write var8 var1 (O_node (node (data (getnode (read var8 var1))) (next (getnode (read var8 var1))) nullAddr))))))) (inv_main22 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main61 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (not (= (next (getnode (read var6 var1))) nullAddr))))) (inv_main64 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Addr) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (inv_main57 var16 var15 var14 var13 var12 var11 var10 var9 var8) (and (and (and (is-O_node (read var16 var9)) (is-O_node (read var16 var9))) (and (and (and (and (and (and (= var7 (write var16 var9 (O_node (node (data (getnode (read var16 var9))) (next (getnode (read var16 var9))) var8)))) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10))) (= var0 0)))) (inv_main59 var7 var6 var5 var4 var3 var4 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Addr) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main48 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (= nullAddr var9) (and (and (is-O_node (read var18 var10)) (is-O_node (read var18 var10))) (and (and (and (and (and (and (and (and (= var8 (write var18 var10 (O_node (node var11 (next (getnode (read var18 var10))) (prev (getnode (read var18 var10))))))) (= var7 var17)) (= var6 var16)) (= var9 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)))) (= var0 0)))) (inv_main59 var8 var7 var6 var1 var5 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main53 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var0)) (not (= (next (getnode (read var8 var0))) nullAddr))))) (inv_main55 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main25 var13 var12 var11 var10 var9 var8 var7) (and (and (not (= var6 nullAddr)) (and (is-O_node (read var13 var7)) (is-O_node (read var13 var7)))) (and (and (and (and (and (and (= var5 (write var13 var7 (O_node (node (data (getnode (read var13 var7))) var8 (prev (getnode (read var13 var7))))))) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var6 var8)) (= var0 var7))))) (inv_main28 var5 var4 var3 var2 var1 var6 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main44 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 node) (var9 Heap) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (inv_main8 var16 var15 var14 var13 var12 var11) (and (and (and (= nullAddr var10) (and (and (and (and (and (and (and (and (= var9 (newHeap (alloc var16 (O_node var8)))) (= var7 var15)) (= var6 var14)) (= var5 var11)) (= var4 5)) (= var3 3)) (= var2 5)) (= var1 5)) (= var10 (newAddr (alloc var16 (O_node var8)))))) (not (<= 0 (+ var13 (- 1))))) (= var0 1)))) (inv_main44 var9 var7 var6 var5 var4 var3 var2 var1 var10 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main54 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var9 var1)) (is-O_node (read var9 var1))) (= var0 (write var9 var1 (O_node (node (data (getnode (read var9 var1))) var2 (prev (getnode (read var9 var1)))))))))) (inv_main57 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main47 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var9 var1)) (is-O_node (read var9 var1))) (= var0 (write var9 var1 (O_node (node (data (getnode (read var9 var1))) (next (getnode (read var9 var1))) nullAddr))))))) (inv_main48 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 node) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main8 var14 var13 var12 var11 var10 var9) (and (and (not (= nullAddr var8)) (and (and (and (and (and (and (and (= var7 (newHeap (alloc var14 (O_node var6)))) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var10)) (= var8 (newAddr (alloc var14 (O_node var6)))))) (<= 0 (+ var11 (- 1)))))) (inv_main15 var7 var5 var4 var3 var2 var1 var0 var8))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main41 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var9 var1)) (is-O_node (read var9 var1))) (= var0 (write var9 var1 (O_node (node (data (getnode (read var9 var1))) nullAddr (prev (getnode (read var9 var1)))))))))) (inv_main47 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main24 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var7 var1)) (is-O_node (read var7 var1))) (= var0 (write var7 var1 (O_node (node var3 (next (getnode (read var7 var1))) (prev (getnode (read var7 var1)))))))))) (inv_main25 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Addr) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main55 var18 var17 var16 var15 var14 var13 var12 var11 var10) (and (is-O_node (read var18 var10)) (and (and (and (and (and (and (and (and (and (= var9 var18) (= var8 var17)) (= var7 var16)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 (next (getnode (read var18 var10)))))))) (inv_main53 var9 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Addr) (var15 Int) (var16 Int) (var17 Heap)) (or (not (and (inv_main48 var17 var16 var15 var14 var13 var12 var11 var10 var9) (and (not (= nullAddr var8)) (and (and (is-O_node (read var17 var9)) (is-O_node (read var17 var9))) (and (and (and (and (and (and (and (and (= var7 (write var17 var9 (O_node (node var10 (next (getnode (read var17 var9))) (prev (getnode (read var17 var9))))))) (= var6 var16)) (= var5 var15)) (= var8 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 var9)))))) (inv_main53 var7 var6 var5 var8 var4 var3 var2 var0 var8))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main64 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (not (= var4 (data (getnode (read var6 var1)))))))) (inv_main83 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main63 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (not (= var2 (data (getnode (read var6 var1)))))))) (inv_main83 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (and (not (= var0 (+ 1 var5))) (and (is-O_node (read var6 var1)) (= (next (getnode (read var6 var1))) nullAddr))))) (inv_main83 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main63 var7 var6 var5 var4 var3 var2 var1) (and (and (not (= (+ var1 1) (+ 1 var6))) (and (is-O_node (read var7 var2)) (= var3 (data (getnode (read var7 var2)))))) (= var0 (+ var1 1))))) (inv_main83 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main15 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var8 var1)) (is-O_node (read var8 var1))) (= var0 (write var8 var1 (O_node (node (data (getnode (read var8 var1))) nullAddr (prev (getnode (read var8 var1)))))))))) (inv_main21 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Addr) (var14 Int) (var15 Int) (var16 Heap) (var17 Addr) (var18 Addr) (var19 Int) (var20 Addr) (var21 Int) (var22 Addr) (var23 Int) (var24 Int) (var25 Heap)) (or (not (and (inv_main80 var25 var24 var23 var22 var21 var20 var19 var18) (and (not (= var17 nullAddr)) (and (and (is-O_node (read var25 var18)) (and (and (and (and (and (and (and (and (= var16 var25) (= var15 var24)) (= var14 var23)) (= var13 var22)) (= var12 var21)) (= var11 var20)) (= var10 var19)) (= var9 var18)) (= var8 (next (getnode (read var25 var18)))))) (and (and (and (and (and (and (and (and (= var7 (write var16 var9 defObj)) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 var9)) (= var17 var8)))))) (inv_main80 var7 var6 var5 var4 var3 var2 var1 var17))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (and (and (not (= var3 nullAddr)) (= var0 (+ 1 var5))) (and (is-O_node (read var6 var1)) (= (next (getnode (read var6 var1))) nullAddr))))) (inv_main80 var6 var5 var4 var3 var2 var1 var0 var3))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main63 var7 var6 var5 var4 var3 var2 var1) (and (and (and (not (= var4 nullAddr)) (= (+ var1 1) (+ 1 var6))) (and (is-O_node (read var7 var2)) (= var3 (data (getnode (read var7 var2)))))) (= var0 (+ var1 1))))) (inv_main80 var7 var6 var5 var4 var3 var2 var0 var4))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main61 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (= (next (getnode (read var6 var1))) nullAddr)))) (inv_main63 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var7 var0)) (not (is-O_node (read var7 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main21 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main21 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var7 var0)) (not (is-O_node (read var7 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var7 var0)) (not (is-O_node (read var7 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var0)) (not (is-O_node (read var6 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var0)) (not (is-O_node (read var6 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main28 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main28 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (not (is-O_node (read var6 var1))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main41 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main41 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var0)) (not (is-O_node (read var8 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main47 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main47 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var0)) (not (is-O_node (read var8 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main48 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main48 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var0)) (not (is-O_node (read var8 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main53 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main55 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main54 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main54 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var0)) (not (is-O_node (read var8 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main57 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var8 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main57 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var8 var1)) (not (is-O_node (read var8 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main59 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main61 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main64 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main65 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main63 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main80 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var0)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (inv_main83 var6 var5 var4 var3 var2 var1 var0))))
(check-sat)
