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
(declare-fun inv_main12 (Heap Int Int Int Int Addr Int) Bool)
(declare-fun inv_main15 (Heap Int Int Int Int Addr) Bool)
(declare-fun inv_main16 (Heap Int Int Int Int Addr) Bool)
(declare-fun inv_main18 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main19 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main22 (Heap Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main25 (Heap Int Int Int Int Addr Addr Addr Int) Bool)
(declare-fun inv_main28 (Heap Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main29 (Heap Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main32 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main36 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main37 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main39 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main4 (Heap Int Int) Bool)
(declare-fun inv_main42 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main45 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main51 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main52 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main57 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main9 (Heap Int Int Int Int Addr) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var2 emptyHeap) (= var1 5)) (= var0 1))) (inv_main4 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main22 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var8 var1)) (is-O_node (read var8 var1))) (= var0 (write var8 var1 (O_node (node (data (getnode (read var8 var1))) var2 (prev (getnode (read var8 var1)))))))))) (inv_main28 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main15 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var6 var1)) (is-O_node (read var6 var1))) (= var0 (write var6 var1 (O_node (node (data (getnode (read var6 var1))) (next (getnode (read var6 var1))) var1))))))) (inv_main16 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main36 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var0)) (= var3 (data (getnode (read var5 var0))))))) (inv_main39 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (inv_main25 var8 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main25 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 node) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (inv_main18 var16 var15 var14 var13 var12 var11 var10) (and (and (and (= nullAddr var9) (and (and (and (and (and (and (and (= var8 (newHeap (alloc var16 (O_node var7)))) (= var6 var15)) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var9 (newAddr (alloc var16 (O_node var7)))))) (<= 0 (+ (+ var13 (- 1)) (- 1)))) (= var0 1)))) (inv_main25 var8 var6 var5 var4 var3 var2 var1 var9 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main19 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var7 var2)) (is-O_node (read var7 var2))) (= var0 (write var7 var2 (O_node (node (data (getnode (read var7 var2))) var1 (prev (getnode (read var7 var2)))))))))) (inv_main32 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Int) (var9 Addr) (var10 Int) (var11 Int) (var12 Heap) (var13 Addr) (var14 Int) (var15 Addr) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (inv_main45 var18 var17 var16 var15 var14 var13) (and (and (and (and (is-O_node (read var18 var15)) (is-O_node (read var18 var15))) (and (and (and (and (and (= var12 (write var18 var15 (O_node (node (data (getnode (read var18 var15))) (next (getnode (read var18 var15))) nullAddr)))) (= var11 var17)) (= var10 var16)) (= var9 var15)) (= var8 var14)) (= var7 var13))) (and (and (and (and (and (= var6 var12) (= var5 var11)) (= var4 var10)) (= var3 nullAddr)) (= var2 var8)) (= var1 var7))) (= var0 (+ var2 (- 1)))))) (inv_main51 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap) (var14 Addr) (var15 Addr) (var16 Int) (var17 Addr) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (inv_main52 var20 var19 var18 var17 var16 var15) (and (and (not (= var14 nullAddr)) (and (and (is-O_node (read var20 var15)) (and (and (and (and (and (and (= var13 var20) (= var12 var19)) (= var11 var18)) (= var10 var17)) (= var9 var16)) (= var8 var15)) (= var7 (prev (getnode (read var20 var15)))))) (and (and (and (and (and (and (= var6 (write var13 var8 defObj)) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var14 var7)))) (= var0 (+ var2 (- 1)))))) (inv_main51 var6 var5 var4 var3 var0 var14))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (inv_main29 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (and (is-O_node (read var16 var10)) (is-O_node (read var16 var10))) (and (and (and (and (and (and (and (= var8 (write var16 var10 (O_node (node (data (getnode (read var16 var10))) (next (getnode (read var16 var10))) var9)))) (= var7 var15)) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9))) (= var0 (+ var5 (- 1)))))) (inv_main18 var8 var7 var6 var0 var4 var3 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main16 var11 var10 var9 var8 var7 var6) (and (and (is-O_node (read var11 var6)) (is-O_node (read var11 var6))) (and (and (and (and (and (= var5 (write var11 var6 (O_node (node var7 (next (getnode (read var11 var6))) (prev (getnode (read var11 var6))))))) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6))))) (inv_main18 var5 var4 var3 var2 var1 var0 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main9 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var6 var1)) (is-O_node (read var6 var1))) (= var0 (write var6 var1 (O_node (node (data (getnode (read var6 var1))) var1 (prev (getnode (read var6 var1)))))))))) (inv_main15 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (inv_main12 var6 var5 var4 var3 var2 var1 var0)) (inv_main12 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 node) (var6 Heap) (var7 Addr) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main4 var10 var9 var8) (and (and (= nullAddr var7) (and (and (and (and (and (= var6 (newHeap (alloc var10 (O_node var5)))) (= var4 var9)) (= var3 var8)) (= var2 var9)) (= var1 var8)) (= var7 (newAddr (alloc var10 (O_node var5)))))) (= var0 1)))) (inv_main12 var6 var4 var3 var2 var1 var7 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Int) (var9 Addr) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (inv_main37 var12 var11 var10 var9 var8 var7) (and (is-O_node (read var12 var7)) (and (and (and (and (and (and (= var6 var12) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 (prev (getnode (read var12 var7)))))))) (inv_main45 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main39 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var6 var1)) (is-O_node (read var6 var1))) (= var0 (write var6 var1 (O_node (node var2 (next (getnode (read var6 var1))) (prev (getnode (read var6 var1)))))))))) (inv_main42 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main36 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var0)) (not (= var3 (data (getnode (read var5 var0)))))))) (inv_main57 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main51 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var0)) (not (= var1 (data (getnode (read var5 var0)))))))) (inv_main57 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main42 var13 var12 var11 var10 var9 var8) (and (and (= var7 var6) (and (is-O_node (read var13 var8)) (and (and (and (and (and (and (= var5 var13) (= var4 var12)) (= var3 var11)) (= var6 var10)) (= var2 var9)) (= var1 var8)) (= var7 (next (getnode (read var13 var8))))))) (= var0 (+ var2 1))))) (inv_main37 var5 var4 var3 var6 var0 var7))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main42 var13 var12 var11 var10 var9 var8) (and (and (not (= var7 var6)) (and (is-O_node (read var13 var8)) (and (and (and (and (and (and (= var5 var13) (= var4 var12)) (= var3 var11)) (= var6 var10)) (= var2 var9)) (= var1 var8)) (= var7 (next (getnode (read var13 var8))))))) (= var0 (+ var2 1))))) (inv_main36 var5 var4 var3 var6 var0 var7))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main32 var14 var13 var12 var11 var10 var9 var8) (and (and (and (is-O_node (read var14 var8)) (is-O_node (read var14 var8))) (and (and (and (and (and (and (= var7 (write var14 var8 (O_node (node (data (getnode (read var14 var8))) (next (getnode (read var14 var8))) var9)))) (= var6 var13)) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 1)))) (inv_main36 var7 var6 var5 var1 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 node) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (inv_main4 var9 var8 var7) (and (not (= nullAddr var6)) (and (and (and (and (and (= var5 (newHeap (alloc var9 (O_node var4)))) (= var3 var8)) (= var2 var7)) (= var1 var8)) (= var0 var7)) (= var6 (newAddr (alloc var9 (O_node var4)))))))) (inv_main9 var5 var3 var2 var1 var0 var6))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main51 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var0)) (= var1 (data (getnode (read var5 var0))))))) (inv_main52 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main18 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ var3 (- 1)) (- 1)))))) (inv_main19 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_node (read var8 var1)) (is-O_node (read var8 var1))) (= var0 (write var8 var1 (O_node (node var4 (next (getnode (read var8 var1))) (prev (getnode (read var8 var1)))))))))) (inv_main29 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 node) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main18 var15 var14 var13 var12 var11 var10 var9) (and (and (not (= nullAddr var8)) (and (and (and (and (and (and (and (= var7 (newHeap (alloc var15 (O_node var6)))) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 var9)) (= var8 (newAddr (alloc var15 (O_node var6)))))) (<= 0 (+ (+ var12 (- 1)) (- 1)))))) (inv_main22 var7 var5 var4 var3 var2 var1 var0 var8))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main9 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main9 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var0)) (not (is-O_node (read var5 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main15 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main15 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var0)) (not (is-O_node (read var5 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main16 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main16 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var0)) (not (is-O_node (read var5 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var7 var0)) (not (is-O_node (read var7 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var7 var0)) (not (is-O_node (read var7 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main29 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var7 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main29 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var7 var1)) (not (is-O_node (read var7 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var1)) (not (is-O_node (read var6 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var6 var0)) (not (is-O_node (read var6 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main36 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main39 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main39 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var0)) (not (is-O_node (read var5 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main42 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main37 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main45 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var2)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main45 var5 var4 var3 var2 var1 var0) (and (is-O_node (read var5 var2)) (not (is-O_node (read var5 var2))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main51 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main52 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (inv_main57 var5 var4 var3 var2 var1 var0))))
(check-sat)
