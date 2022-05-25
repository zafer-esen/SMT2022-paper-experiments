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
(declare-fun inv_main10 (Heap AddrRange Int) Bool)
(declare-fun inv_main11 (Heap AddrRange Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int) Bool)
(declare-fun inv_main9 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Heap)) (or (not (and (= var4 emptyHeap) (and (= var3 (newBatchHeap (batchAlloc emptyHeap (O_Int var2) 1024))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var2) 1024)))))) (inv_main4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main11 var7 var6 var5) (and (and (not (<= 0 (+ var4 (- 1023)))) (and (and (not (= var3 0)) (is-O_Int (read var7 (nthAddrRange var6 var5)))) (and (and (and (= var2 var7) (= var1 var6)) (= var4 var5)) (= var3 (getInt (read var7 (nthAddrRange var6 var5))))))) (= var0 (+ var4 1))))) (inv_main11 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main9 var7 var6 var5) (and (and (not (<= 0 (+ (+ 1024 (* (- 1) (+ var4 1))) (- 1)))) (and (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (is-O_Int (read var7 (nthAddrRange var6 var5)))) (and (and (= var3 (write var7 (nthAddrRange var6 var5) (O_Int var2))) (= var1 var6)) (= var4 var5)))) (= var0 0)))) (inv_main11 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main4 var3 var2 var1) (= var0 0))) (inv_main9 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main9 var7 var6 var5) (and (and (<= 0 (+ (+ 1024 (* (- 1) (+ var4 1))) (- 1))) (and (and (is-O_Int (read var7 (nthAddrRange var6 var5))) (is-O_Int (read var7 (nthAddrRange var6 var5)))) (and (and (= var3 (write var7 (nthAddrRange var6 var5) (O_Int var2))) (= var1 var6)) (= var4 var5)))) (= var0 (+ var4 1))))) (inv_main9 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main11 var6 var5 var4) (and (and (= var3 0) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (and (= var2 var6) (= var1 var5)) (= var0 var4)) (= var3 (getInt (read var6 (nthAddrRange var5 var4)))))))) (inv_main10 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 Heap) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main11 var6 var5 var4) (and (<= 0 (+ var3 (- 1023))) (and (and (not (= var2 0)) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (and (= var1 var6) (= var0 var5)) (= var3 var4)) (= var2 (getInt (read var6 (nthAddrRange var5 var4))))))))) (inv_main10 var1 var0 var3))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main10 var2 var1 var0) (not (<= 0 (+ 1024 (* (- 1) var0))))))))
(check-sat)
