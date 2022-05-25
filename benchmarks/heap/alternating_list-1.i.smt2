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
   (node (h Int) (n Addr))
  )
))
(declare-fun inv_main12 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main13 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main17 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main18 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main23 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main26 (Heap Int Addr Addr Addr Int) Bool)
(declare-fun inv_main29 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main3 (Heap Int) Bool)
(declare-fun inv_main33 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main37 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main40 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main44 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main49 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main53 (Heap Int Addr Addr Addr Addr) Bool)
(declare-fun inv_main57 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main8 (Heap Int Addr Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 1))) (inv_main3 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main40 var10 var9 var8 var7 var6) (and (and (= var5 1) (is-O_node (read var10 var6))) (and (and (and (and (and (= var4 var10) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6)) (= var5 (h (getnode (read var10 var6)))))))) (inv_main37 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main44 var10 var9 var8 var7 var6) (and (and (= var5 2) (is-O_node (read var10 var6))) (and (and (and (and (and (= var4 var10) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6)) (= var5 (h (getnode (read var10 var6)))))))) (inv_main37 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main37 var10 var9 var8 var7 var6) (and (is-O_node (read var10 var6)) (and (and (and (and (and (= var5 var10) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 var6)) (= var0 (n (getnode (read var10 var6)))))))) (inv_main33 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main13 var10 var9 var8 var7 var6) (and (and (and (is-O_node (read var10 var6)) (is-O_node (read var10 var6))) (and (and (and (and (= var5 (write var10 var6 (O_node (node 3 (n (getnode (read var10 var6))))))) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 var6))) (= var0 1)))) (inv_main33 var5 var0 var3 var2 var3))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Heap)) (or (not (inv_main8 var3 var2 var1 var0)) (inv_main8 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 node) (var3 Heap) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (inv_main3 var6 var5) (and (and (= var4 nullAddr) (and (and (= var3 (newHeap (alloc var6 (O_node var2)))) (= var1 var5)) (= var4 (newAddr (alloc var6 (O_node var2)))))) (= var0 1)))) (inv_main8 var3 var1 var4 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (and (inv_main12 var5 var4 var3 var2 var1) (= var0 0))) (inv_main13 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Int) (var8 node) (var9 Heap) (var10 Heap) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (inv_main17 var16 var15 var14 var13 var12) (and (and (not (= var11 nullAddr)) (and (and (and (and (and (= var10 (newHeap (alloc var9 (O_node var8)))) (= var7 0)) (= var6 var5)) (= var4 var3)) (= var2 var1)) (= var11 (newAddr (alloc var9 (O_node var8)))))) (and (and (is-O_node (read var16 var12)) (is-O_node (read var16 var12))) (and (and (and (and (= var9 (write var16 var12 (O_node (node 1 (n (getnode (read var16 var12))))))) (= var0 var15)) (= var5 var14)) (= var3 var13)) (= var1 var12)))))) (inv_main23 var10 var7 var6 var11 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Int) (var8 node) (var9 Heap) (var10 Heap) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (inv_main18 var16 var15 var14 var13 var12) (and (and (not (= var11 nullAddr)) (and (and (and (and (and (= var10 (newHeap (alloc var9 (O_node var8)))) (= var7 1)) (= var6 var5)) (= var4 var3)) (= var2 var1)) (= var11 (newAddr (alloc var9 (O_node var8)))))) (and (and (is-O_node (read var16 var12)) (is-O_node (read var16 var12))) (and (and (and (and (= var9 (write var16 var12 (O_node (node 2 (n (getnode (read var16 var12))))))) (= var0 var15)) (= var5 var14)) (= var3 var13)) (= var1 var12)))))) (inv_main23 var10 var7 var6 var11 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main29 var10 var9 var8 var7 var6) (and (is-O_node (read var10 var6)) (and (and (and (and (and (= var5 var10) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 var6)) (= var0 (n (getnode (read var10 var6)))))))) (inv_main12 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 node) (var3 Heap) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (inv_main3 var6 var5) (and (not (= var4 nullAddr)) (and (and (= var3 (newHeap (alloc var6 (O_node var2)))) (= var1 var5)) (= var4 (newAddr (alloc var6 (O_node var2)))))))) (inv_main12 var3 var1 var4 var0 var4))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (and (inv_main12 var5 var4 var3 var2 var1) (and (= var4 0) (not (= var0 0))))) (inv_main18 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Heap)) (or (not (and (inv_main53 var13 var12 var11 var10 var9 var8) (and (and (is-O_node (read var13 var9)) (and (and (and (and (and (and (= var7 var13) (= var6 var12)) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 (n (getnode (read var13 var9)))))) (= var0 (write var7 var2 defObj))))) (inv_main49 var0 var6 var5 var4 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main33 var10 var9 var8 var7 var6) (and (and (= var5 3) (is-O_node (read var10 var6))) (and (and (and (and (and (= var4 var10) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6)) (= var5 (h (getnode (read var10 var6)))))))) (inv_main49 var4 var3 var2 var1 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Int) (var11 Heap)) (or (not (and (inv_main33 var11 var10 var9 var8 var7) (and (and (not (= var6 0)) (and (and (not (= var5 3)) (is-O_node (read var11 var7))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var5 (h (getnode (read var11 var7))))))) (= var0 0)))) (inv_main40 var4 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main49 var10 var9 var8 var7 var6) (and (and (not (= var5 3)) (is-O_node (read var10 var6))) (and (and (and (and (and (= var4 var10) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6)) (= var5 (h (getnode (read var10 var6)))))))) (inv_main53 var4 var3 var2 var1 var0 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (inv_main26 var5 var4 var3 var2 var1 var0)) (inv_main26 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Int) (var9 node) (var10 Heap) (var11 Heap) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Int) (var17 Heap)) (or (not (and (inv_main17 var17 var16 var15 var14 var13) (and (and (and (= var12 nullAddr) (and (and (and (and (and (= var11 (newHeap (alloc var10 (O_node var9)))) (= var8 0)) (= var7 var6)) (= var5 var4)) (= var3 var2)) (= var12 (newAddr (alloc var10 (O_node var9)))))) (and (and (is-O_node (read var17 var13)) (is-O_node (read var17 var13))) (and (and (and (and (= var10 (write var17 var13 (O_node (node 1 (n (getnode (read var17 var13))))))) (= var1 var16)) (= var6 var15)) (= var4 var14)) (= var2 var13)))) (= var0 1)))) (inv_main26 var11 var8 var7 var12 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Int) (var9 node) (var10 Heap) (var11 Heap) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Int) (var17 Heap)) (or (not (and (inv_main18 var17 var16 var15 var14 var13) (and (and (and (= var12 nullAddr) (and (and (and (and (and (= var11 (newHeap (alloc var10 (O_node var9)))) (= var8 1)) (= var7 var6)) (= var5 var4)) (= var3 var2)) (= var12 (newAddr (alloc var10 (O_node var9)))))) (and (and (is-O_node (read var17 var13)) (is-O_node (read var17 var13))) (and (and (and (and (= var10 (write var17 var13 (O_node (node 2 (n (getnode (read var17 var13))))))) (= var1 var16)) (= var6 var15)) (= var4 var14)) (= var2 var13)))) (= var0 1)))) (inv_main26 var11 var8 var7 var12 var3 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (and (inv_main12 var5 var4 var3 var2 var1) (and (not (= var4 0)) (not (= var0 0))))) (inv_main17 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main40 var10 var9 var8 var7 var6) (and (and (not (= var5 1)) (is-O_node (read var10 var6))) (and (and (and (and (and (= var4 var10) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6)) (= var5 (h (getnode (read var10 var6)))))))) (inv_main57 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (inv_main44 var10 var9 var8 var7 var6) (and (and (not (= var5 2)) (is-O_node (read var10 var6))) (and (and (and (and (and (= var4 var10) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6)) (= var5 (h (getnode (read var10 var6)))))))) (inv_main57 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (and (inv_main23 var5 var4 var3 var2 var1) (and (and (is-O_node (read var5 var1)) (is-O_node (read var5 var1))) (= var0 (write var5 var1 (O_node (node (h (getnode (read var5 var1))) var2))))))) (inv_main29 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Int) (var11 Heap)) (or (not (and (inv_main33 var11 var10 var9 var8 var7) (and (and (= var6 0) (and (and (not (= var5 3)) (is-O_node (read var11 var7))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var5 (h (getnode (read var11 var7))))))) (= var0 1)))) (inv_main44 var4 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main23 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main23 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main33 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main40 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main44 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main37 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main49 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (inv_main53 var5 var4 var3 var2 var1 var0) (not (is-O_node (read var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (inv_main57 var4 var3 var2 var1 var0))))
(check-sat)
