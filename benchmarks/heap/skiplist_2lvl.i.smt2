(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
(declare-heap Heap Addr HeapObject
 defObj
 ((HeapObject 0) (sl_item 0) (sl 0)) (
  (
   (O_Int (getInt Int))
   (O_UInt (getUInt Int))
   (O_Addr (getAddr Addr))
   (O_sl_item (getsl_item sl_item))
   (O_sl (getsl sl))
   (defObj)
  )
  (
   (sl_item (n1 Addr) (n2 Addr))
  )
  (
   (sl (head Addr) (tail Addr))
  )
))
(declare-fun inv_main10 (Heap Addr Addr) Bool)
(declare-fun inv_main11 (Heap Addr) Bool)
(declare-fun inv_main12 (Heap Addr Addr) Bool)
(declare-fun inv_main13 (Heap Addr Addr) Bool)
(declare-fun inv_main15 (Heap Addr Addr) Bool)
(declare-fun inv_main16 (Heap Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main24 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main25 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main28 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main29 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main34 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main36 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main37 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main42 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main44 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main45 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main47 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main50 (Heap Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main51 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main56 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main58 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main59 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main62 (Heap Addr Addr Addr Addr) Bool)
(declare-fun inv_main8 (Heap Addr Addr) Bool)
(declare-fun inv_main9 (Heap Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main59 var4 var3 var2 var1) (and (and (is-O_sl (read var4 var2)) (is-O_sl_item (read var4 (head (getsl (read var4 var2)))))) (= var0 (n1 (getsl_item (read var4 (head (getsl (read var4 var2)))))))))) (inv_main62 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Int) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (inv_main37 var14 var13 var12 var11 var10 var9 var8) (and (not (= var7 0)) (and (and (not (= var6 0)) (is-O_sl_item (read var14 var10))) (and (and (and (and (and (and (= var5 var14) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 var9)) (or (and (not (= var8 (n2 (getsl_item (read var14 var10))))) (= var6 1)) (and (= var8 (n2 (getsl_item (read var14 var10)))) (= var6 0)))))))) (inv_main36 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main25 var6 var5 var4 var3 var2 var1) (and (is-O_sl_item (read var6 var2)) (= var0 (n2 (getsl_item (read var6 var2))))))) (inv_main29 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main10 var3 var2 var1) (and (and (is-O_sl (read var3 var2)) (is-O_sl (read var3 var2))) (= var0 (write var3 var2 (O_sl (sl (head (getsl (read var3 var2))) var1))))))) (inv_main9 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main42 var6 var5 var4 var3 var2 var1) (and (is-O_sl_item (read var6 var3)) (= var0 (n1 (getsl_item (read var6 var3))))))) (inv_main45 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Heap)) (or (not (and (inv_main11 var3 var2) (and (and (and (and (is-O_sl (read var3 var2)) (is-O_sl_item (read var3 (tail (getsl (read var3 var2)))))) (is-O_sl_item (read var3 (tail (getsl (read var3 var2)))))) (= var1 (write var3 (tail (getsl (read var3 var2))) (O_sl_item (sl_item nullAddr (n2 (getsl_item (read var3 (tail (getsl (read var3 var2))))))))))) (= var0 nullAddr)))) (inv_main15 var1 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 sl_item) (var13 Heap) (var14 Heap) (var15 Addr) (var16 Addr) (var17 Addr) (var18 Addr) (var19 Addr) (var20 Addr) (var21 Heap)) (or (not (and (inv_main37 var21 var20 var19 var18 var17 var16 var15) (and (and (and (and (and (and (and (= var14 (newHeap (alloc var13 (O_sl_item var12)))) (= var11 var10)) (= var9 var8)) (= var7 var6)) (= var5 var4)) (= var3 var2)) (= var1 (newAddr (alloc var13 (O_sl_item var12))))) (and (and (= var0 0) (is-O_sl_item (read var21 var17))) (and (and (and (and (and (and (= var13 var21) (= var10 var20)) (= var8 var19)) (= var6 var18)) (= var4 var17)) (= var2 var16)) (or (and (not (= var15 (n2 (getsl_item (read var21 var17))))) (= var0 1)) (and (= var15 (n2 (getsl_item (read var21 var17)))) (= var0 0)))))))) (inv_main42 var14 var11 var9 var7 var5 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 sl_item) (var14 Heap) (var15 Heap) (var16 Addr) (var17 Addr) (var18 Addr) (var19 Addr) (var20 Addr) (var21 Addr) (var22 Heap)) (or (not (and (inv_main37 var22 var21 var20 var19 var18 var17 var16) (and (and (and (and (and (and (and (= var15 (newHeap (alloc var14 (O_sl_item var13)))) (= var12 var11)) (= var10 var9)) (= var8 var7)) (= var6 var5)) (= var4 var3)) (= var2 (newAddr (alloc var14 (O_sl_item var13))))) (and (= var1 0) (and (and (not (= var0 0)) (is-O_sl_item (read var22 var18))) (and (and (and (and (and (and (= var14 var22) (= var11 var21)) (= var9 var20)) (= var7 var19)) (= var5 var18)) (= var3 var17)) (or (and (not (= var16 (n2 (getsl_item (read var22 var18))))) (= var0 1)) (and (= var16 (n2 (getsl_item (read var22 var18)))) (= var0 0))))))))) (inv_main42 var15 var12 var10 var8 var6 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Int) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (inv_main29 var14 var13 var12 var11 var10 var9 var8) (and (not (= var7 0)) (and (and (not (= var6 0)) (is-O_sl (read var14 var12))) (and (and (and (and (and (and (= var5 var14) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 var9)) (or (and (not (= var8 (tail (getsl (read var14 var12))))) (= var6 1)) (and (= var8 (tail (getsl (read var14 var12)))) (= var6 0)))))))) (inv_main28 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Addr) (var5 Heap)) (or (not (and (inv_main16 var5 var4) (not (= var3 0)))) (inv_main24 var5 var4 var4 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Heap)) (or (not (and (inv_main44 var12 var11 var10 var9 var8 var7) (and (not (= var6 0)) (and (and (is-O_sl_item (read var12 var9)) (is-O_sl_item (read var12 var9))) (and (and (and (and (and (= var5 (write var12 var9 (O_sl_item (sl_item var7 (n2 (getsl_item (read var12 var9))))))) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7)))))) (inv_main47 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main15 var4 var3 var2) (and (and (and (is-O_sl (read var4 var3)) (is-O_sl_item (read var4 (tail (getsl (read var4 var3)))))) (is-O_sl_item (read var4 (tail (getsl (read var4 var3)))))) (and (= var1 (write var4 (tail (getsl (read var4 var3))) (O_sl_item (sl_item (n1 (getsl_item (read var4 (tail (getsl (read var4 var3)))))) var2)))) (= var0 var3))))) (inv_main16 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main50 var8 var7 var6 var5 var4 var3) (and (and (is-O_sl_item (read var8 var4)) (is-O_sl_item (read var8 var4))) (and (and (= var2 (write var8 var4 (O_sl_item (sl_item (n1 (getsl_item (read var8 var4))) var3)))) (= var1 var7)) (= var0 var6))))) (inv_main16 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Heap)) (or (not (and (inv_main44 var12 var11 var10 var9 var8 var7) (and (= var6 0) (and (and (is-O_sl_item (read var12 var9)) (is-O_sl_item (read var12 var9))) (and (and (and (and (and (= var5 (write var12 var9 (O_sl_item (sl_item var7 (n2 (getsl_item (read var12 var9))))))) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7)))))) (inv_main16 var5 var4))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main9 var2 var1) (and (is-O_sl (read var2 var1)) (= var0 (tail (getsl (read var2 var1))))))) (inv_main12 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main56 var3 var2 var1 var0) (and (is-O_sl (read var3 var1)) (not (= (head (getsl (read var3 var1))) nullAddr))))) (inv_main58 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (inv_main62 var9 var8 var7 var6 var5) (and (and (and (is-O_sl (read var9 var7)) (is-O_sl (read var9 var7))) (and (and (and (= var4 (write var9 var7 (O_sl (sl var5 (tail (getsl (read var9 var7))))))) (= var3 var8)) (= var2 var7)) (= var1 var6))) (= var0 (write var4 var1 defObj))))) (inv_main56 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap)) (or (not (and (inv_main16 var3 var2) (= var1 0))) (inv_main56 var3 var2 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main12 var3 var2 var1) (and (and (and (is-O_sl (read var3 var2)) (is-O_sl_item (read var3 (head (getsl (read var3 var2)))))) (is-O_sl_item (read var3 (head (getsl (read var3 var2)))))) (= var0 (write var3 (head (getsl (read var3 var2))) (O_sl_item (sl_item var1 (n2 (getsl_item (read var3 (head (getsl (read var3 var2))))))))))))) (inv_main13 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Heap)) (or (not (and (inv_main24 var12 var11 var10 var9 var8 var7) (and (is-O_sl (read var12 var10)) (and (and (and (and (and (and (= var6 var12) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 (head (getsl (read var12 var10)))))))) (inv_main25 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Heap)) (or (not (and (inv_main28 var12 var11 var10 var9 var8 var7) (and (is-O_sl_item (read var12 var8)) (and (and (and (and (and (and (= var6 var12) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 (n2 (getsl_item (read var12 var8)))))))) (inv_main25 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main47 var6 var5 var4 var3 var2 var1) (and (is-O_sl_item (read var6 var2)) (= var0 (n2 (getsl_item (read var6 var2))))))) (inv_main51 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 sl_item) (var2 Heap) (var3 Addr) (var4 sl) (var5 Heap) (var6 Heap)) (or (not (and (inv_main2 var6) (and (and (and (= var5 (newHeap (alloc var6 (O_sl var4)))) (= var3 (newAddr (alloc var6 (O_sl var4))))) (= var2 (newHeap (alloc var5 (O_sl_item var1))))) (= var0 (newAddr (alloc var5 (O_sl_item var1))))))) (inv_main8 var2 var3 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main34 var6 var5 var4 var3 var2 var1) (and (is-O_sl_item (read var6 var3)) (= var0 (n1 (getsl_item (read var6 var3))))))) (inv_main37 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 sl_item) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main8 var7 var6 var5) (and (and (and (and (is-O_sl (read var7 var6)) (is-O_sl (read var7 var6))) (and (= var4 (write var7 var6 (O_sl (sl var5 (tail (getsl (read var7 var6))))))) (= var3 var6))) (= var2 (newHeap (alloc var4 (O_sl_item var1))))) (= var0 (newAddr (alloc var4 (O_sl_item var1))))))) (inv_main10 var2 var3 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main13 var3 var2 var1) (and (and (and (is-O_sl (read var3 var2)) (is-O_sl_item (read var3 (head (getsl (read var3 var2)))))) (is-O_sl_item (read var3 (head (getsl (read var3 var2)))))) (= var0 (write var3 (head (getsl (read var3 var2))) (O_sl_item (sl_item (n1 (getsl_item (read var3 (head (getsl (read var3 var2)))))) var1))))))) (inv_main11 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main58 var8 var7 var6 var5) (and (is-O_sl (read var8 var6)) (and (and (and (and (= var4 var8) (= var3 var7)) (= var2 var6)) (= var1 var5)) (= var0 (head (getsl (read var8 var6)))))))) (inv_main59 var4 var3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main45 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_sl_item (read var7 var2)) (is-O_sl_item (read var7 var2))) (= var0 (write var7 var2 (O_sl_item (sl_item var1 (n2 (getsl_item (read var7 var2)))))))))) (inv_main44 var0 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main51 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_sl_item (read var7 var2)) (is-O_sl_item (read var7 var2))) (= var0 (write var7 var2 (O_sl_item (sl_item (n1 (getsl_item (read var7 var2))) var1))))))) (inv_main50 var0 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Heap)) (or (not (and (inv_main36 var12 var11 var10 var9 var8 var7) (and (is-O_sl_item (read var12 var9)) (and (and (and (and (and (and (= var6 var12) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)) (= var0 (n1 (getsl_item (read var12 var9)))))))) (inv_main34 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Heap)) (or (not (and (inv_main29 var13 var12 var11 var10 var9 var8 var7) (and (and (= var6 0) (is-O_sl (read var13 var11))) (and (and (and (and (and (and (= var5 var13) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8)) (or (and (not (= var7 (tail (getsl (read var13 var11))))) (= var6 1)) (and (= var7 (tail (getsl (read var13 var11)))) (= var6 0))))))) (inv_main34 var5 var4 var3 var1 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Int) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (inv_main29 var14 var13 var12 var11 var10 var9 var8) (and (= var7 0) (and (and (not (= var6 0)) (is-O_sl (read var14 var12))) (and (and (and (and (and (and (= var5 var14) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 var9)) (or (and (not (= var8 (tail (getsl (read var14 var12))))) (= var6 1)) (and (= var8 (tail (getsl (read var14 var12)))) (= var6 0)))))))) (inv_main34 var5 var4 var3 var1 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (not (is-O_sl (read var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (and (is-O_sl (read var2 var1)) (not (is-O_sl (read var2 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main10 var2 var1 var0) (not (is-O_sl (read var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main10 var2 var1 var0) (and (is-O_sl (read var2 var1)) (not (is-O_sl (read var2 var1))))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main9 var1 var0) (not (is-O_sl (read var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (not (is-O_sl (read var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (and (is-O_sl (read var2 var1)) (not (is-O_sl_item (read var2 (head (getsl (read var2 var1)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (and (and (is-O_sl (read var2 var1)) (is-O_sl_item (read var2 (head (getsl (read var2 var1)))))) (not (is-O_sl_item (read var2 (head (getsl (read var2 var1)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (not (is-O_sl (read var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (and (is-O_sl (read var2 var1)) (not (is-O_sl_item (read var2 (head (getsl (read var2 var1)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (and (and (is-O_sl (read var2 var1)) (is-O_sl_item (read var2 (head (getsl (read var2 var1)))))) (not (is-O_sl_item (read var2 (head (getsl (read var2 var1)))))))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main11 var1 var0) (not (is-O_sl (read var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main11 var1 var0) (and (is-O_sl (read var1 var0)) (not (is-O_sl_item (read var1 (tail (getsl (read var1 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main11 var1 var0) (and (and (is-O_sl (read var1 var0)) (is-O_sl_item (read var1 (tail (getsl (read var1 var0)))))) (not (is-O_sl_item (read var1 (tail (getsl (read var1 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main15 var2 var1 var0) (not (is-O_sl (read var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main15 var2 var1 var0) (and (is-O_sl (read var2 var1)) (not (is-O_sl_item (read var2 (tail (getsl (read var2 var1)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main15 var2 var1 var0) (and (and (is-O_sl (read var2 var1)) (is-O_sl_item (read var2 (tail (getsl (read var2 var1)))))) (not (is-O_sl_item (read var2 (tail (getsl (read var2 var1)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main24 var5 var4 var3 var2 var1 var0) (not (is-O_sl (read var5 var3)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main25 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl (read var6 var4)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main28 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main34 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var5 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main37 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var6 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main36 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var5 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main42 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var5 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main45 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main45 var6 var5 var4 var3 var2 var1 var0) (and (is-O_sl_item (read var6 var1)) (not (is-O_sl_item (read var6 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main44 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var5 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main44 var5 var4 var3 var2 var1 var0) (and (is-O_sl_item (read var5 var2)) (not (is-O_sl_item (read var5 var2))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main47 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main51 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main51 var6 var5 var4 var3 var2 var1 var0) (and (is-O_sl_item (read var6 var1)) (not (is-O_sl_item (read var6 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main50 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (read var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (not (and (inv_main50 var5 var4 var3 var2 var1 var0) (and (is-O_sl_item (read var5 var1)) (not (is-O_sl_item (read var5 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main56 var3 var2 var1 var0) (not (is-O_sl (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main58 var3 var2 var1 var0) (not (is-O_sl (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main59 var3 var2 var1 var0) (not (is-O_sl (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main59 var3 var2 var1 var0) (and (is-O_sl (read var3 var1)) (not (is-O_sl_item (read var3 (head (getsl (read var3 var1)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main62 var4 var3 var2 var1 var0) (not (is-O_sl (read var4 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main62 var4 var3 var2 var1 var0) (and (is-O_sl (read var4 var2)) (not (is-O_sl (read var4 var2))))))))
(check-sat)
