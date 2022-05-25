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
(declare-fun inv_main4 (Heap AddrRange Int) Bool)
(declare-fun inv_main5 (Heap AddrRange Int) Bool)
(declare-fun inv_main7 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Heap)) (or (not (and (= var4 emptyHeap) (and (= var3 (newBatchHeap (batchAlloc emptyHeap (O_Int var2) 2048))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var2) 2048)))))) (inv_main4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main4 var3 var2 var1) (= var0 0))) (inv_main7 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main7 var6 var5 var4) (and (and (<= 0 (+ (+ 1024 (* (- 1) (+ var3 1))) (- 1))) (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var2 (write var6 (nthAddrRange var5 var4) (O_Int var4))) (= var1 var5)) (= var3 var4)))) (= var0 (+ var3 1))))) (inv_main7 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main7 var6 var5 var4) (and (and (not (<= 0 (+ (+ 1024 (* (- 1) (+ var3 1))) (- 1)))) (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var2 (write var6 (nthAddrRange var5 var4) (O_Int var4))) (= var1 var5)) (= var3 var4)))) (= var0 (+ var3 1))))) (inv_main5 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main7 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main7 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main7 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main5 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 1023))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main5 var2 var1 var0) (not (within var1 (nthAddrRange var1 1023)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main5 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 1023))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main5 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 1023))) (not (within var1 (nthAddrRange var1 1023))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main5 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 1023))) (not (= (getInt (read var2 (nthAddrRange var1 1023))) 1023)))))))
(check-sat)
