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
(declare-fun inv_main11 (Heap AddrRange Int) Bool)
(declare-fun inv_main17 (Heap AddrRange Int) Bool)
(declare-fun inv_main2 (Heap AddrRange Int) Bool)
(declare-fun inv_main5 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and (and (= var2 (newBatchHeap (batchAlloc emptyHeap (O_Int 0) 10000000))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int 0) 10000000)))) (= var0 0))) (inv_main2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int)) (or (not (and (inv_main11 var6 var5 var4) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 10000000 (* (- 2) var7)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 10000000 (* (- 2) var7)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 10000000 (* (- 2) var7))) (- 1))))) (<= 0 (+ (+ var7 (* (- 1) (+ var3 1))) (- 1)))) (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var2 (write var6 (nthAddrRange var5 var4) (O_Int 10))) (= var1 var5)) (= var3 var4)))) (= var0 (+ var3 1))))) (inv_main11 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int)) (or (not (and (inv_main5 var6 var5 var4) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 10000000 (* (- 2) var7)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 10000000 (* (- 2) var7)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 10000000 (* (- 2) var7))) (- 1))))) (<= 0 (+ var7 (- 1)))) (and (not (<= 0 (+ (+ 10000000 (* (- 1) (+ var3 1))) (- 1)))) (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var2 (write var6 (nthAddrRange var5 var4) (O_Int 0))) (= var1 var5)) (= var3 var4))))) (= var0 0)))) (inv_main11 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main2 var3 var2 var1) (= var0 0))) (inv_main5 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main5 var6 var5 var4) (and (and (<= 0 (+ (+ 10000000 (* (- 1) (+ var3 1))) (- 1))) (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var2 (write var6 (nthAddrRange var5 var4) (O_Int 0))) (= var1 var5)) (= var3 var4)))) (= var0 (+ var3 1))))) (inv_main5 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int)) (or (not (and (inv_main17 var3 var2 var1) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 10000000 (* (- 2) var4)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 10000000 (* (- 2) var4)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 10000000 (* (- 2) var4))) (- 1))))) (<= 0 (+ (+ var4 (* (- 1) (+ var1 1))) (- 1)))) (is-O_Int (read var3 (nthAddrRange var2 var1)))) (= var0 (+ var1 1))))) (inv_main17 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int)) (or (not (and (inv_main11 var6 var5 var4) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 10000000 (* (- 2) var7)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 10000000 (* (- 2) var7)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 10000000 (* (- 2) var7))) (- 1))))) (<= 0 (+ var7 (- 1)))) (and (not (or (not (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 10000000 (* (- 2) var8)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 10000000 (* (- 2) var8)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 10000000 (* (- 2) var8))) (- 1)))))) (<= 0 (+ (+ var8 (* (- 1) (+ var3 1))) (- 1))))) (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var2 (write var6 (nthAddrRange var5 var4) (O_Int 10))) (= var1 var5)) (= var3 var4))))) (= var0 0)))) (inv_main17 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int)) (or (not (and (inv_main5 var6 var5 var4) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 10000000 (* (- 2) var7)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 10000000 (* (- 2) var7)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 10000000 (* (- 2) var7))) (- 1))))) (<= 0 (+ var7 (- 1)))) (and (not (or (not (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 10000000 (* (- 2) var8)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 10000000 (* (- 2) var8)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 10000000 (* (- 2) var8))) (- 1)))))) (<= 0 (+ var8 (- 1))))) (and (not (<= 0 (+ (+ 10000000 (* (- 1) (+ var3 1))) (- 1)))) (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var2 (write var6 (nthAddrRange var5 var4) (O_Int 0))) (= var1 var5)) (= var3 var4)))))) (= var0 0)))) (inv_main17 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main5 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main5 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main5 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main17 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main17 var2 var1 var0) (not (within var1 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main17 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main17 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main17 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (= (getInt (read var2 (nthAddrRange var1 var0))) 10)))))))
(check-sat)
