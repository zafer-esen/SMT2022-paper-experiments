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
(declare-fun inv_main16 (Heap Int Int Int AddrRange) Bool)
(declare-fun inv_main19 (Heap Int Int Int AddrRange) Bool)
(declare-fun inv_main2 (Heap Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var2 emptyHeap) (= var1 0)) (= var0 100000))) (inv_main2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main19 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var4 (* (- 1) (+ var2 1))) (- 1))) (is-O_Int (read var5 (nthAddrRange var1 var2)))) (= var0 (+ var2 1))))) (inv_main19 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main16 var10 var9 var8 var7 var6) (and (and (<= 0 (+ var5 (- 1))) (and (not (<= 0 (+ (+ var5 (* (- 1) (+ var4 1))) (- 1)))) (and (and (is-O_Int (read var10 (nthAddrRange var6 var7))) (is-O_Int (read var10 (nthAddrRange var6 var7)))) (and (and (and (and (= var3 (write var10 (nthAddrRange var6 var7) (O_Int (* var7 var7)))) (= var5 var9)) (= var2 var8)) (= var4 var7)) (= var1 var6))))) (= var0 0)))) (inv_main19 var3 var5 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 Heap) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main2 var15 var14 var13) (and (and (<= 0 (+ var12 (- 1))) (and (and (not (<= 0 (+ var12 (- 1)))) (and (and (and (and (= var11 (newBatchHeap (batchAlloc var10 (O_Int var9) var8))) (= var12 var8)) (= var7 var6)) (= var5 var4)) (= var3 (newAddrRange (batchAlloc var10 (O_Int var9) var8))))) (and (not (= var2 0)) (and (<= 0 (+ (+ var1 (- 1)) (- 1))) (and (and (and (= var10 var15) (= var8 var1)) (= var6 var13)) (or (and (<= 0 (+ (+ var13 (* (- 1) var1)) (- 1))) (= var2 1)) (and (not (<= 0 (+ (+ var13 (* (- 1) var1)) (- 1)))) (= var2 0)))))))) (= var0 0)))) (inv_main19 var11 var12 var7 var0 var3))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Int) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main16 var10 var9 var8 var7 var6) (and (and (<= 0 (+ (+ var5 (* (- 1) (+ var4 1))) (- 1))) (and (and (is-O_Int (read var10 (nthAddrRange var6 var7))) (is-O_Int (read var10 (nthAddrRange var6 var7)))) (and (and (and (and (= var3 (write var10 (nthAddrRange var6 var7) (O_Int (* var7 var7)))) (= var5 var9)) (= var2 var8)) (= var4 var7)) (= var1 var6)))) (= var0 (+ var4 1))))) (inv_main16 var3 var5 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 Heap) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (inv_main2 var15 var14 var13) (and (and (and (<= 0 (+ var12 (- 1))) (and (and (and (and (= var11 (newBatchHeap (batchAlloc var10 (O_Int var9) var8))) (= var12 var8)) (= var7 var6)) (= var5 var4)) (= var3 (newAddrRange (batchAlloc var10 (O_Int var9) var8))))) (and (not (= var2 0)) (and (<= 0 (+ (+ var1 (- 1)) (- 1))) (and (and (and (= var10 var15) (= var8 var1)) (= var6 var13)) (or (and (<= 0 (+ (+ var13 (* (- 1) var1)) (- 1))) (= var2 1)) (and (not (<= 0 (+ (+ var13 (* (- 1) var1)) (- 1)))) (= var2 0))))))) (= var0 0)))) (inv_main16 var11 var12 var7 var0 var3))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main16 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main16 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var0 var1))) (not (within var0 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main16 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var0 var1))) (not (is-O_Int (read var4 (nthAddrRange var0 var1)))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (not (within var0 (nthAddrRange var0 var1)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var0 var1))) (not (within var0 (nthAddrRange var0 var1))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main19 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var0 var1))) (not (= (getInt (read var4 (nthAddrRange var0 var1))) (* var1 var1))))))))
(check-sat)
