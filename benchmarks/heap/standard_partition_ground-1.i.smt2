(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status unsat)
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
(declare-fun inv_main11 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main12 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main14 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main18 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main19 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main21 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main23 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(declare-fun inv_main27 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main31 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main35 (Heap AddrRange Int Int Int AddrRange AddrRange Int) Bool)
(declare-fun inv_main8 (Heap AddrRange Int Int Int AddrRange AddrRange) Bool)
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Heap) (var10 AddrRange) (var11 Int) (var12 Heap) (var13 Heap)) (or (not (and (and (and (and (= var13 emptyHeap) (and (= var12 (newBatchHeap (batchAlloc emptyHeap (O_Int var11) 100000))) (= var10 (newAddrRange (batchAlloc emptyHeap (O_Int var11) 100000))))) (and (and (and (and (and (= var9 (newBatchHeap (batchAlloc emptyHeap (O_Int var8) 100000))) (= var7 var10)) (= var6 0)) (= var5 0)) (= var4 0)) (= var3 (newAddrRange (batchAlloc emptyHeap (O_Int var8) 100000))))) (= var2 (newBatchHeap (batchAlloc emptyHeap (O_Int var1) 100000)))) (= var0 (newAddrRange (batchAlloc emptyHeap (O_Int var1) 100000))))) (inv_main8 var2 var7 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main23 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (= var0 (getInt (read var7 (nthAddrRange var6 var5))))))) (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Heap)) (or (not (and (inv_main11 var14 var13 var12 var11 var10 var9 var8) (and (and (<= 0 var7) (is-O_Int (read var14 (nthAddrRange var13 var12)))) (and (and (and (and (and (and (and (= var6 var14) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8)) (= var7 (getInt (read var14 (nthAddrRange var13 var12)))))))) (inv_main14 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main8 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ 100000 (* (- 1) var4)) (- 1))))) (inv_main12 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main35 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var4 (* (- 1) (+ var1 1))) (- 1))) (is-O_Int (read var8 (nthAddrRange var2 var1)))) (= var0 (+ var1 1))))) (inv_main35 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main31 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var4 (- 1))) (and (not (<= 0 (+ (+ var5 (* (- 1) (+ var1 1))) (- 1)))) (is-O_Int (read var8 (nthAddrRange var3 var1))))) (= var0 0)))) (inv_main35 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main19 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var3 (- 1))) (and (not (<= 0 (+ var4 (- 1)))) (not (<= 0 (+ (+ 100000 (* (- 1) var5)) (- 1)))))) (= var0 0)))) (inv_main35 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Heap) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main12 var8 var7 var6 var5 var4 var3 var2) (and (and (is-O_Int (read var8 (nthAddrRange var7 var6))) (is-O_Int (read var8 (nthAddrRange var7 var6)))) (= var1 (write var8 (nthAddrRange var7 var6) (O_Int var0)))))) (inv_main11 var1 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main14 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (= var0 (getInt (read var7 (nthAddrRange var6 var5))))))) (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main31 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var5 (* (- 1) (+ var1 1))) (- 1))) (is-O_Int (read var8 (nthAddrRange var3 var1)))) (= var0 (+ var1 1))))) (inv_main31 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main19 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var4 (- 1))) (not (<= 0 (+ (+ 100000 (* (- 1) var5)) (- 1))))) (= var0 0)))) (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 AddrRange) (var14 Heap)) (or (not (and (inv_main21 var14 var13 var12 var11 var10 var9 var8) (and (and (<= 0 var7) (is-O_Int (read var14 (nthAddrRange var13 var12)))) (and (and (and (and (and (and (and (= var6 var14) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var0 var8)) (= var7 (getInt (read var14 (nthAddrRange var13 var12)))))))) (inv_main23 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main8 var7 var6 var5 var4 var3 var2 var1) (and (not (<= 0 (+ (+ 100000 (* (- 1) var5)) (- 1)))) (= var0 0)))) (inv_main19 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Heap)) (or (not (and (inv_main21 var15 var14 var13 var12 var11 var10 var9) (and (and (and (not (<= 0 var8)) (is-O_Int (read var15 (nthAddrRange var14 var13)))) (and (and (and (and (and (and (and (= var7 var15) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var8 (getInt (read var15 (nthAddrRange var14 var13)))))) (= var0 (+ var5 1))))) (inv_main19 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Heap)) (or (not (and (inv_main27 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (and (and (is-O_Int (read var16 (nthAddrRange var10 var12))) (is-O_Int (read var16 (nthAddrRange var10 var12)))) (and (and (and (and (and (and (= var8 (write var16 (nthAddrRange var10 var12) (O_Int var9))) (= var7 var15)) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10))) (= var1 (+ var6 1))) (= var0 (+ var4 1))))) (inv_main19 var8 var7 var1 var5 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Heap)) (or (not (and (inv_main11 var15 var14 var13 var12 var11 var10 var9) (and (and (and (not (<= 0 var8)) (is-O_Int (read var15 (nthAddrRange var14 var13)))) (and (and (and (and (and (and (and (= var7 var15) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var8 (getInt (read var15 (nthAddrRange var14 var13)))))) (= var0 (+ var5 1))))) (inv_main8 var7 var6 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Int) (var15 AddrRange) (var16 Heap)) (or (not (and (inv_main18 var16 var15 var14 var13 var12 var11 var10 var9) (and (and (and (and (is-O_Int (read var16 (nthAddrRange var11 var13))) (is-O_Int (read var16 (nthAddrRange var11 var13)))) (and (and (and (and (and (and (= var8 (write var16 (nthAddrRange var11 var13) (O_Int var9))) (= var7 var15)) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10))) (= var1 (+ var6 1))) (= var0 (+ var5 1))))) (inv_main8 var8 var7 var1 var0 var4 var3 var2))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ 100000 (* (- 1) var4)) (- 1))))) (inv_main21 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main12 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main12 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main12 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (is-O_Int (read var6 (nthAddrRange var5 var4)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main11 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main11 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main14 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main14 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var4))) (not (within var2 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main18 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var4))) (not (is-O_Int (read var7 (nthAddrRange var2 var4)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main21 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main21 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var1 var3))) (not (within var1 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var1 var3))) (not (is-O_Int (read var7 (nthAddrRange var1 var3)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var2 var0))) (not (<= 0 (getInt (read var7 (nthAddrRange var2 var0))))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main35 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main35 var7 var6 var5 var4 var3 var2 var1 var0) (not (within var1 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main35 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main35 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main35 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var1 var0))) (not (<= 0 (+ (* (- 1) (getInt (read var7 (nthAddrRange var1 var0)))) (- 1)))))))))
(check-sat)
