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
(declare-fun inv_main11 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main13 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main14 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main16 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main19 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main24 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main26 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main29 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Heap)) (or (not (and (= var4 emptyHeap) (and (= var3 (newBatchHeap (batchAlloc emptyHeap (O_Int var2) 100000))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var2) 100000)))))) (inv_main4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main11 var9 var8 var7 var6) (and (and (<= 0 (+ (+ var5 (* (- 1) (+ var4 1))) (- 1))) (and (and (is-O_Int (read var9 (nthAddrRange var8 var7))) (is-O_Int (read var9 (nthAddrRange var8 var7)))) (and (and (and (= var3 (write var9 (nthAddrRange var8 var7) (O_Int var2))) (= var1 var8)) (= var4 var7)) (= var5 var6)))) (= var0 (+ var4 1))))) (inv_main11 var3 var1 var0 var5))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main4 var4 var3 var2) (and (<= 0 (+ var1 (- 1))) (= var0 0)))) (inv_main11 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int)) (or (not (and (inv_main24 var8 var7 var6 var5) (and (and (not (or (not (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) var9)) (- 1))) (<= 0 (+ (+ 2 (* 1 var9)) (- 1)))) (or (not (<= 0 (+ var9 (- 1)))) (<= 0 (+ var4 (- 1))))) (or (not (<= 0 (+ (* (- 1) var9) (- 1)))) (<= 0 (+ (* (- 1) var4) (- 1))))) (= var4 (+ (* 2 var10) var9)))) (= var9 0))) (is-O_Int (read var8 (nthAddrRange var7 var6)))) (and (and (and (and (= var3 var8) (= var2 var7)) (= var1 var6)) (= var0 var5)) (= var4 (getInt (read var8 (nthAddrRange var7 var6)))))))) (inv_main26 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main13 var4 var3 var2 var1) (and (and (<= 0 (+ var1 (- 1))) (not (<= 0 (+ (+ var1 (* (- 1) var2)) (- 1))))) (= var0 0)))) (inv_main24 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap) (var10 Int) (var11 Int)) (or (not (and (inv_main24 var9 var8 var7 var6) (and (and (<= 0 (+ (+ var5 (* (- 1) (+ var4 1))) (- 1))) (and (and (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) var10)) (- 1))) (<= 0 (+ (+ 2 (* 1 var10)) (- 1)))) (or (not (<= 0 (+ var10 (- 1)))) (<= 0 (+ var3 (- 1))))) (or (not (<= 0 (+ (* (- 1) var10) (- 1)))) (<= 0 (+ (* (- 1) var3) (- 1))))) (= var3 (+ (* 2 var11) var10))) (= var10 0)) (is-O_Int (read var9 (nthAddrRange var8 var7)))) (and (and (and (and (= var2 var9) (= var1 var8)) (= var4 var7)) (= var5 var6)) (= var3 (getInt (read var9 (nthAddrRange var8 var7))))))) (= var0 (+ var4 1))))) (inv_main24 var2 var1 var0 var5))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main29 var5 var4 var3 var2 var1) (and (<= 0 (+ (+ var2 (* (- 1) (+ var3 1))) (- 1))) (= var0 (+ var3 1))))) (inv_main24 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int)) (or (not (and (inv_main14 var8 var7 var6 var5) (and (and (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) var9)) (- 1))) (<= 0 (+ (+ 2 (* 1 var9)) (- 1)))) (or (not (<= 0 (+ var9 (- 1)))) (<= 0 (+ var4 (- 1))))) (or (not (<= 0 (+ (* (- 1) var9) (- 1)))) (<= 0 (+ (* (- 1) var4) (- 1))))) (= var4 (+ (* 2 var10) var9))) (= var9 0)) (is-O_Int (read var8 (nthAddrRange var7 var6)))) (and (and (and (and (= var3 var8) (= var2 var7)) (= var1 var6)) (= var0 var5)) (= var4 (getInt (read var8 (nthAddrRange var7 var6)))))))) (inv_main16 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main11 var9 var8 var7 var6) (and (and (not (<= 0 (+ (+ var5 (* (- 1) (+ var4 1))) (- 1)))) (and (and (is-O_Int (read var9 (nthAddrRange var8 var7))) (is-O_Int (read var9 (nthAddrRange var8 var7)))) (and (and (and (= var3 (write var9 (nthAddrRange var8 var7) (O_Int var2))) (= var1 var8)) (= var4 var7)) (= var5 var6)))) (= var0 0)))) (inv_main13 var3 var1 var0 var5))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap) (var10 Int) (var11 Int)) (or (not (and (inv_main14 var9 var8 var7 var6) (and (and (and (not (or (not (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) var10)) (- 1))) (<= 0 (+ (+ 2 (* 1 var10)) (- 1)))) (or (not (<= 0 (+ var10 (- 1)))) (<= 0 (+ var5 (- 1))))) (or (not (<= 0 (+ (* (- 1) var10) (- 1)))) (<= 0 (+ (* (- 1) var5) (- 1))))) (= var5 (+ (* 2 var11) var10)))) (= var10 0))) (is-O_Int (read var9 (nthAddrRange var8 var7)))) (and (and (and (and (= var4 var9) (= var3 var8)) (= var2 var7)) (= var1 var6)) (= var5 (getInt (read var9 (nthAddrRange var8 var7)))))) (= var0 (+ var2 1))))) (inv_main13 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main19 var5 var4 var3 var2 var1) (= var0 (+ var3 1)))) (inv_main13 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main4 var4 var3 var2) (and (not (<= 0 (+ var1 (- 1)))) (= var0 0)))) (inv_main13 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main16 var4 var3 var2 var1) (and (is-O_Int (read var4 (nthAddrRange var3 var2))) (= var0 (getInt (read var4 (nthAddrRange var3 var2))))))) (inv_main19 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main26 var4 var3 var2 var1) (and (is-O_Int (read var4 (nthAddrRange var3 var2))) (= var0 (getInt (read var4 (nthAddrRange var3 var2))))))) (inv_main29 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main13 var3 var2 var1 var0) (<= 0 (+ (+ var0 (* (- 1) var1)) (- 1))))) (inv_main14 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (is-O_Int (read var3 (nthAddrRange var2 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main14 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main14 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main16 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main16 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int)) (not (and (inv_main19 var4 var3 var2 var1 var0) (not (or (not (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) var5)) (- 1))) (<= 0 (+ (+ 2 (* 1 var5)) (- 1)))) (or (not (<= 0 (+ var5 (- 1)))) (<= 0 (+ var0 (- 1))))) (or (not (<= 0 (+ (* (- 1) var5) (- 1)))) (<= 0 (+ (* (- 1) var0) (- 1))))) (= var0 (+ (* 2 var6) var5)))) (= var5 0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main24 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main24 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main26 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main26 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int)) (not (and (inv_main29 var4 var3 var2 var1 var0) (and (and (and (and (and (<= 0 (+ (+ 2 (* (- 1) var5)) (- 1))) (<= 0 (+ (+ 2 (* 1 var5)) (- 1)))) (or (not (<= 0 (+ var5 (- 1)))) (<= 0 (+ var0 (- 1))))) (or (not (<= 0 (+ (* (- 1) var5) (- 1)))) (<= 0 (+ (* (- 1) var0) (- 1))))) (= var0 (+ (* 2 var6) var5))) (= var5 0))))))
(check-sat)
