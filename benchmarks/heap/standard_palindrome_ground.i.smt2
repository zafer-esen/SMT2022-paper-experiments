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
(declare-fun inv_main12 (Heap AddrRange Int) Bool)
(declare-fun inv_main14 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main18 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int) Bool)
(declare-fun inv_main9 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Heap)) (or (not (and (= var4 emptyHeap) (and (= var3 (newBatchHeap (batchAlloc emptyHeap (O_Int var2) 100000))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var2) 100000)))))) (inv_main4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main4 var3 var2 var1) (= var0 0))) (inv_main9 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main9 var7 var6 var5) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1))) (and (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (is-O_Int (read var7 (nthAddrRange var6 var5)))) (and (and (= var3 (write var7 (nthAddrRange var6 var5) (O_Int var2))) (= var1 var6)) (= var4 var5)))) (= var0 (+ var4 1))))) (inv_main9 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int)) (or (not (and (inv_main18 var4 var3 var2 var1) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 100000 (* (- 2) var5)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 100000 (* (- 2) var5)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 100000 (* (- 2) var5))) (- 1))))) (<= 0 (+ (+ var5 (* (- 1) (+ var1 1))) (- 1)))) (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (is-O_Int (read var4 (nthAddrRange var3 (+ (+ 100000 (* (- 1) var1)) (- 1))))))) (= var0 (+ var1 1))))) (inv_main18 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int)) (or (not (and (inv_main14 var8 var7 var6 var5) (and (and (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 100000 (* (- 2) var9)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 100000 (* (- 2) var9)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 100000 (* (- 2) var9))) (- 1))))) (<= 0 (+ var9 (- 1)))) (not (or (not (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 100000 (* (- 2) var10)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 100000 (* (- 2) var10)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 100000 (* (- 2) var10))) (- 1)))))) (<= 0 (+ (+ var10 (* (- 1) (+ var4 1))) (- 1)))))) (and (and (is-O_Int (read var8 (nthAddrRange var7 var6))) (is-O_Int (read var8 (nthAddrRange var7 var6)))) (and (and (= var3 (write var8 (nthAddrRange var7 var6) (O_Int var5))) (= var2 var7)) (= var4 var6)))) (= var1 (+ var4 1))) (= var0 0)))) (inv_main18 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int)) (or (not (and (inv_main9 var8 var7 var6) (and (and (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 100000 (* (- 2) var9)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 100000 (* (- 2) var9)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 100000 (* (- 2) var9))) (- 1))))) (<= 0 (+ var9 (- 1)))) (not (or (not (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 100000 (* (- 2) var10)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 100000 (* (- 2) var10)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 100000 (* (- 2) var10))) (- 1)))))) (<= 0 (+ var10 (- 1)))))) (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var5 1))) (- 1)))) (and (and (is-O_Int (read var8 (nthAddrRange var7 var6))) (is-O_Int (read var8 (nthAddrRange var7 var6)))) (and (and (= var4 (write var8 (nthAddrRange var7 var6) (O_Int var3))) (= var2 var7)) (= var5 var6))))) (= var1 0)) (= var0 0)))) (inv_main18 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main12 var3 var2 var1) (and (is-O_Int (read var3 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var1)) (- 1))))) (= var0 (getInt (read var3 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var1)) (- 1))))))))) (inv_main14 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap) (var8 Int)) (or (not (and (inv_main14 var7 var6 var5 var4) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 100000 (* (- 2) var8)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 100000 (* (- 2) var8)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 100000 (* (- 2) var8))) (- 1))))) (<= 0 (+ (+ var8 (* (- 1) (+ var3 1))) (- 1)))) (and (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (is-O_Int (read var7 (nthAddrRange var6 var5)))) (and (and (= var2 (write var7 (nthAddrRange var6 var5) (O_Int var4))) (= var1 var6)) (= var3 var5)))) (= var0 (+ var3 1))))) (inv_main12 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap) (var8 Int)) (or (not (and (inv_main9 var7 var6 var5) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) (+ 100000 (* (- 2) var8)))) (- 1))) (<= 0 (+ (+ 2 (* 1 (+ 100000 (* (- 2) var8)))) (- 1)))) (not (<= 0 (+ (* (- 1) (+ 100000 (* (- 2) var8))) (- 1))))) (<= 0 (+ var8 (- 1)))) (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1)))) (and (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (is-O_Int (read var7 (nthAddrRange var6 var5)))) (and (and (= var3 (write var7 (nthAddrRange var6 var5) (O_Int var2))) (= var1 var6)) (= var4 var5))))) (= var0 0)))) (inv_main12 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 (+ (+ 100000 (* (- 1) var0)) (- 1))))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 (+ (+ 100000 (* (- 1) var0)) (- 1))))) (not (within var1 (nthAddrRange var1 (+ (+ 100000 (* (- 1) var0)) (- 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main14 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main14 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main14 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (is-O_Int (read var3 (nthAddrRange var2 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var0)) (- 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var0)) (- 1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (is-O_Int (read var3 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var0)) (- 1)))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (and (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (is-O_Int (read var3 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var0)) (- 1)))))) (not (within var2 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var0)) (- 1))))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (and (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (is-O_Int (read var3 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var0)) (- 1)))))) (not (= (getInt (read var3 (nthAddrRange var2 var0))) (getInt (read var3 (nthAddrRange var2 (+ (+ 100000 (* (- 1) var0)) (- 1))))))))))))
(check-sat)