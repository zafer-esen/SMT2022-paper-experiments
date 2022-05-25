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
(declare-fun inv_main12 (Heap AddrRange Int) Bool)
(declare-fun inv_main3 (Heap AddrRange Int) Bool)
(declare-fun inv_main5 (Heap AddrRange Int) Bool)
(declare-fun inv_main8 (Heap AddrRange Int) Bool)
(declare-fun inv_main9 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and (= var2 (newBatchHeap (batchAlloc emptyHeap (O_Int 0) 100000))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int 0) 100000))))) (inv_main3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and (inv_main5 var2 var1 var0) (and (and (<= 0 var0) (<= 0 (+ 10000 (* (- 1) var0)))) (<= 0 (+ (+ 100000 (* (- 1) var0)) (- 1)))))) (inv_main8 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main3 var3 var2 var1) (= var0 0))) (inv_main5 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main8 var6 var5 var4) (and (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var3 (write var6 (nthAddrRange var5 var4) (O_Int 10))) (= var2 var5)) (= var1 var4))) (= var0 (+ var1 1))))) (inv_main5 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main9 var6 var5 var4) (and (and (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4)))) (and (and (= var3 (write var6 (nthAddrRange var5 var4) (O_Int 0))) (= var2 var5)) (= var1 var4))) (= var0 (+ var1 1))))) (inv_main5 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main5 var3 var2 var1) (and (not (<= 0 (+ (+ 100000 (* (- 1) var1)) (- 1)))) (= var0 0)))) (inv_main12 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main12 var3 var2 var1) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var1 1))) (- 1))) (is-O_Int (read var3 (nthAddrRange var2 var1)))) (= var0 (+ var1 1))))) (inv_main12 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and (inv_main5 var2 var1 var0) (and (or (not (<= 0 var0)) (not (<= 0 (+ 10000 (* (- 1) var0))))) (<= 0 (+ (+ 100000 (* (- 1) var0)) (- 1)))))) (inv_main9 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main9 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (not (within var1 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (= (getInt (read var2 (nthAddrRange var1 var0))) 10)))))))
(check-sat)