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
(declare-fun inv_main14 (Heap Int Int Int AddrRange) Bool)
(declare-fun inv_main18 (Heap Int Int Int AddrRange) Bool)
(declare-fun inv_main2 (Heap Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 0))) (inv_main2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main14 var11 var10 var9 var8 var7) (and (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (and (is-O_Int (read var11 (nthAddrRange var7 var8))) (is-O_Int (read var11 (nthAddrRange var7 var8)))) (and (and (and (and (= var4 (write var11 (nthAddrRange var7 var8) (O_Int var8))) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)))) (= var1 (+ var5 1))) (= var0 (+ var3 1))))) (inv_main14 var4 var6 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (inv_main2 var12 var11) (and (and (and (and (<= 0 (+ var10 (- 1))) (and (and (and (and (= var9 (newBatchHeap (batchAlloc emptyHeap (O_Int var8) var7))) (= var10 var7)) (= var6 var5)) (= var4 var3)) (= var2 (newAddrRange (batchAlloc emptyHeap (O_Int var8) var7))))) (<= 0 (+ var7 (- 1)))) (= var1 0)) (= var0 0)))) (inv_main14 var9 var10 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main18 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var4 (* (- 1) (+ var3 1))) (- 1))) (is-O_Int (read var5 (nthAddrRange var1 var3)))) (= var0 (+ var3 1))))) (inv_main18 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main14 var11 var10 var9 var8 var7) (and (and (and (<= 0 (+ var6 (- 1))) (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (and (is-O_Int (read var11 (nthAddrRange var7 var8))) (is-O_Int (read var11 (nthAddrRange var7 var8)))) (and (and (and (and (= var4 (write var11 (nthAddrRange var7 var8) (O_Int var8))) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7))))) (= var1 0)) (= var0 (+ var3 1))))) (inv_main18 var4 var6 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (inv_main2 var12 var11) (and (and (and (<= 0 (+ var10 (- 1))) (and (and (not (<= 0 (+ var10 (- 1)))) (and (and (and (and (= var9 (newBatchHeap (batchAlloc emptyHeap (O_Int var8) var7))) (= var10 var7)) (= var6 var5)) (= var4 var3)) (= var2 (newAddrRange (batchAlloc emptyHeap (O_Int var8) var7))))) (<= 0 (+ var7 (- 1))))) (= var1 0)) (= var0 0)))) (inv_main18 var9 var10 var1 var0 var2))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main14 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main14 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var0 var1))) (not (within var0 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main14 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var0 var1))) (not (is-O_Int (read var4 (nthAddrRange var0 var1)))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var0 var2))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (not (within var0 (nthAddrRange var0 var2)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var0 var2))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var0 var2))) (not (within var0 (nthAddrRange var0 var2))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var0 var2))) (not (= (getInt (read var4 (nthAddrRange var0 var2))) var2)))))))
(check-sat)
