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
(declare-fun inv_main10 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main15 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main17 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main4 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main7 (Heap Int Int Int AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Heap)) (or (not (and (and (and (= var9 emptyHeap) (= var8 1000000)) (and (and (and (and (= var7 (newBatchHeap (batchAlloc emptyHeap (O_Int var6) var8))) (= var5 var8)) (= var4 var3)) (= var2 0)) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var6) var8))))) (= var0 4))) (inv_main4 var7 var5 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main4 var6 var5 var4 var3 var2 var1) (and (<= 0 (+ var5 (- 1))) (= var0 0)))) (inv_main7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Int) (var14 Int)) (or (not (and (inv_main10 var12 var11 var10 var9 var8 var7) (and (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (is-O_Int (read var12 (nthAddrRange var8 var10))) (is-O_Int (read var12 (nthAddrRange var8 var10))))) (and (and (and (and (and (and (and (and (and (and (or (and (<= 0 var7) (<= 0 (+ (+ var7 (* (- 1) var13)) (- 1)))) (and (not (<= 0 var7)) (<= 0 (+ (+ (* (- 1) var7) (* (- 1) var13)) (- 1))))) (or (and (<= 0 var7) (<= 0 (+ (+ var7 (* 1 var13)) (- 1)))) (and (not (<= 0 var7)) (<= 0 (+ (+ (* (- 1) var7) (* 1 var13)) (- 1)))))) (or (not (<= 0 (+ var13 (- 1)))) (<= 0 (+ var10 (- 1))))) (or (not (<= 0 (+ (* (- 1) var13) (- 1)))) (<= 0 (+ (* (- 1) var10) (- 1))))) (= var10 (+ (* var14 var7) var13))) (= var4 (write var12 (nthAddrRange var8 var10) (O_Int var13)))) (= var6 var11)) (= var5 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7))) (= var0 (+ var5 1))))) (inv_main7 var4 var6 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Int)) (or (not (and (inv_main7 var12 var11 var10 var9 var8 var7) (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (and (not (or (not (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ var6 (* (- 2) var13)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ var6 (* (- 2) var13)))) (- 1)))) (or (not (<= 0 (+ (+ var6 (* (- 2) var13)) (- 1)))) (<= 0 (+ var6 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var6 (* (- 2) var13))) (- 1)))) (<= 0 (+ (* (- 1) var6) (- 1)))))) (<= 0 (+ (+ var5 (* (- 1) var13)) (- 1))))) (and (is-O_Int (read var12 (nthAddrRange var8 var10))) (is-O_Int (read var12 (nthAddrRange var8 var10))))) (and (and (and (and (and (= var4 (write var12 (nthAddrRange var8 var10) (O_Int (+ var10 1)))) (= var6 var11)) (= var5 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)))) (= var0 (+ var5 1))))) (inv_main7 var4 var6 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main17 var6 var5 var4 var3 var2 var1) (and (<= 0 (+ (+ var5 (* (- 1) (+ var4 1))) (- 1))) (= var0 (+ var4 1))))) (inv_main15 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main4 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var5 (- 1))) (not (<= 0 (+ var5 (- 1))))) (= var0 0)))) (inv_main15 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Int) (var14 Int)) (or (not (and (inv_main10 var12 var11 var10 var9 var8 var7) (and (and (<= 0 (+ var6 (- 1))) (and (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (is-O_Int (read var12 (nthAddrRange var8 var10))) (is-O_Int (read var12 (nthAddrRange var8 var10))))) (and (and (and (and (and (and (and (and (and (and (or (and (<= 0 var7) (<= 0 (+ (+ var7 (* (- 1) var13)) (- 1)))) (and (not (<= 0 var7)) (<= 0 (+ (+ (* (- 1) var7) (* (- 1) var13)) (- 1))))) (or (and (<= 0 var7) (<= 0 (+ (+ var7 (* 1 var13)) (- 1)))) (and (not (<= 0 var7)) (<= 0 (+ (+ (* (- 1) var7) (* 1 var13)) (- 1)))))) (or (not (<= 0 (+ var13 (- 1)))) (<= 0 (+ var10 (- 1))))) (or (not (<= 0 (+ (* (- 1) var13) (- 1)))) (<= 0 (+ (* (- 1) var10) (- 1))))) (= var10 (+ (* var14 var7) var13))) (= var4 (write var12 (nthAddrRange var8 var10) (O_Int var13)))) (= var6 var11)) (= var5 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7)))) (= var0 0)))) (inv_main15 var4 var6 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap) (var13 Int)) (or (not (and (inv_main7 var12 var11 var10 var9 var8 var7) (and (and (<= 0 (+ var6 (- 1))) (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (and (not (or (not (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ var6 (* (- 2) var13)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ var6 (* (- 2) var13)))) (- 1)))) (or (not (<= 0 (+ (+ var6 (* (- 2) var13)) (- 1)))) (<= 0 (+ var6 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var6 (* (- 2) var13))) (- 1)))) (<= 0 (+ (* (- 1) var6) (- 1)))))) (<= 0 (+ (+ var5 (* (- 1) var13)) (- 1))))) (and (is-O_Int (read var12 (nthAddrRange var8 var10))) (is-O_Int (read var12 (nthAddrRange var8 var10))))) (and (and (and (and (and (= var4 (write var12 (nthAddrRange var8 var10) (O_Int (+ var10 1)))) (= var6 var11)) (= var5 var10)) (= var3 var9)) (= var2 var8)) (= var1 var7))))) (= var0 0)))) (inv_main15 var4 var6 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Int) (var10 Int) (var11 Heap) (var12 Int)) (or (not (and (inv_main7 var11 var10 var9 var8 var7 var6) (and (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ var4 (* (- 2) var12)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ var4 (* (- 2) var12)))) (- 1)))) (or (not (<= 0 (+ (+ var4 (* (- 2) var12)) (- 1)))) (<= 0 (+ var4 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var4 (* (- 2) var12))) (- 1)))) (<= 0 (+ (* (- 1) var4) (- 1))))) (<= 0 (+ (+ var5 (* (- 1) var12)) (- 1)))) (and (is-O_Int (read var11 (nthAddrRange var7 var9))) (is-O_Int (read var11 (nthAddrRange var7 var9))))) (and (and (and (and (and (= var3 (write var11 (nthAddrRange var7 var9) (O_Int (+ var9 1)))) (= var4 var10)) (= var5 var9)) (= var2 var8)) (= var1 var7)) (= var0 var6))))) (inv_main10 var3 var4 var5 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main15 var13 var12 var11 var10 var9 var8) (and (and (and (= var7 0) (is-O_Int (read var13 (nthAddrRange var9 var11)))) (and (and (and (and (and (and (= var6 var13) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var7 (getInt (read var13 (nthAddrRange var9 var11)))))) (= var0 (+ var3 1))))) (inv_main17 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (inv_main15 var12 var11 var10 var9 var8 var7) (and (and (not (= var6 0)) (is-O_Int (read var12 (nthAddrRange var8 var10)))) (and (and (and (and (and (and (= var5 var12) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7)) (= var6 (getInt (read var12 (nthAddrRange var8 var10)))))))) (inv_main17 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main7 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main7 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var3))) (not (within var1 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main7 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var3))) (not (is-O_Int (read var5 (nthAddrRange var1 var3)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main10 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main10 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var3))) (not (within var1 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main10 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var3))) (not (is-O_Int (read var5 (nthAddrRange var1 var3)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main15 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main15 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var3))) (not (within var1 (nthAddrRange var1 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (or (not (and (and (and (<= 0 (+ (+ 8 (* (- 1) (+ var4 (* (- 8) var6)))) (- 1))) (<= 0 (+ (+ 8 (* 1 (+ var4 (* (- 8) var6)))) (- 1)))) (or (not (<= 0 (+ (+ var4 (* (- 8) var6)) (- 1)))) (<= 0 (+ var4 (- 1))))) (or (not (<= 0 (+ (* (- 1) (+ var4 (* (- 8) var6))) (- 1)))) (<= 0 (+ (* (- 1) var4) (- 1)))))) (<= 0 (+ (+ var6 (* (- 1) var2)) (- 1)))))))))
(check-sat)
