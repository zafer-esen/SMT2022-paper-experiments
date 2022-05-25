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
(declare-fun inv_main14 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main16 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main18 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main19 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main22 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main24 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main28 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main32 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main8 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main9 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 AddrRange) (var11 Int) (var12 Heap) (var13 Heap)) (or (not (and (and (and (and (= var13 emptyHeap) (and (= var12 (newBatchHeap (batchAlloc emptyHeap (O_Int var11) 100000))) (= var10 (newAddrRange (batchAlloc emptyHeap (O_Int var11) 100000))))) (and (and (and (and (and (= var9 (newBatchHeap (batchAlloc emptyHeap (O_Int var8) 100000))) (= var7 var10)) (= var6 0)) (= var5 0)) (= var4 0)) (= var3 (newAddrRange (batchAlloc emptyHeap (O_Int var8) 100000))))) (= var2 (newBatchHeap (batchAlloc emptyHeap (O_Int var1) 100000)))) (= var0 (newAddrRange (batchAlloc emptyHeap (O_Int var1) 100000))))) (inv_main8 var2 var7 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var5 (* (- 1) (+ var1 1))) (- 1))) (is-O_Int (read var8 (nthAddrRange var3 var1)))) (= var0 (+ var1 1))))) (inv_main28 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main9 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var4 (- 1))) (not (<= 0 (+ (+ 100000 (* (- 1) var5)) (- 1))))) (= var0 0)))) (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Heap)) (or (not (and (inv_main16 var14 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 var7)) (is-O_Int (read var14 (nthAddrRange var13 var12)))) (and (and (and (and (and (and (and (= var6 var14) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8)) (= var7 (getInt (read var14 (nthAddrRange var13 var12)))))))) (inv_main19 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Heap)) (or (not (and (inv_main14 var16 var15 var14 var13 var12 var11 var10 var9) (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var8 1))) (- 1)))) (and (and (is-O_Int (read var16 (nthAddrRange var15 var9))) (is-O_Int (read var16 (nthAddrRange var15 var9)))) (and (and (and (and (and (and (and (= var7 (write var16 (nthAddrRange var15 var9) (O_Int var6))) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var0 var10)) (= var8 var9)))))) (inv_main9 var7 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Heap)) (or (not (and (inv_main22 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (and (and (is-O_Int (read var16 (nthAddrRange var11 var13))) (is-O_Int (read var16 (nthAddrRange var11 var13)))) (and (and (and (and (and (and (= var8 (write var16 (nthAddrRange var11 var13) (O_Int var9))) (= var7 var15)) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10))) (= var1 (+ var6 1))) (= var0 (+ var5 1))))) (inv_main9 var8 var7 var1 var0 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Heap)) (or (not (and (inv_main24 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (and (and (is-O_Int (read var16 (nthAddrRange var10 var12))) (is-O_Int (read var16 (nthAddrRange var10 var12)))) (and (and (and (and (and (and (= var8 (write var16 (nthAddrRange var10 var12) (O_Int var9))) (= var7 var15)) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10))) (= var1 (+ var6 1))) (= var0 (+ var4 1))))) (inv_main9 var8 var7 var1 var5 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main19 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (= var0 (getInt (read var7 (nthAddrRange var6 var5))))))) (inv_main24 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main8 var7 var6 var5 var4 var3 var2 var1) (= var0 0))) (inv_main14 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 AddrRange) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Int) (var16 AddrRange) (var17 Heap)) (or (not (and (inv_main14 var17 var16 var15 var14 var13 var12 var11 var10) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_Int (read var17 (nthAddrRange var16 var10))) (is-O_Int (read var17 (nthAddrRange var16 var10)))) (and (and (and (and (and (and (and (= var8 (write var17 (nthAddrRange var16 var10) (O_Int var7))) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var9 var10)))) (= var0 (+ var9 1))))) (inv_main14 var8 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main9 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ 100000 (* (- 1) var4)) (- 1))))) (inv_main16 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main18 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (= var0 (getInt (read var7 (nthAddrRange var6 var5))))))) (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Heap)) (or (not (and (inv_main16 var14 var13 var12 var11 var10 var9 var8) (and (and (<= 0 var7) (is-O_Int (read var14 (nthAddrRange var13 var12)))) (and (and (and (and (and (and (and (= var6 var14) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8)) (= var7 (getInt (read var14 (nthAddrRange var13 var12)))))))) (inv_main18 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main32 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var4 (* (- 1) (+ var1 1))) (- 1))) (is-O_Int (read var8 (nthAddrRange var2 var1)))) (= var0 (+ var1 1))))) (inv_main32 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var4 (- 1))) (and (not (<= 0 (+ (+ var5 (* (- 1) (+ var1 1))) (- 1)))) (is-O_Int (read var8 (nthAddrRange var3 var1))))) (= var0 0)))) (inv_main32 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main9 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var3 (- 1))) (and (not (<= 0 (+ var4 (- 1)))) (not (<= 0 (+ (+ 100000 (* (- 1) var5)) (- 1)))))) (= var0 0)))) (inv_main32 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main14 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var6 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main14 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var6 var0))) (not (within var6 (nthAddrRange var6 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main14 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var6 var0))) (not (is-O_Int (read var7 (nthAddrRange var6 var0)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main16 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main16 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main18 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main18 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var4))) (not (within var2 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var4))) (not (is-O_Int (read var7 (nthAddrRange var2 var4)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main24 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main24 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var1 var3))) (not (within var1 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main24 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var1 var3))) (not (is-O_Int (read var7 (nthAddrRange var1 var3)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var0))) (not (<= 0 (getInt (read var7 (nthAddrRange var2 var0))))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main32 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main32 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var1 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main32 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main32 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main32 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var1 var0))) (not (<= 0 (+ (* (- 1) (getInt (read var7 (nthAddrRange var1 var0)))) (- 1)))))))))
(check-sat)