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
   (node (next Addr) (val Int))
  )
))
(declare-fun inv_main10 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main11 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main13 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main14 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main17 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main21 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main22 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main23 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main26 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main27 (Heap Addr Int Int Addr) Bool)
(declare-fun inv_main4 (Heap Addr Int Int) Bool)
(declare-fun inv_main9 (Heap Addr Int Int Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Int) (var1 Heap) (var2 Addr) (var3 Int) (var4 Int) (var5 Addr) (var6 Heap)) (or (not (and (inv_main10 var6 var5 var4 var3 var2) (and (and (is-O_node (read var6 var2)) (is-O_node (read var6 var2))) (= var1 (write var6 var2 (O_node (node (next (getnode (read var6 var2))) var0))))))) (inv_main9 var1 var5 var4 var3 var2))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (inv_main23 var4 var3 var2 var1 var0)) (inv_main22 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Heap)) (or (not (and (inv_main21 var10 var9 var8 var7 var6) (and (and (not (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1)))) (is-O_node (read var10 var6))) (and (and (and (and (and (= var3 var10) (= var2 var9)) (= var5 var8)) (= var1 var7)) (= var0 var6)) (= var4 (val (getnode (read var10 var6)))))))) (inv_main22 var3 var2 var5 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Heap)) (or (not (and (inv_main22 var10 var9 var8 var7 var6) (and (and (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1))) (is-O_node (read var10 var6))) (and (and (and (and (and (= var3 var10) (= var2 var9)) (= var1 var8)) (= var4 var7)) (= var0 var6)) (= var5 (val (getnode (read var10 var6)))))))) (inv_main27 var3 var2 var1 var4 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (inv_main27 var4 var3 var2 var1 var0)) (inv_main26 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Heap)) (or (not (and (inv_main22 var10 var9 var8 var7 var6) (and (and (not (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1)))) (is-O_node (read var10 var6))) (and (and (and (and (and (= var3 var10) (= var2 var9)) (= var1 var8)) (= var4 var7)) (= var0 var6)) (= var5 (val (getnode (read var10 var6)))))))) (inv_main26 var3 var2 var1 var4 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Heap)) (or (not (and (inv_main21 var10 var9 var8 var7 var6) (and (and (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1))) (is-O_node (read var10 var6))) (and (and (and (and (and (= var3 var10) (= var2 var9)) (= var5 var8)) (= var1 var7)) (= var0 var6)) (= var4 (val (getnode (read var10 var6)))))))) (inv_main23 var3 var2 var5 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (<= 0 (+ (+ (val (getnode (read var4 var0))) (* (- 1) var1)) (- 1)))))) (inv_main17 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 node) (var6 Heap) (var7 Int) (var8 Int) (var9 Addr) (var10 Heap)) (or (not (and (inv_main4 var10 var9 var8 var7) (and (and (and (and (and (= var6 (newHeap (alloc var10 (O_node var5)))) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 (newAddr (alloc var10 (O_node var5))))) (not (= var0 0))))) (inv_main10 var6 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Heap)) (or (not (and (inv_main14 var10 var9 var8 var7 var6) (and (is-O_node (read var10 var6)) (and (and (and (and (and (= var5 var10) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 var6)) (= var0 (val (getnode (read var10 var6)))))))) (inv_main13 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (inv_main11 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (<= 0 (+ (+ var2 (* (- 1) (val (getnode (read var4 var0))))) (- 1))))))) (inv_main13 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (inv_main11 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (<= 0 (+ (+ var2 (* (- 1) (val (getnode (read var4 var0))))) (- 1)))))) (inv_main14 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Int) (var8 Addr) (var9 Heap)) (or (not (and (inv_main9 var9 var8 var7 var6 var5) (and (and (is-O_node (read var9 var5)) (is-O_node (read var9 var5))) (and (and (and (and (= var4 (write var9 var5 (O_node (node var8 (val (getnode (read var9 var5))))))) (= var3 var8)) (= var2 var7)) (= var1 var6)) (= var0 var5))))) (inv_main11 var4 var0 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Heap)) (or (not (and (inv_main17 var10 var9 var8 var7 var6) (and (is-O_node (read var10 var6)) (and (and (and (and (and (= var5 var10) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 var6)) (= var0 (val (getnode (read var10 var6)))))))) (inv_main4 var5 var4 var3 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (<= 0 (+ (+ (val (getnode (read var4 var0))) (* (- 1) var1)) (- 1))))))) (inv_main4 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Heap) (var4 Heap)) (or (not (and (inv_main2 var4) (and (and (and (= var3 var4) (= var2 nullAddr)) (= var1 2147483647)) (= var0 (- 2147483647))))) (inv_main4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Heap)) (or (not (and (inv_main26 var10 var9 var8 var7 var6) (and (not (= var5 nullAddr)) (and (is-O_node (read var10 var6)) (and (and (and (and (and (= var4 var10) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6)) (= var5 (next (getnode (read var10 var6))))))))) (inv_main21 var4 var3 var2 var1 var5))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (inv_main4 var4 var3 var2 var1) (and (not (= var3 nullAddr)) (= var0 0)))) (inv_main21 var4 var3 var2 var1 var3))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main10 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main10 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main9 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main9 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var0)) (not (is-O_node (read var4 var0))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main11 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main14 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main21 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (inv_main23 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main22 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (inv_main27 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main26 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var0)))))))
(check-sat)
