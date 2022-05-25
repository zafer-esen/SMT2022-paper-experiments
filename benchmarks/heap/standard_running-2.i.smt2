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
(declare-fun inv_main10 (Heap AddrRange AddrRange Int) Bool)
(declare-fun inv_main13 (Heap AddrRange AddrRange Int) Bool)
(declare-fun inv_main15 (Heap AddrRange AddrRange Int) Bool)
(declare-fun inv_main16 (Heap AddrRange AddrRange Int) Bool)
(declare-fun inv_main20 (Heap AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main21 (Heap AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main22 (Heap AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main25 (Heap AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main28 (Heap AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main31 (Heap AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main5 (Heap AddrRange AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 AddrRange) (var6 Int) (var7 Heap) (var8 Heap)) (or (not (and (and (and (= var8 emptyHeap) (and (= var7 (newBatchHeap (batchAlloc emptyHeap (O_Int var6) 100000))) (= var5 (newAddrRange (batchAlloc emptyHeap (O_Int var6) 100000))))) (and (and (= var4 (newBatchHeap (batchAlloc emptyHeap (O_Int var3) 100000))) (= var2 var5)) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var3) 100000))))) (= var0 0))) (inv_main5 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main10 var9 var8 var7 var6) (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var5 1))) (- 1)))) (and (and (is-O_Int (read var9 (nthAddrRange var8 var6))) (is-O_Int (read var9 (nthAddrRange var8 var6)))) (and (and (and (= var4 (write var9 (nthAddrRange var8 var6) (O_Int var3))) (= var2 var8)) (= var1 var7)) (= var5 var6)))) (= var0 0)))) (inv_main13 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main15 var8 var7 var6 var5) (and (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1))) (and (is-O_Int (read var8 (nthAddrRange var6 var5))) (is-O_Int (read var8 (nthAddrRange var6 var5))))) (and (and (and (= var3 (write var8 (nthAddrRange var6 var5) (O_Int 1))) (= var2 var7)) (= var1 var6)) (= var4 var5))) (= var0 (+ var4 1))))) (inv_main13 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main16 var8 var7 var6 var5) (and (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1))) (and (is-O_Int (read var8 (nthAddrRange var6 var5))) (is-O_Int (read var8 (nthAddrRange var6 var5))))) (and (and (and (= var3 (write var8 (nthAddrRange var6 var5) (O_Int 0))) (= var2 var7)) (= var1 var6)) (= var4 var5))) (= var0 (+ var4 1))))) (inv_main13 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main28 var5 var4 var3 var2 var1) (and (<= 0 (+ (+ 100000 (* (- 1) (+ var2 1))) (- 1))) (= var0 (+ var2 1))))) (inv_main21 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main15 var9 var8 var7 var6) (and (and (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var5 1))) (- 1)))) (and (is-O_Int (read var9 (nthAddrRange var7 var6))) (is-O_Int (read var9 (nthAddrRange var7 var6))))) (and (and (and (= var4 (write var9 (nthAddrRange var7 var6) (O_Int 1))) (= var3 var8)) (= var2 var7)) (= var5 var6))) (= var1 0)) (= var0 1)))) (inv_main21 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main16 var9 var8 var7 var6) (and (and (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var5 1))) (- 1)))) (and (is-O_Int (read var9 (nthAddrRange var7 var6))) (is-O_Int (read var9 (nthAddrRange var7 var6))))) (and (and (and (= var4 (write var9 (nthAddrRange var7 var6) (O_Int 0))) (= var3 var8)) (= var2 var7)) (= var5 var6))) (= var1 0)) (= var0 1)))) (inv_main21 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main21 var5 var4 var3 var2 var1) (and (is-O_Int (read var5 (nthAddrRange var4 var2))) (= var0 (getInt (read var5 (nthAddrRange var4 var2))))))) (inv_main25 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Heap)) (or (not (and (inv_main25 var12 var11 var10 var9 var8 var7) (and (and (not (= var6 0)) (and (and (<= 0 var7) (is-O_Int (read var12 (nthAddrRange var10 var9)))) (and (and (and (and (and (= var5 var12) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (or (and (= (getInt (read var12 (nthAddrRange var10 var9))) 0) (= var6 1)) (and (not (= (getInt (read var12 (nthAddrRange var10 var9))) 0)) (= var6 0)))))) (= var0 0)))) (inv_main22 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main25 var5 var4 var3 var2 var1 var0) (not (<= 0 var0)))) (inv_main22 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Heap)) (or (not (and (inv_main25 var11 var10 var9 var8 var7 var6) (and (= var5 0) (and (and (<= 0 var6) (is-O_Int (read var11 (nthAddrRange var9 var8)))) (and (and (and (and (and (= var4 var11) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7)) (or (and (= (getInt (read var11 (nthAddrRange var9 var8))) 0) (= var5 1)) (and (not (= (getInt (read var11 (nthAddrRange var9 var8))) 0)) (= var5 0)))))))) (inv_main22 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main13 var8 var7 var6 var5) (and (and (not (<= 0 var4)) (is-O_Int (read var8 (nthAddrRange var7 var5)))) (and (and (and (and (= var3 var8) (= var2 var7)) (= var1 var6)) (= var0 var5)) (= var4 (getInt (read var8 (nthAddrRange var7 var5)))))))) (inv_main16 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main22 var5 var4 var3 var2 var1) (and (is-O_Int (read var5 (nthAddrRange var4 var2))) (= var0 (getInt (read var5 (nthAddrRange var4 var2))))))) (inv_main31 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main5 var4 var3 var2 var1) (= var0 0))) (inv_main10 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main10 var9 var8 var7 var6) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var5 1))) (- 1))) (and (and (is-O_Int (read var9 (nthAddrRange var8 var6))) (is-O_Int (read var9 (nthAddrRange var8 var6)))) (and (and (and (= var4 (write var9 (nthAddrRange var8 var6) (O_Int var3))) (= var2 var8)) (= var1 var7)) (= var5 var6)))) (= var0 (+ var5 1))))) (inv_main10 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 Heap)) (or (not (and (inv_main31 var12 var11 var10 var9 var8 var7) (and (and (not (= var6 0)) (and (and (<= 0 (+ (* (- 1) var7) (- 1))) (is-O_Int (read var12 (nthAddrRange var10 var9)))) (and (and (and (and (and (= var5 var12) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var6 (getInt (read var12 (nthAddrRange var10 var9))))))) (= var0 0)))) (inv_main28 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main31 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (* (- 1) var0) (- 1)))))) (inv_main28 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Heap)) (or (not (and (inv_main31 var11 var10 var9 var8 var7 var6) (and (= var5 0) (and (and (<= 0 (+ (* (- 1) var6) (- 1))) (is-O_Int (read var11 (nthAddrRange var9 var8)))) (and (and (and (and (and (= var4 var11) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7)) (= var5 (getInt (read var11 (nthAddrRange var9 var8))))))))) (inv_main28 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main28 var5 var4 var3 var2 var1) (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var2 1))) (- 1)))) (= var0 (+ var2 1))))) (inv_main20 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main13 var8 var7 var6 var5) (and (and (<= 0 var4) (is-O_Int (read var8 (nthAddrRange var7 var5)))) (and (and (and (and (= var3 var8) (= var2 var7)) (= var1 var6)) (= var0 var5)) (= var4 (getInt (read var8 (nthAddrRange var7 var5)))))))) (inv_main15 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main10 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main10 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main10 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (is-O_Int (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main13 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main13 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main15 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main15 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main15 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var1 var0))) (not (is-O_Int (read var3 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main16 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main16 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main16 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var1 var0))) (not (is-O_Int (read var3 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main21 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main21 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (not (within var3 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main25 var5 var4 var3 var2 var1 var0) (and (<= 0 var0) (not (is-O_Int (read var5 (nthAddrRange var3 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main25 var5 var4 var3 var2 var1 var0) (and (and (<= 0 var0) (is-O_Int (read var5 (nthAddrRange var3 var2)))) (not (within var3 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main22 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main22 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (not (within var3 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main31 var5 var4 var3 var2 var1 var0) (and (<= 0 (+ (* (- 1) var0) (- 1))) (not (is-O_Int (read var5 (nthAddrRange var3 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main31 var5 var4 var3 var2 var1 var0) (and (and (<= 0 (+ (* (- 1) var0) (- 1))) (is-O_Int (read var5 (nthAddrRange var3 var2)))) (not (within var3 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main20 var4 var3 var2 var1 var0) (= var0 0)))))
(check-sat)
