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
(declare-fun inv_main10 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int) Bool)
(declare-fun inv_main7 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main8 (Heap AddrRange Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Heap)) (or (not (and (and (= var4 emptyHeap) (and (= var3 (newBatchHeap (batchAlloc emptyHeap (O_Int var2) 5))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var2) 5))))) (= var0 0))) (inv_main4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Heap)) (or (not (and (inv_main10 var10 var9 var8 var7 var6) (and (and (and (is-O_Int (read var10 (nthAddrRange var9 var8))) (is-O_Int (read var10 (nthAddrRange var9 var8)))) (and (and (and (and (= var5 (write var10 (nthAddrRange var9 var8) (O_Int 0))) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 var6))) (= var0 (+ var3 1))))) (inv_main7 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (inv_main4 var4 var3 var2)) (inv_main7 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main7 var5 var4 var3 var2 var1) (and (and (= var3 4) (not (= var2 0))) (= var0 0)))) (inv_main10 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main7 var4 var3 var2 var1 var0) (and (not (= var2 4)) (not (= var1 0))))) (inv_main10 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main7 var4 var3 var2 var1 var0) (= var1 0))) (inv_main8 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main10 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main10 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var3 var2))) (not (within var3 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main10 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var3 var2))) (not (is-O_Int (read var4 (nthAddrRange var3 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main8 var4 var3 var2 var1 var0) (not (= var2 5))))))
(check-sat)
