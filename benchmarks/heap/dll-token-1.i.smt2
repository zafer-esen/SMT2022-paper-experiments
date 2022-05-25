(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
(declare-heap Heap Addr HeapObject
 defObj
 ((HeapObject 0) (TSLL 0)) (
  (
   (O_Int (getInt Int))
   (O_UInt (getUInt Int))
   (O_Addr (getAddr Addr))
   (O_TSLL (getTSLL TSLL))
   (defObj)
  )
  (
   (TSLL (next Addr) (prev Addr) (data Int))
  )
))
(declare-fun inv_main11 (Heap Addr Addr) Bool)
(declare-fun inv_main12 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main13 (Heap Addr Addr) Bool)
(declare-fun inv_main14 (Heap Addr Addr) Bool)
(declare-fun inv_main18 (Heap Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Addr Addr) Bool)
(declare-fun inv_main23 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main24 (Heap Addr Addr) Bool)
(declare-fun inv_main27 (Heap Addr Addr) Bool)
(declare-fun inv_main29 (Heap Addr Addr) Bool)
(declare-fun inv_main3 (Heap Addr) Bool)
(declare-fun inv_main32 (Heap Addr Addr) Bool)
(declare-fun inv_main33 (Heap Addr Addr) Bool)
(declare-fun inv_main34 (Heap Addr Addr) Bool)
(declare-fun inv_main36 (Heap Addr Addr) Bool)
(declare-fun inv_main4 (Heap Addr) Bool)
(declare-fun inv_main40 (Heap Addr Addr) Bool)
(declare-fun inv_main42 (Heap Addr Addr) Bool)
(declare-fun inv_main45 (Heap Addr Addr) Bool)
(declare-fun inv_main49 (Heap Addr Addr) Bool)
(declare-fun inv_main5 (Heap Addr) Bool)
(declare-fun inv_main52 (Heap Addr Addr) Bool)
(declare-fun inv_main53 (Heap Addr Addr) Bool)
(declare-fun inv_main55 (Heap Addr Addr) Bool)
(declare-fun inv_main58 (Heap Addr Addr) Bool)
(declare-fun inv_main60 (Heap Addr Addr) Bool)
(declare-fun inv_main8 (Heap Addr Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main52 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (= 1 (data (getTSLL (read var2 var0))))))) (inv_main53 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main32 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (= 1 (data (getTSLL (read var2 var0))))))) (inv_main40 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (inv_main3 var2 var1) (and (and (is-O_TSLL (read var2 var1)) (is-O_TSLL (read var2 var1))) (= var0 (write var2 var1 (O_TSLL (TSLL nullAddr (prev (getTSLL (read var2 var1))) (data (getTSLL (read var2 var1)))))))))) (inv_main4 var0 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (inv_main4 var2 var1) (and (and (is-O_TSLL (read var2 var1)) (is-O_TSLL (read var2 var1))) (= var0 (write var2 var1 (O_TSLL (TSLL (next (getTSLL (read var2 var1))) nullAddr (data (getTSLL (read var2 var1)))))))))) (inv_main5 var0 var1))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (inv_main14 var9 var8 var7) (and (and (and (not (= var6 0)) (and (and (not (= nullAddr var5)) (and (is-O_TSLL (read var9 var7)) (is-O_TSLL (read var9 var7)))) (and (and (= var4 (write var9 var7 (O_TSLL (TSLL (next (getTSLL (read var9 var7))) (prev (getTSLL (read var9 var7))) 0)))) (= var3 var8)) (= var5 var7)))) (= var2 (newHeap (alloc var4 (O_TSLL var1))))) (= var0 (newAddr (alloc var4 (O_TSLL var1))))))) (inv_main12 var2 var3 var5 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Heap)) (or (not (and (inv_main5 var7 var6) (and (and (and (and (not (= var5 0)) (and (is-O_TSLL (read var7 var6)) (is-O_TSLL (read var7 var6)))) (and (= var4 (write var7 var6 (O_TSLL (TSLL (next (getTSLL (read var7 var6))) (prev (getTSLL (read var7 var6))) 0)))) (= var3 var6))) (= var2 (newHeap (alloc var4 (O_TSLL var1))))) (= var0 (newAddr (alloc var4 (O_TSLL var1))))))) (inv_main12 var2 var3 var3 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main34 var6 var5 var4) (and (is-O_TSLL (read var6 var4)) (and (and (and (= var3 var6) (= var2 var5)) (= var1 var4)) (= var0 (next (getTSLL (read var6 var4)))))))) (inv_main27 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main24 var5 var4 var3) (and (not (= nullAddr var2)) (and (and (and (is-O_TSLL (read var5 var3)) (is-O_TSLL (read var5 (next (getTSLL (read var5 var3)))))) (is-O_TSLL (read var5 (next (getTSLL (read var5 var3)))))) (and (and (= var1 (write var5 (next (getTSLL (read var5 var3))) (O_TSLL (TSLL (next (getTSLL (read var5 (next (getTSLL (read var5 var3)))))) (prev (getTSLL (read var5 (next (getTSLL (read var5 var3)))))) 2)))) (= var2 var4)) (= var0 var3)))))) (inv_main27 var1 var2 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main52 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (= 1 (data (getTSLL (read var2 var0)))))))) (inv_main55 var2 var0 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main22 var3 var2 var1) (and (and (and (is-O_TSLL (read var3 var1)) (is-O_TSLL (read var3 (next (getTSLL (read var3 var1)))))) (is-O_TSLL (read var3 (next (getTSLL (read var3 var1)))))) (= var0 (write var3 (next (getTSLL (read var3 var1))) (O_TSLL (TSLL (next (getTSLL (read var3 (next (getTSLL (read var3 var1)))))) var1 (data (getTSLL (read var3 (next (getTSLL (read var3 var1))))))))))))) (inv_main24 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main23 var4 var3 var2 var1) (and (and (is-O_TSLL (read var4 var2)) (is-O_TSLL (read var4 var2))) (= var0 (write var4 var2 (O_TSLL (TSLL var1 (prev (getTSLL (read var4 var2))) (data (getTSLL (read var4 var2)))))))))) (inv_main22 var0 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main13 var6 var5 var4) (and (is-O_TSLL (read var6 var4)) (and (and (and (= var3 var6) (= var2 var5)) (= var1 var4)) (= var0 (next (getTSLL (read var6 var4)))))))) (inv_main14 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main14 var6 var5 var4) (and (= var3 0) (and (and (not (= nullAddr var2)) (and (is-O_TSLL (read var6 var4)) (is-O_TSLL (read var6 var4)))) (and (and (= var1 (write var6 var4 (O_TSLL (TSLL (next (getTSLL (read var6 var4))) (prev (getTSLL (read var6 var4))) 0)))) (= var0 var5)) (= var2 var4)))))) (inv_main8 var1 var0 var2))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (inv_main5 var4 var3) (and (and (= var2 0) (and (is-O_TSLL (read var4 var3)) (is-O_TSLL (read var4 var3)))) (and (= var1 (write var4 var3 (O_TSLL (TSLL (next (getTSLL (read var4 var3))) (prev (getTSLL (read var4 var3))) 0)))) (= var0 var3))))) (inv_main8 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main27 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (= 1 (data (getTSLL (read var2 var0)))))))) (inv_main33 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main45 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (= 2 (data (getTSLL (read var2 var0)))))))) (inv_main49 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (inv_main8 var8 var7 var6) (and (and (and (and (is-O_TSLL (read var8 var6)) (is-O_TSLL (read var8 var6))) (and (and (= var5 (write var8 var6 (O_TSLL (TSLL (next (getTSLL (read var8 var6))) (prev (getTSLL (read var8 var6))) 1)))) (= var4 var7)) (= var3 var6))) (= var2 (newHeap (alloc var5 (O_TSLL var1))))) (= var0 (newAddr (alloc var5 (O_TSLL var1))))))) (inv_main23 var2 var4 var3 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main12 var4 var3 var2 var1) (and (and (is-O_TSLL (read var4 var2)) (is-O_TSLL (read var4 var2))) (= var0 (write var4 var2 (O_TSLL (TSLL var1 (prev (getTSLL (read var4 var2))) (data (getTSLL (read var4 var2)))))))))) (inv_main11 var0 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main33 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (= 0 (data (getTSLL (read var2 var0))))))) (inv_main34 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main32 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (= 1 (data (getTSLL (read var2 var0)))))))) (inv_main42 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (inv_main40 var6 var5 var4) (and (is-O_TSLL (read var6 var4)) (and (and (and (= var3 var6) (= var2 var5)) (= var1 var4)) (= var0 (next (getTSLL (read var6 var4)))))))) (inv_main45 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main14 var5 var4 var3) (and (and (= nullAddr var2) (and (is-O_TSLL (read var5 var3)) (is-O_TSLL (read var5 var3)))) (and (and (= var1 (write var5 var3 (O_TSLL (TSLL (next (getTSLL (read var5 var3))) (prev (getTSLL (read var5 var3))) 0)))) (= var0 var4)) (= var2 var3))))) (inv_main18 var1 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main33 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (= 0 (data (getTSLL (read var2 var0)))))))) (inv_main36 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main53 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (= 1 (data (getTSLL (read var2 var0)))))))) (inv_main60 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main11 var3 var2 var1) (and (and (and (is-O_TSLL (read var3 var1)) (is-O_TSLL (read var3 (next (getTSLL (read var3 var1)))))) (is-O_TSLL (read var3 (next (getTSLL (read var3 var1)))))) (= var0 (write var3 (next (getTSLL (read var3 var1))) (O_TSLL (TSLL (next (getTSLL (read var3 (next (getTSLL (read var3 var1)))))) var1 (data (getTSLL (read var3 (next (getTSLL (read var3 var1))))))))))))) (inv_main13 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Heap)) (or (not (and (inv_main2 var3) (and (= var2 (newHeap (alloc var3 (O_TSLL var1)))) (= var0 (newAddr (alloc var3 (O_TSLL var1))))))) (inv_main3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main53 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (= 1 (data (getTSLL (read var2 var0))))))) (inv_main58 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main27 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (= 1 (data (getTSLL (read var2 var0))))))) (inv_main32 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main45 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (= 2 (data (getTSLL (read var2 var0))))))) (inv_main52 var2 var1 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (inv_main55 var7 var6 var5) (and (and (is-O_TSLL (read var7 var5)) (and (and (and (= var4 var7) (= var3 var6)) (= var2 var5)) (= var1 (next (getTSLL (read var7 var5)))))) (= var0 (write var4 var3 defObj))))) (inv_main52 var0 var3 var1))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (inv_main24 var5 var4 var3) (and (= nullAddr var2) (and (and (and (is-O_TSLL (read var5 var3)) (is-O_TSLL (read var5 (next (getTSLL (read var5 var3)))))) (is-O_TSLL (read var5 (next (getTSLL (read var5 var3)))))) (and (and (= var1 (write var5 (next (getTSLL (read var5 var3))) (O_TSLL (TSLL (next (getTSLL (read var5 (next (getTSLL (read var5 var3)))))) (prev (getTSLL (read var5 (next (getTSLL (read var5 var3)))))) 2)))) (= var2 var4)) (= var0 var3)))))) (inv_main29 var1 var2 var2))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main3 var1 var0) (not (is-O_TSLL (read var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main3 var1 var0) (and (is-O_TSLL (read var1 var0)) (not (is-O_TSLL (read var1 var0))))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main4 var1 var0) (not (is-O_TSLL (read var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main4 var1 var0) (and (is-O_TSLL (read var1 var0)) (not (is-O_TSLL (read var1 var0))))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main5 var1 var0) (not (is-O_TSLL (read var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main5 var1 var0) (and (is-O_TSLL (read var1 var0)) (not (is-O_TSLL (read var1 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main12 var3 var2 var1 var0) (not (is-O_TSLL (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main12 var3 var2 var1 var0) (and (is-O_TSLL (read var3 var1)) (not (is-O_TSLL (read var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (and (and (is-O_TSLL (read var2 var0)) (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))) (not (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main14 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main14 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (is-O_TSLL (read var2 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main18 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (is-O_TSLL (read var2 var0))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main23 var3 var2 var1 var0) (not (is-O_TSLL (read var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main23 var3 var2 var1 var0) (and (is-O_TSLL (read var3 var1)) (not (is-O_TSLL (read var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main22 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main22 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main22 var2 var1 var0) (and (and (is-O_TSLL (read var2 var0)) (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))) (not (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main24 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main24 var2 var1 var0) (and (is-O_TSLL (read var2 var0)) (not (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main24 var2 var1 var0) (and (and (is-O_TSLL (read var2 var0)) (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))) (not (is-O_TSLL (read var2 (next (getTSLL (read var2 var0)))))))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main29 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main27 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main33 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main36 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main34 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main32 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main42 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main40 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main45 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main49 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main52 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main55 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main53 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main60 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main58 var2 var1 var0) (not (is-O_TSLL (read var2 var0)))))))
(check-sat)
