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
(declare-fun inv_main12 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main15 (Heap Int Int Int Int Addr Addr Int) Bool)
(declare-fun inv_main18 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main19 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main22 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main28 (Heap Int Int Addr Int) Bool)
(declare-fun inv_main31 (Heap Int Int Addr Int Int) Bool)
(declare-fun inv_main36 (Heap Int Int Addr Int Int Addr) Bool)
(declare-fun inv_main4 (Heap Int Int) Bool)
(declare-fun inv_main42 (Heap Int Int Addr Int) Bool)
(declare-fun inv_main8 (Heap Int Int Int Int Addr) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var2 emptyHeap) (= var1 2)) (= var0 1))) (inv_main4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (inv_main31 var12 var11 var10 var9 var8 var7) (and (and (not (= var6 nullAddr)) (is-O_node (read var12 var9))) (and (and (and (and (and (and (= var5 var12) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7)) (= var6 (next (getnode (read var12 var9)))))))) (inv_main36 var5 var4 var3 var2 var1 var0 var6))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main12 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var7 var1)) (is-O_node (read var7 var1))) (= var0 (write var7 var1 (O_node (node var3 (next (getnode (read var7 var1))) (prev (getnode (read var7 var1)))))))))) (inv_main18 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 node) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main8 var14 var13 var12 var11 var10 var9) (and (and (and (= nullAddr var8) (and (and (and (and (and (and (= var7 (newHeap (alloc var14 (O_node var6)))) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var8 (newAddr (alloc var14 (O_node var6)))))) (<= 0 (+ var11 (- 1)))) (= var0 1)))) (inv_main15 var7 var5 var4 var3 var2 var1 var8 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main19 var13 var12 var11 var10 var9 var8 var7) (and (and (not (= var6 nullAddr)) (and (is-O_node (read var13 var7)) (is-O_node (read var13 var7)))) (and (and (and (and (and (and (= var5 (write var13 var7 (O_node (node (data (getnode (read var13 var7))) (next (getnode (read var13 var7))) nullAddr)))) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var6 var8)) (= var0 var7))))) (inv_main22 var5 var4 var3 var2 var1 var6 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main18 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var7 var1)) (is-O_node (read var7 var1))) (= var0 (write var7 var1 (O_node (node (data (getnode (read var7 var1))) var2 (prev (getnode (read var7 var1)))))))))) (inv_main19 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (inv_main28 var4 var3 var2 var1 var0) (and (not (= nullAddr var1)) (not (<= 0 var0))))) (inv_main42 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 node) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main8 var13 var12 var11 var10 var9 var8) (and (and (not (= nullAddr var7)) (and (and (and (and (and (and (= var6 (newHeap (alloc var13 (O_node var5)))) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8)) (= var7 (newAddr (alloc var13 (O_node var5)))))) (<= 0 (+ var10 (- 1)))))) (inv_main12 var6 var4 var3 var2 var1 var0 var7))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Addr) (var13 Heap) (var14 Heap) (var15 Addr) (var16 Int) (var17 Int) (var18 Addr) (var19 Int) (var20 Int) (var21 Heap)) (or (not (and (inv_main36 var21 var20 var19 var18 var17 var16 var15) (and (and (and (and (and (and (and (and (and (= var14 (write var13 var12 defObj)) (= var11 var10)) (= var9 var8)) (= var7 var12)) (= var6 var5)) (= var4 var3)) (= var2 var1)) (and (is-O_node (read var21 var15)) (is-O_node (read var21 var15)))) (and (and (and (and (and (and (= var13 (write var21 var15 (O_node (node (data (getnode (read var21 var15))) (next (getnode (read var21 var15))) nullAddr)))) (= var10 var20)) (= var8 var19)) (= var12 var18)) (= var5 var17)) (= var3 var16)) (= var1 var15))) (= var0 (+ var6 (- 1)))))) (inv_main28 var14 var11 var9 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Addr) (var13 Heap) (var14 Heap) (var15 Int) (var16 Int) (var17 Addr) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main31 var20 var19 var18 var17 var16 var15) (and (and (and (and (and (and (and (and (= var14 (write var13 var12 defObj)) (= var11 var10)) (= var9 var8)) (= var7 var12)) (= var6 var5)) (= var4 var3)) (= var2 var1)) (and (and (= var1 nullAddr) (is-O_node (read var20 var17))) (and (and (and (and (and (and (= var13 var20) (= var10 var19)) (= var8 var18)) (= var12 var17)) (= var5 var16)) (= var3 var15)) (= var1 (next (getnode (read var20 var17))))))) (= var0 (+ var6 (- 1)))))) (inv_main28 var14 var11 var9 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main8 var6 var5 var4 var3 var2 var1) (and (not (<= 0 (+ var3 (- 1)))) (= var0 (+ var5 (- 1)))))) (inv_main28 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main22 var14 var13 var12 var11 var10 var9 var8) (and (and (and (is-O_node (read var14 var9)) (is-O_node (read var14 var9))) (and (and (and (and (and (and (= var7 (write var14 var9 (O_node (node (data (getnode (read var14 var9))) (next (getnode (read var14 var9))) var8)))) (= var6 var13)) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 (+ var4 (- 1)))))) (inv_main8 var7 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main19 var14 var13 var12 var11 var10 var9 var8) (and (and (and (= var7 nullAddr) (and (is-O_node (read var14 var8)) (is-O_node (read var14 var8)))) (and (and (and (and (and (and (= var6 (write var14 var8 (O_node (node (data (getnode (read var14 var8))) (next (getnode (read var14 var8))) nullAddr)))) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var7 var9)) (= var1 var8))) (= var0 (+ var3 (- 1)))))) (inv_main8 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (or (not (and (inv_main4 var3 var2 var1) (= var0 nullAddr))) (inv_main8 var3 var2 var1 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main28 var5 var4 var3 var2 var1) (and (<= 0 var1) (= var0 3)))) (inv_main31 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main12 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main12 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var0)) (not (is-O_node (read var6 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main18 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main18 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var0)) (not (is-O_node (read var6 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var0)) (not (is-O_node (read var6 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main22 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main22 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (not (is-O_node (read var6 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main31 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var2)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var0)) (not (is-O_node (read var6 var0))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (inv_main42 var4 var3 var2 var1 var0))))
(check-sat)
