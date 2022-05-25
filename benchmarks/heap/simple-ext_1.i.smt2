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
(declare-fun inv_main12 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main13 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main14 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main20 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main23 (Heap Addr Addr Addr Int Int) Bool)
(declare-fun inv_main26 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main29 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main34 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main35 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main36 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main44 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main7 (Heap Addr Int) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main12 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ 30 (* (- 1) var0)) (- 1)))))) (inv_main13 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main12 var5 var4 var3 var2 var1) (and (= var0 0) (<= 0 (+ (+ 30 (* (- 1) var1)) (- 1)))))) (inv_main13 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (inv_main26 var11 var10 var9 var8 var7) (and (and (is-O_node (read var11 var8)) (and (and (and (and (and (= var6 var11) (= var5 var10)) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 (n (getnode (read var11 var8)))))) (= var0 (+ var2 1))))) (inv_main12 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 node) (var3 Heap) (var4 Addr) (var5 Heap)) (or (not (and (inv_main2 var5) (and (and (not (= var4 nullAddr)) (and (= var3 (newHeap (alloc var5 (O_node var2)))) (= var4 (newAddr (alloc var5 (O_node var2)))))) (= var1 0)))) (inv_main12 var3 var4 var0 var4 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main13 var5 var4 var3 var2 var1) (and (and (is-O_node (read var5 var2)) (is-O_node (read var5 var2))) (= var0 (write var5 var2 (O_node (node var1 (n (getnode (read var5 var2)))))))))) (inv_main29 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (inv_main34 var10 var9 var8 var7 var6) (and (and (= var5 var4) (is-O_node (read var10 var7))) (and (and (and (and (and (= var3 var10) (= var2 var9)) (= var1 var8)) (= var0 var7)) (= var4 var6)) (= var5 (h (getnode (read var10 var7)))))))) (inv_main35 var3 var2 var1 var0 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 node) (var9 Heap) (var10 Heap) (var11 Addr) (var12 Int) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (inv_main14 var16 var15 var14 var13 var12) (and (not (= var11 nullAddr)) (and (and (and (and (and (and (and (= var10 (newHeap (alloc var9 (O_node var8)))) (= var7 var6)) (= var5 var4)) (= var3 var2)) (= var1 var0)) (= var11 (newAddr (alloc var9 (O_node var8))))) (and (is-O_node (read var16 var13)) (is-O_node (read var16 var13)))) (and (and (and (and (= var9 (write var16 var13 (O_node (node var12 (n (getnode (read var16 var13))))))) (= var6 var15)) (= var4 var14)) (= var2 var13)) (= var0 var12)))))) (inv_main20 var10 var7 var11 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main12 var5 var4 var3 var2 var1) (and (not (= var0 0)) (<= 0 (+ (+ 30 (* (- 1) var1)) (- 1)))))) (inv_main14 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (inv_main23 var5 var4 var3 var2 var1 var0)) (inv_main23 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 node) (var10 Heap) (var11 Heap) (var12 Addr) (var13 Int) (var14 Addr) (var15 Addr) (var16 Addr) (var17 Heap)) (or (not (and (inv_main14 var17 var16 var15 var14 var13) (and (and (= var12 nullAddr) (and (and (and (and (and (and (and (= var11 (newHeap (alloc var10 (O_node var9)))) (= var8 var7)) (= var6 var5)) (= var4 var3)) (= var2 var1)) (= var12 (newAddr (alloc var10 (O_node var9))))) (and (is-O_node (read var17 var14)) (is-O_node (read var17 var14)))) (and (and (and (and (= var10 (write var17 var14 (O_node (node var13 (n (getnode (read var17 var14))))))) (= var7 var16)) (= var5 var15)) (= var3 var14)) (= var1 var13)))) (= var0 1)))) (inv_main23 var11 var8 var12 var4 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap) (var10 Addr) (var11 Int) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Heap)) (or (not (and (inv_main44 var15 var14 var13 var12 var11) (and (not (= var10 nullAddr)) (and (and (is-O_node (read var15 var12)) (and (and (and (and (and (= var9 var15) (= var8 var14)) (= var7 var13)) (= var6 var12)) (= var5 var11)) (= var4 (n (getnode (read var15 var12)))))) (and (and (and (and (= var3 (write var9 var6 defObj)) (= var2 var8)) (= var10 var4)) (= var1 var6)) (= var0 var5)))))) (inv_main44 var3 var2 var10 var10 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (inv_main29 var10 var9 var8 var7 var6) (and (and (not (= var5 nullAddr)) (and (= var5 nullAddr) (and (and (is-O_node (read var10 var7)) (is-O_node (read var10 var7))) (and (and (and (and (= var4 (write var10 var7 (O_node (node (h (getnode (read var10 var7))) 0)))) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 var6))))) (= var0 0)))) (inv_main44 var4 var5 var3 var5 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (inv_main35 var11 var10 var9 var8 var7) (and (and (not (= var6 nullAddr)) (and (= var5 nullAddr) (and (is-O_node (read var11 var8)) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var5 (n (getnode (read var11 var8)))))))) (= var0 (+ var1 1))))) (inv_main44 var4 var6 var3 var6 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (inv_main34 var10 var9 var8 var7 var6) (and (and (not (= var5 var4)) (is-O_node (read var10 var7))) (and (and (and (and (and (= var3 var10) (= var2 var9)) (= var1 var8)) (= var0 var7)) (= var4 var6)) (= var5 (h (getnode (read var10 var7)))))))) (inv_main36 var3 var2 var1 var0 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (inv_main29 var10 var9 var8 var7 var6) (and (and (not (= var5 nullAddr)) (and (and (is-O_node (read var10 var7)) (is-O_node (read var10 var7))) (and (and (and (and (= var4 (write var10 var7 (O_node (node (h (getnode (read var10 var7))) 0)))) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 var6)))) (= var0 0)))) (inv_main34 var4 var5 var3 var5 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (inv_main35 var11 var10 var9 var8 var7) (and (and (not (= var6 nullAddr)) (and (is-O_node (read var11 var8)) (and (and (and (and (and (= var5 var11) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var6 (n (getnode (read var11 var8))))))) (= var0 (+ var1 1))))) (inv_main34 var5 var4 var3 var6 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main20 var5 var4 var3 var2 var1) (and (and (is-O_node (read var5 var2)) (is-O_node (read var5 var2))) (= var0 (write var5 var2 (O_node (node (h (getnode (read var5 var2))) var3))))))) (inv_main26 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (or (not (inv_main7 var2 var1 var0)) (inv_main7 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 node) (var2 Heap) (var3 Addr) (var4 Heap)) (or (not (and (inv_main2 var4) (and (and (= var3 nullAddr) (and (= var2 (newHeap (alloc var4 (O_node var1)))) (= var3 (newAddr (alloc var4 (O_node var1)))))) (= var0 1)))) (inv_main7 var2 var3 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main14 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main14 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var1)) (not (is-O_node (read var4 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main20 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main20 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var1)) (not (is-O_node (read var4 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main26 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var1)) (not (is-O_node (read var4 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (and (is-O_node (read var4 var1)) (not (is-O_node (read var4 var1))))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main34 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (inv_main36 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main35 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main44 var4 var3 var2 var1 var0) (not (is-O_node (read var4 var1)))))))
(check-sat)