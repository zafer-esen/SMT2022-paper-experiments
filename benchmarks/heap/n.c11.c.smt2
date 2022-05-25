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
(declare-fun inv_main5 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main6 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main9 (Heap AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Heap)) (or (not (and (and (= var5 emptyHeap) (and (= var4 (newBatchHeap (batchAlloc emptyHeap (O_Int var3) 5))) (= var2 (newAddrRange (batchAlloc emptyHeap (O_Int var3) 5))))) (= var1 0))) (inv_main5 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main9 var8 var7 var6 var5) (and (and (and (is-O_Int (read var8 (nthAddrRange var7 var6))) (is-O_Int (read var8 (nthAddrRange var7 var6)))) (and (and (and (= var4 (write var8 (nthAddrRange var7 var6) (O_Int 0))) (= var3 var7)) (= var2 var6)) (= var1 var5))) (= var0 (+ var2 1))))) (inv_main5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main5 var5 var4 var3 var2) (and (and (= var3 4) (not (= var1 0))) (= var0 0)))) (inv_main9 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main5 var4 var3 var2 var1) (and (not (= var2 4)) (not (= var0 0))))) (inv_main9 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main5 var4 var3 var2 var1) (= var0 0))) (inv_main6 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main9 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main9 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main9 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var1))) (not (is-O_Int (read var3 (nthAddrRange var2 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main6 var3 var2 var1 var0) (or (not (<= 0 var1)) (not (<= 0 (+ (+ 5 (* (- 1) var1)) (- 1)))))))))
(check-sat)
