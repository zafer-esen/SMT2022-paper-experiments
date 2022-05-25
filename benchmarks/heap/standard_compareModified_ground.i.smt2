(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
(declare-heap Heap Addr HeapObject
 defObj
 ((HeapObject 0)) (
  (
   (O_Int (getInt Int))
   (O_UInt (getUInt Int))
   (O_Addr (getAddr Addr))
   (defObj)
  )
))
(declare-fun inv_main14 (Heap AddrRange AddrRange Int AddrRange Int Int) Bool)
(declare-fun inv_main15 (Heap AddrRange AddrRange Int AddrRange Int Int) Bool)
(declare-fun inv_main17 (Heap AddrRange AddrRange Int AddrRange Int) Bool)
(declare-fun inv_main18 (Heap AddrRange AddrRange Int AddrRange Int) Bool)
(declare-fun inv_main21 (Heap AddrRange AddrRange Int AddrRange Int Int) Bool)
(declare-fun inv_main23 (Heap AddrRange AddrRange Int AddrRange Int Int) Bool)
(declare-fun inv_main29 (Heap AddrRange AddrRange Int AddrRange Int Int) Bool)
(declare-fun inv_main33 (Heap AddrRange AddrRange Int AddrRange Int Int) Bool)
(declare-fun inv_main7 (Heap AddrRange AddrRange Int AddrRange Int) Bool)
(declare-fun inv_main8 (Heap AddrRange AddrRange Int AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 Int) (var13 Heap) (var14 Heap)) (or (not (and (and (and (and (= var14 emptyHeap) (and (= var13 (newBatchHeap (batchAlloc emptyHeap (O_Int var12) 100000))) (= var11 (newAddrRange (batchAlloc emptyHeap (O_Int var12) 100000))))) (and (and (= var10 (newBatchHeap (batchAlloc emptyHeap (O_Int var9) 100000))) (= var8 var11)) (= var7 (newAddrRange (batchAlloc emptyHeap (O_Int var9) 100000))))) (and (and (and (and (= var6 (newBatchHeap (batchAlloc emptyHeap (O_Int var5) 100000))) (= var4 var8)) (= var3 var7)) (= var2 0)) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var5) 100000))))) (= var0 1))) (inv_main7 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main29 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var1 1))) (- 1))) (and (is-O_Int (read var7 (nthAddrRange var6 var1))) (is-O_Int (read var7 (nthAddrRange var5 var1))))) (= var0 (+ var1 1))))) (inv_main29 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main8 var6 var5 var4 var3 var2 var1) (and (and (not (= var1 0)) (not (<= 0 (+ (+ 100000 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main29 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main7 var6 var5 var4 var3 var2 var1) (= var0 0))) (inv_main14 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Int) (var13 AddrRange) (var14 AddrRange) (var15 Heap)) (or (not (and (inv_main15 var15 var14 var13 var12 var11 var10 var9) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var8 1))) (- 1))) (and (and (is-O_Int (read var15 (nthAddrRange var13 var9))) (is-O_Int (read var15 (nthAddrRange var13 var9)))) (and (and (and (and (and (and (= var7 (write var15 (nthAddrRange var13 var9) (O_Int var6))) (= var5 var14)) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var8 var9)))) (= var0 (+ var8 1))))) (inv_main14 var7 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 AddrRange) (var13 AddrRange) (var14 Heap)) (or (not (and (inv_main15 var14 var13 var12 var11 var10 var9 var8) (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var7 1))) (- 1)))) (and (and (is-O_Int (read var14 (nthAddrRange var12 var8))) (is-O_Int (read var14 (nthAddrRange var12 var8)))) (and (and (and (and (and (and (= var6 (write var14 (nthAddrRange var12 var8) (O_Int var5))) (= var4 var13)) (= var3 var12)) (= var2 var11)) (= var1 var10)) (= var0 var9)) (= var7 var8)))))) (inv_main8 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (inv_main23 var13 var12 var11 var10 var9 var8 var7) (and (and (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (is-O_Int (read var13 (nthAddrRange var9 var10)))) (and (and (and (and (and (= var6 (write var13 (nthAddrRange var9 var10) (O_Int var7))) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 (+ var3 1))))) (inv_main8 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main33 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var1 1))) (- 1))) (and (is-O_Int (read var7 (nthAddrRange var6 var1))) (is-O_Int (read var7 (nthAddrRange var3 var1))))) (= var0 (+ var1 1))))) (inv_main33 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main29 var7 var6 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var1 1))) (- 1)))) (and (is-O_Int (read var7 (nthAddrRange var6 var1))) (is-O_Int (read var7 (nthAddrRange var5 var1))))) (= var0 0)))) (inv_main33 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main8 var6 var5 var4 var3 var2 var1) (and (and (= var1 0) (not (<= 0 (+ (+ 100000 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main33 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main18 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (= var0 (getInt (read var6 (nthAddrRange var5 var3))))))) (inv_main23 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main17 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (= var0 (getInt (read var6 (nthAddrRange var5 var3))))))) (inv_main21 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 AddrRange) (var13 AddrRange) (var14 Heap)) (or (not (and (inv_main14 var14 var13 var12 var11 var10 var9 var8) (and (and (is-O_Int (read var14 (nthAddrRange var13 var8))) (is-O_Int (read var14 (nthAddrRange var13 var8)))) (and (and (and (and (and (and (= var7 (write var14 (nthAddrRange var13 var8) (O_Int var6))) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8))))) (inv_main15 var7 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main21 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var7 (nthAddrRange var5 var4))) (not (= var1 (getInt (read var7 (nthAddrRange var5 var4)))))) (= var0 0)))) (inv_main18 var7 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main21 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var4 var3))) (= var0 (getInt (read var6 (nthAddrRange var4 var3))))))) (inv_main18 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main8 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ 100000 (* (- 1) var2)) (- 1))))) (inv_main17 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main14 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main14 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (not (within var5 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main14 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (not (is-O_Int (read var6 (nthAddrRange var5 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main15 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main15 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var4 var0))) (not (within var4 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main15 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var4 var0))) (not (is-O_Int (read var6 (nthAddrRange var4 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var4 var2))) (not (within var4 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main21 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var4 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main21 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var4 var3))) (not (within var4 (nthAddrRange var4 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main18 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main18 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var4 var2))) (not (within var4 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var2 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var2 var3))) (not (within var2 (nthAddrRange var2 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var2 var3))) (not (is-O_Int (read var6 (nthAddrRange var2 var3)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (not (within var5 (nthAddrRange var5 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (not (within var4 (nthAddrRange var4 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (not (within var5 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (not (is-O_Int (read var6 (nthAddrRange var4 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (is-O_Int (read var6 (nthAddrRange var4 var0)))) (not (within var4 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main29 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (is-O_Int (read var6 (nthAddrRange var4 var0)))) (not (= (getInt (read var6 (nthAddrRange var5 var0))) (getInt (read var6 (nthAddrRange var4 var0))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (not (within var5 (nthAddrRange var5 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (not (within var5 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (not (is-O_Int (read var6 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (is-O_Int (read var6 (nthAddrRange var2 var0)))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main33 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (is-O_Int (read var6 (nthAddrRange var2 var0)))) (not (= (getInt (read var6 (nthAddrRange var5 var0))) (getInt (read var6 (nthAddrRange var2 var0))))))))))
(check-sat)
