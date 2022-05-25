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
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main7 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main7 var9 var8 var7) (and (and (and (<= 0 (+ (+ 10 (* (- 1) (+ var6 1))) (- 1))) (and (and (= var5 5) (and (is-O_Int (read var9 (nthAddrRange var8 var7))) (is-O_Int (read var9 (nthAddrRange var8 var7))))) (and (and (= var4 (write var9 (nthAddrRange var8 var7) (O_Int 1))) (= var3 var8)) (= var5 var7)))) (and (and (= var2 (batchWrite var4 var3 defObj)) (= var1 var3)) (= var6 var5))) (= var0 (+ var6 1))))) (inv_main7 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main7 var6 var5 var4) (and (and (<= 0 (+ (+ 10 (* (- 1) (+ var3 1))) (- 1))) (and (and (not (= var3 5)) (and (is-O_Int (read var6 (nthAddrRange var5 var4))) (is-O_Int (read var6 (nthAddrRange var5 var4))))) (and (and (= var2 (write var6 (nthAddrRange var5 var4) (O_Int 1))) (= var1 var5)) (= var3 var4)))) (= var0 (+ var3 1))))) (inv_main7 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Heap)) (or (not (and (inv_main2 var4) (and (and (= var3 (newBatchHeap (batchAlloc var4 (O_Int var2) 10))) (= var1 (newAddrRange (batchAlloc var4 (O_Int var2) 10)))) (= var0 0)))) (inv_main7 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main7 var2 var1 var0) (not (is-O_Int (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main7 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main7 var2 var1 var0) (and (is-O_Int (read var2 (nthAddrRange var1 var0))) (not (is-O_Int (read var2 (nthAddrRange var1 var0)))))))))
(check-sat)
