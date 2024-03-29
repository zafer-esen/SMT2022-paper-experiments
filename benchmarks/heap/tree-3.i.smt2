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
   (node (left Addr) (right Addr) (parent Addr) (value Int))
  )
))
(declare-fun inv_main13 (Heap Addr Addr) Bool)
(declare-fun inv_main16 (Heap Addr Addr) Bool)
(declare-fun inv_main19 (Heap Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main23 (Heap Addr Addr Int) Bool)
(declare-fun inv_main27 (Heap Addr Addr) Bool)
(declare-fun inv_main28 (Heap Addr Addr) Bool)
(declare-fun inv_main33 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main34 (Heap Addr Addr) Bool)
(declare-fun inv_main37 (Heap Addr Addr) Bool)
(declare-fun inv_main38 (Heap Addr Addr) Bool)
(declare-fun inv_main39 (Heap Addr Addr) Bool)
(declare-fun inv_main40 (Heap Addr Addr) Bool)
(declare-fun inv_main54 (Heap Addr Addr) Bool)
(declare-fun inv_main58 (Heap Addr Addr) Bool)
(declare-fun inv_main59 (Heap Addr Addr) Bool)
(declare-fun inv_main60 (Heap Addr Addr) Bool)
(declare-fun inv_main66 (Heap Addr Addr) Bool)
(declare-fun inv_main7 (Heap Addr Addr) Bool)
(declare-fun inv_main70 (Heap Addr Addr) Bool)
(declare-fun inv_main74 (Heap Addr Addr) Bool)
(declare-fun inv_main85 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main86 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main92 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main93 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main94 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main97 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main99 (Heap Addr Addr Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main58 var2 var1 var0) (and (is-O_node (read var2 var0)) (= (left (getnode (read var2 var0))) nullAddr)))) (inv_main59 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main60 var6 var5 var4) (and (and (= var3 42) (and (is-O_node (read var6 var4)) (is-O_node (read var6 (left (getnode (read var6 var4))))))) (and (and (and (= var2 var6) (= var1 var5)) (= var0 var4)) (= var3 (value (getnode (read var6 (left (getnode (read var6 var4))))))))))) (inv_main59 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main85 var8 var7 var6 var5) (and (and (not (= var4 nullAddr)) (is-O_node (read var8 var6))) (and (and (and (and (= var3 var8) (= var2 var7)) (= var1 var6)) (= var0 var5)) (= var4 (right (getnode (read var8 var6)))))))) (inv_main86 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main16 var5 var4 var3) (and (and (not (= var2 nullAddr)) (and (is-O_node (read var5 var3)) (is-O_node (read var5 var3)))) (and (and (= var1 (write var5 var3 (O_node (node (left (getnode (read var5 var3))) var4 (parent (getnode (read var5 var3))) (value (getnode (read var5 var3))))))) (= var2 var4)) (= var0 var3))))) (inv_main19 var1 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main38 var3 var2 var1) (and (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (= var0 (write var3 (left (getnode (read var3 var1))) (O_node (node (left (getnode (read var3 (left (getnode (read var3 var1)))))) (right (getnode (read var3 (left (getnode (read var3 var1)))))) (parent (getnode (read var3 (left (getnode (read var3 var1)))))) 42))))))) (inv_main39 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main28 var3 var2 var1) (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 var1))) (= var0 (write var3 var1 (O_node (node (left (getnode (read var3 var1))) (right (getnode (read var3 var1))) nullAddr (value (getnode (read var3 var1)))))))))) (inv_main27 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main40 var6 var5 var4) (and (is-O_node (read var6 var4)) (and (and (and (= var3 var6) (= var2 var5)) (= var1 var4)) (= var0 (right (getnode (read var6 var4)))))))) (inv_main27 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main7 var3 var2 var1) (and (= var1 nullAddr) (= var0 0)))) (inv_main27 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main59 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (= (value (getnode (read var2 var0))) 0))))) (inv_main70 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main70 var6 var5 var4) (and (not (= var3 nullAddr)) (and (is-O_node (read var6 var4)) (and (and (and (= var2 var6) (= var1 var5)) (= var0 var4)) (= var3 (parent (getnode (read var6 var4))))))))) (inv_main58 var2 var1 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main27 var2 var1 var0) (and (and (not (= var1 nullAddr)) (not (= var1 nullAddr))) (and (not (= var1 nullAddr)) (= var0 nullAddr))))) (inv_main58 var2 var1 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main23 var7 var6 var5 var4) (and (and (is-O_node (read var7 var5)) (is-O_node (read var7 var5))) (and (and (and (= var3 (write var7 var5 (O_node (node (left (getnode (read var7 var5))) (right (getnode (read var7 var5))) (parent (getnode (read var7 var5))) var4)))) (= var2 var6)) (= var1 var5)) (= var0 var4))))) (inv_main7 var3 var1 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Heap)) (or (not (and (inv_main2 var3) (and (and (= var2 var3) (= var1 nullAddr)) (= var0 nullAddr)))) (inv_main7 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main7 var3 var2 var1) (and (not (= var1 nullAddr)) (= var0 0)))) (inv_main28 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main37 var3 var2 var1) (and (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (= var0 (write var3 (left (getnode (read var3 var1))) (O_node (node (left (getnode (read var3 (left (getnode (read var3 var1)))))) nullAddr (parent (getnode (read var3 (left (getnode (read var3 var1)))))) (value (getnode (read var3 (left (getnode (read var3 var1))))))))))))) (inv_main38 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main58 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (= (left (getnode (read var2 var0))) nullAddr))))) (inv_main60 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main39 var3 var2 var1) (and (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (= var0 (write var3 (left (getnode (read var3 var1))) (O_node (node (left (getnode (read var3 (left (getnode (read var3 var1)))))) (right (getnode (read var3 (left (getnode (read var3 var1)))))) var1 (value (getnode (read var3 (left (getnode (read var3 var1))))))))))))) (inv_main40 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main59 var2 var1 var0) (and (is-O_node (read var2 var0)) (= (value (getnode (read var2 var0))) 0)))) (inv_main74 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main97 var7 var6 var5 var4) (and (is-O_node (read var7 var5)) (and (and (and (= var3 (write var7 (right (getnode (read var7 var5))) defObj)) (= var2 var6)) (= var1 var5)) (= var0 var4))))) (inv_main99 var3 var2 var1 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main93 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (= (right (getnode (read var3 var1))) nullAddr)))) (inv_main99 var3 var2 var1 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main99 var8 var7 var6 var5) (and (not (= var4 nullAddr)) (and (is-O_node (read var8 var6)) (and (and (and (and (= var3 var8) (= var2 var7)) (= var1 var6)) (= var0 var5)) (= var4 (parent (getnode (read var8 var6))))))))) (inv_main92 var3 var2 var4 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main85 var8 var7 var6 var5) (and (not (= var4 nullAddr)) (and (and (= var3 nullAddr) (is-O_node (read var8 var6))) (and (and (and (and (= var2 var8) (= var1 var7)) (= var4 var6)) (= var0 var5)) (= var3 (right (getnode (read var8 var6))))))))) (inv_main92 var2 var1 var4 var0))))
(assert (forall ((var0 Addr) (var1 node) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main27 var5 var4 var3) (and (and (not (= var3 nullAddr)) (= var2 (newHeap (alloc var5 (O_node var1))))) (= var0 (newAddr (alloc var5 (O_node var1))))))) (inv_main33 var2 var4 var3 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main60 var6 var5 var4) (and (and (not (= var3 42)) (and (is-O_node (read var6 var4)) (is-O_node (read var6 (left (getnode (read var6 var4))))))) (and (and (and (= var2 var6) (= var1 var5)) (= var0 var4)) (= var3 (value (getnode (read var6 (left (getnode (read var6 var4))))))))))) (inv_main66 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main13 var3 var2 var1) (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 var1))) (= var0 (write var3 var1 (O_node (node nullAddr (right (getnode (read var3 var1))) (parent (getnode (read var3 var1))) (value (getnode (read var3 var1)))))))))) (inv_main16 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 node) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main7 var8 var7 var6) (and (not (= var5 nullAddr)) (and (and (and (and (= var4 (newHeap (alloc var8 (O_node var3)))) (= var2 var7)) (= var1 var6)) (= var5 (newAddr (alloc var8 (O_node var3))))) (not (= var0 0)))))) (inv_main13 var4 var2 var5))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main33 var6 var5 var4 var3) (and (and (not (= var2 nullAddr)) (and (is-O_node (read var6 var4)) (is-O_node (read var6 var4)))) (and (and (= var1 (write var6 var4 (O_node (node var3 (right (getnode (read var6 var4))) (parent (getnode (read var6 var4))) (value (getnode (read var6 var4))))))) (= var0 var5)) (= var2 var4))))) (inv_main34 var1 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main92 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (not (= (left (getnode (read var3 var1))) nullAddr))))) (inv_main94 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main94 var4 var3 var2 var1) (and (is-O_node (read var4 var2)) (= var0 (write var4 (left (getnode (read var4 var2))) defObj))))) (inv_main93 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main92 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (= (left (getnode (read var3 var1))) nullAddr)))) (inv_main93 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main34 var3 var2 var1) (and (and (and (is-O_node (read var3 var1)) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (is-O_node (read var3 (left (getnode (read var3 var1)))))) (= var0 (write var3 (left (getnode (read var3 var1))) (O_node (node nullAddr (right (getnode (read var3 (left (getnode (read var3 var1)))))) (parent (getnode (read var3 (left (getnode (read var3 var1)))))) (value (getnode (read var3 (left (getnode (read var3 var1))))))))))))) (inv_main37 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main93 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (not (= (right (getnode (read var3 var1))) nullAddr))))) (inv_main97 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main86 var8 var7 var6 var5) (and (is-O_node (read var8 var6)) (and (and (and (and (= var4 var8) (= var3 var7)) (= var2 var6)) (= var1 var5)) (= var0 (right (getnode (read var8 var6)))))))) (inv_main85 var4 var3 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (inv_main70 var10 var9 var8) (and (and (and (and (= var7 var6) (= var5 var4)) (= var3 var4)) (= var2 nullAddr)) (and (= var1 nullAddr) (and (is-O_node (read var10 var8)) (and (and (and (= var6 var10) (= var4 var9)) (= var0 var8)) (= var1 (parent (getnode (read var10 var8)))))))))) (inv_main85 var7 var5 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main27 var6 var5 var4) (and (and (and (and (= var3 var6) (= var2 var5)) (= var1 var5)) (= var0 nullAddr)) (and (and (= var5 nullAddr) (not (= var5 nullAddr))) (and (not (= var5 nullAddr)) (= var4 nullAddr)))))) (inv_main85 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main27 var2 var1 var0) (and (= var1 nullAddr) (and (not (= var1 nullAddr)) (= var0 nullAddr))))) (inv_main54 var2 var1 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main19 var7 var6 var5) (and (and (and (= var4 0) (and (is-O_node (read var7 var6)) (is-O_node (read var7 var6)))) (and (and (= var3 (write var7 var6 (O_node (node (left (getnode (read var7 var6))) (right (getnode (read var7 var6))) var5 (value (getnode (read var7 var6))))))) (= var2 var6)) (= var1 var5))) (= var0 1)))) (inv_main23 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main19 var6 var5 var4) (and (and (not (= var3 0)) (and (is-O_node (read var6 var5)) (is-O_node (read var6 var5)))) (and (and (= var2 (write var6 var5 (O_node (node (left (getnode (read var6 var5))) (right (getnode (read var6 var5))) var4 (value (getnode (read var6 var5))))))) (= var1 var5)) (= var0 var4))))) (inv_main23 var2 var1 var0 var3))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main16 var7 var6 var5) (and (and (= var4 0) (and (and (= var3 nullAddr) (and (is-O_node (read var7 var5)) (is-O_node (read var7 var5)))) (and (and (= var2 (write var7 var5 (O_node (node (left (getnode (read var7 var5))) var6 (parent (getnode (read var7 var5))) (value (getnode (read var7 var5))))))) (= var3 var6)) (= var1 var5)))) (= var0 1)))) (inv_main23 var2 var3 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main16 var6 var5 var4) (and (not (= var3 0)) (and (and (= var2 nullAddr) (and (is-O_node (read var6 var4)) (is-O_node (read var6 var4)))) (and (and (= var1 (write var6 var4 (O_node (node (left (getnode (read var6 var4))) var5 (parent (getnode (read var6 var4))) (value (getnode (read var6 var4))))))) (= var2 var5)) (= var0 var4)))))) (inv_main23 var1 var2 var0 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main19 var2 var1 var0) (not (is-O_node (read var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main19 var2 var1 var0) (and (is-O_node (read var2 var1)) (not (is-O_node (read var2 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main23 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main23 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (not (is-O_node (read var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main28 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main28 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main33 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main33 var3 var2 var1 var0) (and (is-O_node (read var3 var1)) (not (is-O_node (read var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main34 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main34 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main34 var2 var1 var0) (and (and (is-O_node (read var2 var0)) (is-O_node (read var2 (left (getnode (read var2 var0)))))) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main37 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main37 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main37 var2 var1 var0) (and (and (is-O_node (read var2 var0)) (is-O_node (read var2 (left (getnode (read var2 var0)))))) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main38 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main38 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main38 var2 var1 var0) (and (and (is-O_node (read var2 var0)) (is-O_node (read var2 (left (getnode (read var2 var0)))))) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main39 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main39 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main39 var2 var1 var0) (and (and (is-O_node (read var2 var0)) (is-O_node (read var2 (left (getnode (read var2 var0)))))) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main40 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main54 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main58 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main60 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main60 var2 var1 var0) (and (is-O_node (read var2 var0)) (not (is-O_node (read var2 (left (getnode (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main66 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main59 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main74 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main70 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main85 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main86 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main92 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main94 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main93 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main97 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main99 var3 var2 var1 var0) (not (is-O_node (read var3 var1)))))))
(check-sat)
