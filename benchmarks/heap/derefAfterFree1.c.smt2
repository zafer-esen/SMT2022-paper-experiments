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
(declare-fun inv_main4 (Heap AddrRange) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Heap) (var6 Heap)) (or (not (and (inv_main2 var6) (and (and (and (= var5 (batchWrite var4 var3 defObj)) (= var2 var3)) (= var1 var3)) (and (= var4 (newBatchHeap (batchAlloc var6 (O_Int var0) 10))) (= var3 (newAddrRange (batchAlloc var6 (O_Int var0) 10))))))) (inv_main4 var5 var2))))
(assert (forall ((var0 AddrRange) (var1 Heap)) (not (and (inv_main4 var1 var0) (not (is-O_Int (read var1 (nthAddrRange var0 0))))))))
(assert (forall ((var0 AddrRange) (var1 Heap)) (not (and (inv_main4 var1 var0) (and (is-O_Int (read var1 (nthAddrRange var0 0))) (not (within var0 (nthAddrRange var0 0))))))))
(assert (forall ((var0 AddrRange) (var1 Heap)) (not (and (inv_main4 var1 var0) (and (is-O_Int (read var1 (nthAddrRange var0 0))) (not (is-O_Int (read var1 (nthAddrRange var0 0)))))))))
(check-sat)
