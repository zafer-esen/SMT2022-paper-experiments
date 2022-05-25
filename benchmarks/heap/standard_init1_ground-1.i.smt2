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
(declare-fun inv_main4 (Heap AddrRange Int) Bool)
(declare-fun inv_main6 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Heap)) (or (not (and (and (= var4 emptyHeap) (and (= var3 (newBatchHeap (batchAlloc emptyHeap (O_Int var2) 100000))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var2) 100000))))) (= var0 0))) (inv_main4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main6 var6 var5 var4) (and (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var3 (write var6 (nthAddrRange var5 var4) (O_Int 42))) (= var2 var5)) (= var1 var4))) (= var0 (+ var1 1))))) (inv_main4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and (inv_main4 var2 var1 var0) (<= 0 (+ (+ 100000 (* (- 1) var0)) (- 1))))) (inv_main6 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main11 var4 var3 var2 var1) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var1 1))) (- 1))) (is-O_Int (read var4 (nthAddrRange var3 var1)))) (= var0 (+ var1 1))))) (inv_main11 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main4 var3 var2 var1) (and (not (<= 0 (+ (+ 100000 (* (- 1) var1)) (- 1)))) (= var0 0)))) (inv_main11 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main6 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main6 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main6 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (= (getInt (read var3 (nthAddrRange var2 var0))) 43)))))))
(check-sat)
