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
(declare-fun inv_main11 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main18 (Heap AddrRange Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int) Bool)
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 Heap) (var4 Int)) (or (not (and (and (<= 0 var4) (= var3 emptyHeap)) (and (= var2 (newBatchHeap (batchAlloc emptyHeap (O_UInt var1) 10000))) (= var0 (newAddrRange (batchAlloc emptyHeap (O_UInt var1) 10000)))))) (inv_main4 var2 var0 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main18 var3 var2 var1) (and (and (<= 0 (+ (+ 10000 (* (- 1) (+ var1 1))) (- 1))) (is-O_UInt (read var3 (nthAddrRange var2 var1)))) (= var0 (+ var1 1))))) (inv_main18 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main11 var7 var6 var5 var4) (and (and (not (<= 0 (+ (+ 10000 (* (- 1) (+ var3 1))) (- 1)))) (and (and (is-O_UInt (read var7 (nthAddrRange var6 var5))) (is-O_UInt (read var7 (nthAddrRange var6 var5)))) (and (and (= var2 (write var7 (nthAddrRange var6 var5) (O_UInt var4))) (= var1 var6)) (= var3 var5)))) (= var0 0)))) (inv_main18 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main4 var8 var7 var6) (and (and (not (= var5 0)) (and (and (and (and (= var4 var8) (= var3 var7)) (= var2 0)) (= var1 var0)) (or (and (<= 0 (+ var0 (- 1))) (= var5 1)) (and (not (<= 0 (+ var0 (- 1)))) (= var5 0))))) (<= 0 var0)))) (inv_main11 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 Heap) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Heap)) (or (not (and (inv_main11 var12 var11 var10 var9) (and (and (and (and (not (= var8 0)) (and (and (and (and (= var7 var6) (= var5 var4)) (= var3 (+ var2 1))) (= var1 var0)) (or (and (<= 0 (+ (+ var0 (* (- 1) (+ var2 1))) (- 1))) (= var8 1)) (and (not (<= 0 (+ (+ var0 (* (- 1) (+ var2 1))) (- 1)))) (= var8 0))))) (<= 0 var0)) (<= 0 (+ (+ 10000 (* (- 1) (+ var2 1))) (- 1)))) (and (and (is-O_UInt (read var12 (nthAddrRange var11 var10))) (is-O_UInt (read var12 (nthAddrRange var11 var10)))) (and (and (= var6 (write var12 (nthAddrRange var11 var10) (O_UInt var9))) (= var4 var11)) (= var2 var10)))))) (inv_main11 var7 var5 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (not (is-O_UInt (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_UInt (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_UInt (read var3 (nthAddrRange var2 var1))) (not (is-O_UInt (read var3 (nthAddrRange var2 var1)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main18 var2 var1 var0) (not (is-O_UInt (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main18 var2 var1 var0) (not (within var1 (nthAddrRange var1 var0)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main18 var2 var1 var0) (not (is-O_UInt (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main18 var2 var1 var0) (and (is-O_UInt (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main18 var2 var1 var0) (and (is-O_UInt (read var2 (nthAddrRange var1 var0))) (not (<= 0 (+ (+ (getUInt (read var2 (nthAddrRange var1 var0))) (* (- 1) var0)) (- 1)))))))))
(check-sat)
