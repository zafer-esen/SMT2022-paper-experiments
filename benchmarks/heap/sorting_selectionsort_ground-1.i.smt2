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
(declare-fun inv_main12 (Heap AddrRange Int Int Int Int) Bool)
(declare-fun inv_main17 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main19 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main23 (Heap AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main25 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main27 (Heap AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main28 (Heap AddrRange Int Int Int Int Int Int) Bool)
(declare-fun inv_main29 (Heap AddrRange Int Int Int Int Int Int Int) Bool)
(declare-fun inv_main31 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main35 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main39 (Heap AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main45 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main46 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main6 (Heap AddrRange Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Heap)) (or (not (and (and (= var6 emptyHeap) (and (= var5 (newBatchHeap (batchAlloc emptyHeap (O_Int var4) 100000))) (= var3 (newAddrRange (batchAlloc emptyHeap (O_Int var4) 100000))))) (= var2 0))) (inv_main6 var5 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main29 var9 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var9 (nthAddrRange var8 var3))) (is-O_Int (read var9 (nthAddrRange var8 var3)))) (= var0 (write var9 (nthAddrRange var8 var3) (O_Int var1)))))) (inv_main28 var0 var8 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Heap)) (or (not (and (inv_main28 var15 var14 var13 var12 var11 var10 var9 var8) (and (and (and (is-O_Int (read var15 (nthAddrRange var14 var13))) (is-O_Int (read var15 (nthAddrRange var14 var13)))) (and (and (and (and (and (and (= var7 (write var15 (nthAddrRange var14 var13) (O_Int var8))) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9))) (= var0 0)))) (inv_main31 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main17 var7 var6 var5 var4 var3 var2 var1) (and (and (= var1 var5) (not (<= 0 (+ (+ 100000 (* (- 1) var2)) (- 1))))) (= var0 0)))) (inv_main31 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main31 var8 var7 var6 var5 var4 var3 var2) (and (and (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (<= 0 (+ (+ var6 (* (- 1) var5)) (- 1)))) (= var1 (+ var5 1))) (= var0 (+ var5 1))))) (inv_main31 var8 var7 var6 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main35 var8 var7 var6 var5 var4 var3 var2) (and (and (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var4 1))) (- 1)))) (and (is-O_Int (read var8 (nthAddrRange var7 var5))) (is-O_Int (read var8 (nthAddrRange var7 var4))))) (= var1 (+ var5 1))) (= var0 (+ var4 1))))) (inv_main31 var8 var7 var6 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main46 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var5 (nthAddrRange var4 var2))) (is-O_Int (read var5 (nthAddrRange var4 var1)))) (= var0 (+ var1 1))))) (inv_main45 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main45 var6 var5 var4 var3 var2) (and (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var3 1))) (- 1))) (not (<= 0 (+ (+ 100000 (* (- 1) var2)) (- 1))))) (= var1 (+ var3 1))) (= var0 (+ (+ var3 1) 1))))) (inv_main45 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main39 var9 var8 var7 var6 var5 var4 var3) (and (and (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var7 1))) (- 1)))) (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var6 1))) (- 1)))) (and (is-O_Int (read var9 (nthAddrRange var8 var6))) (is-O_Int (read var9 (nthAddrRange var8 var7)))))) (= var2 (+ var7 1))) (= var1 0)) (= var0 1)))) (inv_main45 var9 var8 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main45 var4 var3 var2 var1 var0) (<= 0 (+ (+ 100000 (* (- 1) var0)) (- 1))))) (inv_main46 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main27 var8 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var8 (nthAddrRange var7 var6))) (= var0 (getInt (read var8 (nthAddrRange var7 var6))))))) (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var5 (* (- 1) (+ var4 1))) (- 1))) (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1)))) (= var0 (+ var4 1))))) (inv_main35 var7 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main35 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var5 (* (- 1) (+ var3 1))) (- 1))) (and (is-O_Int (read var7 (nthAddrRange var6 var4))) (is-O_Int (read var7 (nthAddrRange var6 var3))))) (= var0 (+ var3 1))))) (inv_main35 var7 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main17 var6 var5 var4 var3 var2 var1 var0) (and (not (= var0 var4)) (not (<= 0 (+ (+ 100000 (* (- 1) var1)) (- 1))))))) (inv_main25 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main19 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var7 (nthAddrRange var6 var2))) (= var0 (getInt (read var7 (nthAddrRange var6 var2))))))) (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main25 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var7 (nthAddrRange var6 var1))) (= var0 (getInt (read var7 (nthAddrRange var6 var1))))))) (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var8 (nthAddrRange var7 var2))) (<= 0 (+ (+ (getInt (read var8 (nthAddrRange var7 var2))) (* (- 1) var1)) (- 1)))) (= var0 (+ var3 1))))) (inv_main17 var8 var7 var6 var5 var4 var0 var3))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main23 var8 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var8 (nthAddrRange var7 var2))) (not (<= 0 (+ (+ (getInt (read var8 (nthAddrRange var7 var2))) (* (- 1) var1)) (- 1))))) (= var0 (+ var3 1))))) (inv_main17 var8 var7 var6 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Heap)) (or (not (and (inv_main39 var10 var9 var8 var7 var6 var5 var4) (and (and (and (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var8 1))) (- 1))) (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var7 1))) (- 1)))) (and (is-O_Int (read var10 (nthAddrRange var9 var7))) (is-O_Int (read var10 (nthAddrRange var9 var8)))))) (= var3 (+ var8 1))) (= var2 (+ var7 1))) (= var1 (+ (+ var8 1) 1))) (= var0 (+ var8 1))))) (inv_main17 var10 var9 var3 var2 var6 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Heap)) (or (not (and (inv_main12 var15 var14 var13 var12 var11 var10) (and (and (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var9 1))) (- 1)))) (and (and (is-O_Int (read var15 (nthAddrRange var14 var10))) (is-O_Int (read var15 (nthAddrRange var14 var10)))) (and (and (and (and (and (= var8 (write var15 (nthAddrRange var14 var10) (O_Int var7))) (= var6 var14)) (= var5 var13)) (= var4 var12)) (= var3 var11)) (= var9 var10)))) (= var2 0)) (= var1 1)) (= var0 0)))) (inv_main17 var8 var6 var2 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1) (and (not (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1)))) (= var0 0)))) (inv_main39 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main39 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1))) (and (is-O_Int (read var7 (nthAddrRange var6 var4))) (is-O_Int (read var7 (nthAddrRange var6 var5))))) (= var0 (+ var4 1))))) (inv_main39 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main17 var6 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ 100000 (* (- 1) var1)) (- 1))))) (inv_main19 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main6 var5 var4 var3 var2 var1) (= var0 0))) (inv_main12 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Heap)) (or (not (and (inv_main12 var13 var12 var11 var10 var9 var8) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var7 1))) (- 1))) (and (and (is-O_Int (read var13 (nthAddrRange var12 var8))) (is-O_Int (read var13 (nthAddrRange var12 var8)))) (and (and (and (and (and (= var6 (write var13 (nthAddrRange var12 var8) (O_Int var5))) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var7 var8)))) (= var0 (+ var7 1))))) (inv_main12 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (inv_main12 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (inv_main12 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var4 var0))) (not (within var4 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (not (and (inv_main12 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var4 var0))) (not (is-O_Int (read var5 (nthAddrRange var4 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var1))) (not (within var5 (nthAddrRange var5 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var6 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main23 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var6 var1))) (not (within var6 (nthAddrRange var6 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var0))) (not (within var5 (nthAddrRange var5 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main27 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (not (within var6 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (not (and (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var8 (nthAddrRange var7 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (not (and (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var7 var2))) (not (within var7 (nthAddrRange var7 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (not (and (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var8 (nthAddrRange var7 var2))) (not (is-O_Int (read var8 (nthAddrRange var7 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var7 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (not (within var6 (nthAddrRange var6 var5))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (not (is-O_Int (read var7 (nthAddrRange var6 var5)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (within var5 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (within var5 (nthAddrRange var5 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (not (within var5 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (not (is-O_Int (read var6 (nthAddrRange var5 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (is-O_Int (read var6 (nthAddrRange var5 var2)))) (not (within var5 (nthAddrRange var5 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (is-O_Int (read var6 (nthAddrRange var5 var2)))) (not (<= 0 (+ (getInt (read var6 (nthAddrRange var5 var2))) (* (- 1) (getInt (read var6 (nthAddrRange var5 var3))))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (within var5 (nthAddrRange var5 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (within var5 (nthAddrRange var5 var4)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (not (within var5 (nthAddrRange var5 var3))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (not (is-O_Int (read var6 (nthAddrRange var5 var4)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (not (within var5 (nthAddrRange var5 var4))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (not (and (inv_main39 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var5 var3))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (not (<= 0 (+ (getInt (read var6 (nthAddrRange var5 var3))) (* (- 1) (getInt (read var6 (nthAddrRange var5 var4))))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (within var3 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (within var3 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (not (within var3 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (not (is-O_Int (read var4 (nthAddrRange var3 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (is-O_Int (read var4 (nthAddrRange var3 var0)))) (not (within var3 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main46 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (is-O_Int (read var4 (nthAddrRange var3 var0)))) (not (<= 0 (+ (getInt (read var4 (nthAddrRange var3 var0))) (* (- 1) (getInt (read var4 (nthAddrRange var3 var1))))))))))))
(check-sat)