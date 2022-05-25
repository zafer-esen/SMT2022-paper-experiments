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
   (node (next Addr) (event1 Int) (event2 Int))
  )
))
(declare-fun inv_main17 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main18 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main19 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Addr Addr) Bool)
(declare-fun inv_main23 (Heap Addr Addr) Bool)
(declare-fun inv_main24 (Heap Addr Addr) Bool)
(declare-fun inv_main26 (Heap Addr Addr Int) Bool)
(declare-fun inv_main28 (Heap Addr Addr Int) Bool)
(declare-fun inv_main29 (Heap Addr Addr Int) Bool)
(declare-fun inv_main3 (Heap Addr) Bool)
(declare-fun inv_main32 (Heap Addr Addr Int) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (inv_main24 var2 var1 var0)) (inv_main23 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main32 var3 var2 var1 var0) (= var0 0))) (inv_main23 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main28 var4 var3 var2 var1) (and (not (= var1 0)) (= var0 1)))) (inv_main32 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main29 var4 var3 var2 var1) (and (not (= var1 0)) (= var0 0)))) (inv_main32 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap) (var8 Int) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (inv_main29 var11 var10 var9 var8) (and (and (and (= var8 0) (is-O_node (read var11 var9))) (and (and (and (= var7 var11) (= var6 var10)) (= var5 var9)) (= var4 (event2 (getnode (read var11 var9)))))) (and (and (and (= var3 var7) (= var2 var6)) (= var1 var5)) (or (and (= var4 2) (= var0 1)) (and (not (= var4 2)) (= var0 0))))))) (inv_main32 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main28 var4 var3 var2 var1) (and (and (= var1 0) (is-O_node (read var4 var2))) (= var0 (event1 (getnode (read var4 var2))))))) (inv_main29 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main32 var3 var2 var1 var0) (not (= var0 0)))) (inv_main24 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main23 var6 var5 var4) (and (not (= var3 nullAddr)) (and (is-O_node (read var6 var4)) (and (and (and (= var2 var6) (= var1 var5)) (= var0 var4)) (= var3 (next (getnode (read var6 var4))))))))) (inv_main22 var2 var1 var3))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (or (not (and (inv_main3 var2 var1) (and (not (= var1 nullAddr)) (= var0 0)))) (inv_main22 var2 var1 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 Heap)) (or (not (and (inv_main17 var5 var4 var3 var2 var1) (and (and (is-O_node (read var5 var1)) (is-O_node (read var5 var1))) (= var0 (write var5 var1 (O_node (node (next (getnode (read var5 var1))) var3 (event2 (getnode (read var5 var1)))))))))) (inv_main18 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main26 var4 var3 var2 var1) (and (not (= var1 1)) (= var0 0)))) (inv_main28 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main26 var8 var7 var6 var5) (and (and (and (= var5 1) (is-O_node (read var8 var6))) (and (and (and (= var4 var8) (= var3 var7)) (= var2 var6)) (= var1 (event2 (getnode (read var8 var6)))))) (or (and (= var1 3) (= var0 1)) (and (not (= var1 3)) (= var0 0)))))) (inv_main28 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main22 var3 var2 var1) (and (is-O_node (read var3 var1)) (= var0 (event1 (getnode (read var3 var1))))))) (inv_main26 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap)) (or (not (and (inv_main2 var1) (= var0 nullAddr))) (inv_main3 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Int) (var8 Addr) (var9 Heap)) (or (not (and (inv_main19 var9 var8 var7 var6 var5) (and (and (is-O_node (read var9 var5)) (is-O_node (read var9 var5))) (and (and (and (and (= var4 (write var9 var5 (O_node (node var8 (event1 (getnode (read var9 var5))) (event2 (getnode (read var9 var5))))))) (= var3 var8)) (= var2 var7)) (= var1 var6)) (= var0 var5))))) (inv_main3 var4 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (inv_main3 var4 var3) (and (or (or (or (<= 0 (+ (* (- 1) var2) (- 1))) (<= 0 (+ (+ var2 (- 3)) (- 1)))) (<= 0 (+ (* (- 1) var1) (- 1)))) (<= 0 (+ (+ var1 (- 3)) (- 1)))) (not (= var0 0))))) (inv_main3 var4 var3))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (inv_main3 var4 var3) (and (and (or (or (and (= var2 0) (= var1 2)) (and (= var2 1) (= var1 3))) (and (= var2 0) (= var1 3))) (and (and (and (not (<= 0 (+ (* (- 1) var2) (- 1)))) (not (<= 0 (+ (+ var2 (- 3)) (- 1))))) (not (<= 0 (+ (* (- 1) var1) (- 1))))) (not (<= 0 (+ (+ var1 (- 3)) (- 1)))))) (not (= var0 0))))) (inv_main3 var4 var3))))
(assert (forall ((var0 Addr) (var1 node) (var2 Heap) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Heap)) (or (not (and (inv_main3 var7 var6) (and (and (and (and (and (and (or (not (= var5 0)) (not (= var4 2))) (or (not (= var5 1)) (not (= var4 3)))) (or (not (= var5 0)) (not (= var4 3)))) (and (and (and (not (<= 0 (+ (* (- 1) var5) (- 1)))) (not (<= 0 (+ (+ var5 (- 3)) (- 1))))) (not (<= 0 (+ (* (- 1) var4) (- 1))))) (not (<= 0 (+ (+ var4 (- 3)) (- 1)))))) (not (= var3 0))) (= var2 (newHeap (alloc var7 (O_node var1))))) (= var0 (newAddr (alloc var7 (O_node var1))))))) (inv_main17 var2 var6 var5 var4 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 Heap)) (or (not (and (inv_main18 var5 var4 var3 var2 var1) (and (and (is-O_node (read var5 var1)) (is-O_node (read var5 var1))) (= var0 (write var5 var1 (O_node (node (next (getnode (read var5 var1))) (event1 (getnode (read var5 var1))) var2))))))) (inv_main19 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main22 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main26 var3 var2 var1 var0) (and (= var0 1) (not (is-O_node (read var3 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main28 var3 var2 var1 var0) (and (= var0 0) (not (is-O_node (read var3 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main29 var3 var2 var1 var0) (and (= var0 0) (not (is-O_node (read var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main24 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main23 var2 var1 var0) (not (is-O_node (read var2 var0)))))))
(check-sat)
