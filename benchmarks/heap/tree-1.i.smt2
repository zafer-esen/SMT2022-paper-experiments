(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status unsat)
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
   (node (left Addr) (right Addr) (parent Addr) (value Int))
  )
))
(declare-fun inv_main13 (Heap Addr Addr) Bool)
(declare-fun inv_main16 (Heap Addr Addr) Bool)
(declare-fun inv_main19 (Heap Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main23 (Heap Addr Addr Int) Bool)
(declare-fun inv_main31 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main32 (Heap Addr Addr) Bool)
(declare-fun inv_main35 (Heap Addr Addr) Bool)
(declare-fun inv_main36 (Heap Addr Addr) Bool)
(declare-fun inv_main37 (Heap Addr Addr) Bool)
(declare-fun inv_main38 (Heap Addr Addr) Bool)
(declare-fun inv_main41 (Heap Addr) Bool)
(declare-fun inv_main52 (Heap Addr Addr) Bool)
(declare-fun inv_main56 (Heap Addr Addr) Bool)
(declare-fun inv_main57 (Heap Addr Addr) Bool)
(declare-fun inv_main58 (Heap Addr Addr) Bool)
(declare-fun inv_main64 (Heap Addr Addr) Bool)
(declare-fun inv_main68 (Heap Addr Addr) Bool)
(declare-fun inv_main72 (Heap Addr Addr) Bool)
(declare-fun inv_main8 (Heap Addr Addr) Bool)
(declare-fun inv_main83 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main84 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main90 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main91 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main92 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main95 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main97 (Heap Addr Addr Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main58 var6 var5 var4) (and (and (not (= var3 42)) (and (is-O_node (read var6 var4)) (is-O_node (read var6 (left (getnode (read var6 var4))))))) (and (and (and (= var2 var6) (= var1 var5)) (= var0 var4)) (= var3 (value (getnode (read var6 (left (getnode (read var6 var4))))))))))) (inv_main64 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main57 var2 var1 var0) (and (is-O_node (read var2 var0)) (= (value (getnode (read var2 var0))) 0)))) (inv_main72 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap)) (or (not (and (inv_main41 var1 var0) (= var0 nullAddr))) (inv_main52 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main56 var2 var1 var0) (and (is-O_node (read var2 var0)) (= (left (getnode (read var2 var0))) nullAddr)))) (inv_main57 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main58 var6 var5 var4) (and (and (= var3 42) (and (is-O_node (read var6 var4)) (is-O_node (read var6 (left (getnode (read var6 var4))))))) (and (and (and (= var2 var6) (= var1 var5)) (= var0 var4)) (= var3 (value (getnode (read var6 (left (getnode (read var6 var4))))))))))) (inv_main57 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 node) (var7 Heap) (var8 Heap) (var9 Addr) (var10 Int) (var11 Addr) (var12 Addr) (var13 Heap)) (or (not (and (inv_main23 var13 var12 var11 var10) (and (and (not (= var9 nullAddr)) (and (and (and (and (= var8 (newHeap (alloc var7 (O_node var6)))) (= var5 var4)) (= var3 var4)) (= var9 (newAddr (alloc var7 (O_node var6))))) (not (= var2 0)))) (and (and (is-O_node (read var13 var11)) (is-O_node (read var13 var11))) (and (and (and (= var7 (write var13 var11 (O_node (node (left (getnode (read var13 var11))) (right (getnode (read var13 var11))) (parent (getnode (read var13 var11))) var10)))) (= var1 var12)) (= var4 var11)) (= var0 var10)))))) (inv_main13 var8 var5 var9))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 node) (var8 Heap) (var9 Heap) (var10 Addr) (var11 Heap)) (or (not (and (inv_main2 var11) (and (and (and (not (= var10 nullAddr)) (and (and (and (and (= var9 (newHeap (alloc var8 (O_node var7)))) (= var6 var5)) (= var4 var3)) (= var10 (newAddr (alloc var8 (O_node var7))))) (not (= var2 0)))) (and (= var1 var11) (= var0 nullAddr))) (and (and (= var8 var1) (= var5 var0)) (= var3 nullAddr))))) (inv_main13 var9 var6 var10))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main84 var8 var7 var6 var5) (and (is-O_node (read var8 var6)) (and (and (and (and (= var4 var8) (= var3 var7)) (= var2 var6)) (= var1 var5)) (= var0 (right (getnode (read var8 var6)))))))) (inv_main83 var4 var3 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (inv_main68 var10 var9 var8) (and (and (and (and (= var7 var6) (= var5 var4)) (= var3 var4)) (= var2 nullAddr)) (and (= var1 nullAddr) (and (is-O_node (read var10 var8)) (and (and (and (= var6 var10) (= var4 var9)) (= var0 var8)) (= var1 (parent (getnode (read var10 var8)))))))))) (inv_main83 var7 var5 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Heap)) (or (not (and (inv_main41 var5 var4) (and (and (and (and (= var3 var5) (= var2 var4)) (= var1 var4)) (= var0 nullAddr)) (and (= var4 nullAddr) (not (= var4 nullAddr)))))) (inv_main83 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main19 var7 var6 var5) (and (and (and (= var4 0) (and (is-O_node (read var7 var6)) (is-O_node (read var7 var6)))) (and (and (= var3 (write var7 var6 (O_node (node (left (getnode (read var7 var6))) (right (getnode (read var7 var6))) var5 (value (getnode (read var7 var6))))))) (= var2 var6)) (= var1 var5))) (= var0 1)))) (inv_main23 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main19 var6 var5 var4) (and (and (not (= var3 0)) (and (is-O_node (read var6 var5)) (is-O_node (read var6 var5)))) (and (and (= var2 (write var6 var5 (O_node (node (left (getnode (read var6 var5))) (right (getnode (read var6 var5))) var4 (value (getnode (read var6 var5))))))) (= var1 var5)) (= var0 var4))))) (inv_main23 var2 var1 var0 var3))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main16 var7 var6 var5) (and (and (= var4 0) (and (and (= var3 nullAddr) (and (is-O_node (read var7 var5)) (is-O_node (read var7 var5)))) (and (and (= var2 (write var7 var5 (O_node (node (left (getnode (read var7 var5))) var6 (parent (getnode (read var7 var5))) (value (getnode (read var7 var5))))))) (= var3 var6)) (= var1 var5)))) (= var0 1)))) (inv_main23 var2 var3 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main16 var6 var5 var4) (and (not (= var3 0)) (and (and (= var2 nullAddr) (and (is-O_node (read var6 var4)) (is-O_node (read var6 var4)))) (and (and (= var1 (write var6 var4 (O_node (node (left (getnode (read var6 var4))) var5 (parent (getnode (read var6 var4))) (value (getnode (read var6 var4))))))) (= var2 var5)) (= var0 var4)))))) (inv_main23 var1 var2 var0 var3))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main32 var3 var2 var1) (and (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (= var0 (write var3 (left (getnode (read var3 var1))) (O_node (node nullAddr (right (getnode (read var3 (left (getnode (read var3 var1)))))) (parent (getnode (read var3 (left (getnode (read var3 var1)))))) (value (getnode (read var3 (left (getnode (read var3 var1))))))))))))) (inv_main35 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main35 var3 var2 var1) (and (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (= var0 (write var3 (left (getnode (read var3 var1))) (O_node (node (left (getnode (read var3 (left (getnode (read var3 var1)))))) nullAddr (parent (getnode (read var3 (left (getnode (read var3 var1)))))) (value (getnode (read var3 (left (getnode (read var3 var1))))))))))))) (inv_main36 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main56 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (= (left (getnode (read var2 var0))) nullAddr))))) (inv_main58 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main31 var6 var5 var4 var3) (and (and (not (= var2 nullAddr)) (and (is-O_node (read var6 var4)) (is-O_node (read var6 var4)))) (and (and (= var1 (write var6 var4 (O_node (node var3 (right (getnode (read var6 var4))) (parent (getnode (read var6 var4))) (value (getnode (read var6 var4))))))) (= var0 var5)) (= var2 var4))))) (inv_main32 var1 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main90 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (not (= (left (getnode (read var3 var1))) nullAddr))))) (inv_main92 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main23 var8 var7 var6 var5) (and (= var4 0) (and (and (is-O_node (read var8 var6)) (is-O_node (read var8 var6))) (and (and (and (= var3 (write var8 var6 (O_node (node (left (getnode (read var8 var6))) (right (getnode (read var8 var6))) (parent (getnode (read var8 var6))) var5)))) (= var2 var7)) (= var1 var6)) (= var0 var5)))))) (inv_main8 var3 var1 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Int) (var6 Heap)) (or (not (and (inv_main2 var6) (and (and (= var5 0) (and (= var4 var6) (= var3 nullAddr))) (and (and (= var2 var4) (= var1 var3)) (= var0 nullAddr))))) (inv_main8 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main91 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (not (= (right (getnode (read var3 var1))) nullAddr))))) (inv_main95 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main68 var6 var5 var4) (and (not (= var3 nullAddr)) (and (is-O_node (read var6 var4)) (and (and (and (= var2 var6) (= var1 var5)) (= var0 var4)) (= var3 (parent (getnode (read var6 var4))))))))) (inv_main56 var2 var1 var3))))
(assert (forall ((var0 Addr) (var1 Heap)) (or (not (and (inv_main41 var1 var0) (and (not (= var0 nullAddr)) (not (= var0 nullAddr))))) (inv_main56 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main95 var7 var6 var5 var4) (and (is-O_node (read var7 var5)) (and (and (and (= var3 (write var7 (right (getnode (read var7 var5))) defObj)) (= var2 var6)) (= var1 var5)) (= var0 var4))))) (inv_main97 var3 var2 var1 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main91 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (= (right (getnode (read var3 var1))) nullAddr)))) (inv_main97 var3 var2 var1 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main57 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (= (value (getnode (read var2 var0))) 0))))) (inv_main68 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 node) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main8 var8 var7 var6) (and (and (and (and (not (= var5 nullAddr)) (and (is-O_node (read var8 var6)) (is-O_node (read var8 var6)))) (and (and (= var4 (write var8 var6 (O_node (node (left (getnode (read var8 var6))) (right (getnode (read var8 var6))) nullAddr (value (getnode (read var8 var6))))))) (= var3 var7)) (= var5 var6))) (= var2 (newHeap (alloc var4 (O_node var1))))) (= var0 (newAddr (alloc var4 (O_node var1))))))) (inv_main31 var2 var3 var5 var0))))
(assert (forall ((var0 Addr) (var1 node) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (inv_main38 var9 var8 var7) (and (and (and (not (= var6 nullAddr)) (and (is-O_node (read var9 var7)) (and (and (and (= var5 var9) (= var4 var8)) (= var3 var7)) (= var6 (right (getnode (read var9 var7))))))) (= var2 (newHeap (alloc var5 (O_node var1))))) (= var0 (newAddr (alloc var5 (O_node var1))))))) (inv_main31 var2 var4 var6 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main13 var3 var2 var1) (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 var1))) (= var0 (write var3 var1 (O_node (node nullAddr (right (getnode (read var3 var1))) (parent (getnode (read var3 var1))) (value (getnode (read var3 var1)))))))))) (inv_main16 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main83 var8 var7 var6 var5) (and (and (not (= var4 nullAddr)) (is-O_node (read var8 var6))) (and (and (and (and (= var3 var8) (= var2 var7)) (= var1 var6)) (= var0 var5)) (= var4 (right (getnode (read var8 var6)))))))) (inv_main84 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main8 var5 var4 var3) (and (not (= var2 nullAddr)) (and (and (= var1 nullAddr) (and (is-O_node (read var5 var3)) (is-O_node (read var5 var3)))) (and (and (= var0 (write var5 var3 (O_node (node (left (getnode (read var5 var3))) (right (getnode (read var5 var3))) nullAddr (value (getnode (read var5 var3))))))) (= var2 var4)) (= var1 var3)))))) (inv_main41 var0 var2))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main38 var6 var5 var4) (and (not (= var3 nullAddr)) (and (= var2 nullAddr) (and (is-O_node (read var6 var4)) (and (and (and (= var1 var6) (= var3 var5)) (= var0 var4)) (= var2 (right (getnode (read var6 var4)))))))))) (inv_main41 var1 var3))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main37 var3 var2 var1) (and (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (= var0 (write var3 (left (getnode (read var3 var1))) (O_node (node (left (getnode (read var3 (left (getnode (read var3 var1)))))) (right (getnode (read var3 (left (getnode (read var3 var1)))))) var1 (value (getnode (read var3 (left (getnode (read var3 var1))))))))))))) (inv_main38 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main97 var8 var7 var6 var5) (and (not (= var4 nullAddr)) (and (is-O_node (read var8 var6)) (and (and (and (and (= var3 var8) (= var2 var7)) (= var1 var6)) (= var0 var5)) (= var4 (parent (getnode (read var8 var6))))))))) (inv_main90 var3 var2 var4 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main83 var8 var7 var6 var5) (and (not (= var4 nullAddr)) (and (and (= var3 nullAddr) (is-O_node (read var8 var6))) (and (and (and (and (= var2 var8) (= var1 var7)) (= var4 var6)) (= var0 var5)) (= var3 (right (getnode (read var8 var6))))))))) (inv_main90 var2 var1 var4 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main36 var3 var2 var1) (and (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (= var0 (write var3 (left (getnode (read var3 var1))) (O_node (node (left (getnode (read var3 (left (getnode (read var3 var1)))))) (right (getnode (read var3 (left (getnode (read var3 var1)))))) (parent (getnode (read var3 (left (getnode (read var3 var1)))))) 42))))))) (inv_main37 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main16 var5 var4 var3) (and (and (not (= var2 nullAddr)) (and (is-O_node (read var5 var3)) (is-O_node (read var5 var3)))) (and (and (= var1 (write var5 var3 (O_node (node (left (getnode (read var5 var3))) var4 (parent (getnode (read var5 var3))) (value (getnode (read var5 var3))))))) (= var2 var4)) (= var0 var3))))) (inv_main19 var1 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main92 var4 var3 var2 var1) (and (is-O_node (read var4 var2)) (= var0 (write var4 (left (getnode (read var4 var2))) defObj))))) (inv_main91 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main90 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (= (left (getnode (read var3 var1))) nullAddr)))) (inv_main91 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main19 var2 var1 var0) (not (is-O_node (read var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main19 var2 var1 var0) (and (is-O_node (read var2 var1)) (not (is-O_node (read var2 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main23 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main23 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (not (is-O_node (read var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main31 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main31 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (not (is-O_node (read var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main32 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main32 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main32 var2 var1 var0) (and (and (is-O_node (read var2 var0)) (is-O_node (read var2 (left (getnode (read var2 var0)))))) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main35 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main35 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main35 var2 var1 var0) (and (and (is-O_node (read var2 var0)) (is-O_node (read var2 (left (getnode (read var2 var0)))))) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main36 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main36 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main36 var2 var1 var0) (and (and (is-O_node (read var2 var0)) (is-O_node (read var2 (left (getnode (read var2 var0)))))) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main37 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main37 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main37 var2 var1 var0) (and (and (is-O_node (read var2 var0)) (is-O_node (read var2 (left (getnode (read var2 var0)))))) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main38 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main52 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main56 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main58 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main58 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main64 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main57 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main72 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main68 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main83 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main84 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main90 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main92 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main91 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main95 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main97 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(check-sat)
