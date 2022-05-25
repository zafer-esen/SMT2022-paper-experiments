(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
(declare-heap Heap Addr HeapObject
 defObj
 ((HeapObject 0) (_S 0)) (
  (
   (O_Int (getInt Int))
   (O_UInt (getUInt Int))
   (O_Addr (getAddr Addr))
   (O__S (get_S _S))
   (defObj)
  )
  (
   (_S (n Int))
  )
))
(declare-fun inv_main13 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main9 (Heap AddrRange Int Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (= var4 (newBatchHeap (batchAlloc emptyHeap (O__S (_S 0)) 100000))) (= var3 (newAddrRange (batchAlloc emptyHeap (O__S (_S 0)) 100000)))) (= var2 100))) (inv_main4 var4 var3 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main4 var5 var4 var3 var2 var1) (= var0 0))) (inv_main9 var5 var4 var0 var1 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Heap)) (or (not (and (inv_main9 var12 var11 var10 var9 var8) (and (and (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var7 1))) (- 1))) (and (and (is-O__S (read var12 (nthAddrRange var11 var10))) (is-O__S (read var12 (nthAddrRange var11 var10)))) (and (and (and (and (= var6 (write var12 (nthAddrRange var11 var10) (O__S (_S var8)))) (= var5 var11)) (= var7 var10)) (= var4 var9)) (= var3 var8)))) (= var2 (+ var7 1))) (= var1 (+ var3 1))) (= var0 (+ var3 1))))) (inv_main9 var6 var5 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main13 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var3 1))) (- 1))) (is-O__S (read var5 (nthAddrRange var4 var3)))) (= var0 (+ var3 1))))) (inv_main13 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Heap)) (or (not (and (inv_main9 var11 var10 var9 var8 var7) (and (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var6 1))) (- 1)))) (and (and (is-O__S (read var11 (nthAddrRange var10 var9))) (is-O__S (read var11 (nthAddrRange var10 var9)))) (and (and (and (and (= var5 (write var11 (nthAddrRange var10 var9) (O__S (_S var7)))) (= var4 var10)) (= var6 var9)) (= var3 var8)) (= var2 var7)))) (= var1 0)) (= var0 (+ var2 1))))) (inv_main13 var5 var4 var1 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main9 var4 var3 var2 var1 var0) (not (is-O__S (read var4 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main9 var4 var3 var2 var1 var0) (and (is-O__S (read var4 (nthAddrRange var3 var2))) (not (within var3 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main9 var4 var3 var2 var1 var0) (and (is-O__S (read var4 (nthAddrRange var3 var2))) (not (is-O__S (read var4 (nthAddrRange var3 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O__S (read var4 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (within var3 (nthAddrRange var3 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O__S (read var4 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O__S (read var4 (nthAddrRange var3 var2))) (not (within var3 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O__S (read var4 (nthAddrRange var3 var2))) (not (<= 0 (+ (n (get_S (read var4 (nthAddrRange var3 var2)))) (- 100)))))))))
(check-sat)
