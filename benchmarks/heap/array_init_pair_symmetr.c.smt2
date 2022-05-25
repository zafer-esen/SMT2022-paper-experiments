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
(declare-fun inv_main13 (Heap Int Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main19 (Heap Int Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main22 (Heap Int Int AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main24 (Heap Int Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main25 (Heap Int Int AddrRange AddrRange AddrRange Int) Bool)
(declare-fun inv_main28 (Heap Int Int AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main6 (Heap Int Int AddrRange AddrRange AddrRange) Bool)
(declare-fun inv_main8 (Heap Int Int AddrRange AddrRange AddrRange) Bool)
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Heap) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (= var16 emptyHeap) (= var15 100000)) (and (and (and (= var14 (newBatchHeap (batchAlloc emptyHeap (O_Int var13) var15))) (= var12 var15)) (= var11 var10)) (= var9 (newAddrRange (batchAlloc emptyHeap (O_Int var13) var15))))) (and (and (and (and (= var8 (newBatchHeap (batchAlloc emptyHeap (O_Int var7) var12))) (= var6 var12)) (= var5 var11)) (= var4 var9)) (= var3 (newAddrRange (batchAlloc emptyHeap (O_Int var7) var12))))) (= var2 (newBatchHeap (batchAlloc emptyHeap (O_Int var1) var6)))) (= var0 (newAddrRange (batchAlloc emptyHeap (O_Int var1) var6))))) (inv_main6 var2 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main13 var7 var6 var5 var4 var3 var2 var1) (and (and (is-O_Int (read var7 (nthAddrRange var4 var5))) (is-O_Int (read var7 (nthAddrRange var4 var5)))) (= var0 (write var7 (nthAddrRange var4 var5) (O_Int var1)))))) (inv_main19 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main22 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var6 (nthAddrRange var3 var4))) (= var0 (getInt (read var6 (nthAddrRange var3 var4))))))) (inv_main24 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (inv_main8 var14 var13 var12 var11 var10 var9) (and (and (not (= var8 0)) (and (and (and (and (and (and (and (= var7 var14) (= var6 var13)) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var0)) (or (and (and (<= 0 (+ (+ var0 100000) (- 1))) (<= 0 (+ (+ 100000 (* (- 1) var0)) (- 1)))) (= var8 1)) (and (not (and (<= 0 (+ (+ var0 100000) (- 1))) (<= 0 (+ (+ 100000 (* (- 1) var0)) (- 1))))) (= var8 0))))) (<= 0 (+ (+ var13 (* (- 1) var12)) (- 1)))))) (inv_main13 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main24 var7 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var7 (nthAddrRange var3 var5))) (= var0 (+ var1 (getInt (read var7 (nthAddrRange var3 var5)))))))) (inv_main25 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main6 var6 var5 var4 var3 var2 var1) (= var0 0))) (inv_main8 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main19 var13 var12 var11 var10 var9 var8 var7) (and (and (and (is-O_Int (read var13 (nthAddrRange var9 var11))) (is-O_Int (read var13 (nthAddrRange var9 var11)))) (and (and (and (and (and (= var6 (write var13 (nthAddrRange var9 var11) (O_Int (* (- 1) var7)))) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 (+ var4 1))))) (inv_main8 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main8 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var5 (- 1))) (not (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1))))) (= var0 0)))) (inv_main22 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main25 var13 var12 var11 var10 var9 var8 var7) (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (and (is-O_Int (read var13 (nthAddrRange var8 var11))) (is-O_Int (read var13 (nthAddrRange var8 var11)))) (and (and (and (and (and (= var4 (write var13 (nthAddrRange var8 var11) (O_Int var7))) (= var6 var12)) (= var5 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)))) (= var0 (+ var5 1))))) (inv_main22 var4 var6 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main28 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var5 (* (- 1) (+ var4 1))) (- 1))) (is-O_Int (read var6 (nthAddrRange var1 var4)))) (= var0 (+ var4 1))))) (inv_main28 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main8 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var5 (- 1)) (- 1))) (and (not (<= 0 (+ var5 (- 1)))) (not (<= 0 (+ (+ var5 (* (- 1) var4)) (- 1)))))) (= var0 1)))) (inv_main28 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main25 var13 var12 var11 var10 var9 var8 var7) (and (and (<= 0 (+ (+ var6 (- 1)) (- 1))) (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (and (is-O_Int (read var13 (nthAddrRange var8 var11))) (is-O_Int (read var13 (nthAddrRange var8 var11)))) (and (and (and (and (and (= var4 (write var13 (nthAddrRange var8 var11) (O_Int var7))) (= var6 var12)) (= var5 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))))) (= var0 1)))) (inv_main28 var4 var6 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main13 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var3 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main13 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var3 var4))) (not (within var3 (nthAddrRange var3 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main13 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var3 var4))) (not (is-O_Int (read var6 (nthAddrRange var3 var4)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var2 var4))) (not (within var2 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var2 var4))) (not (is-O_Int (read var6 (nthAddrRange var2 var4)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main22 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var2 var3))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main22 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var2 var3))) (not (within var2 (nthAddrRange var2 var3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var2 var4))) (not (within var2 (nthAddrRange var2 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var1 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var1 var4))) (not (within var1 (nthAddrRange var1 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main25 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var1 var4))) (not (is-O_Int (read var6 (nthAddrRange var1 var4)))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main28 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var0 var3))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main28 var5 var4 var3 var2 var1 var0) (not (within var0 (nthAddrRange var0 var3)))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main28 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var0 var3))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main28 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var0 var3))) (not (within var0 (nthAddrRange var0 var3))))))))
(assert (forall ((var0 AddrRange) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main28 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var0 var3))) (not (= (getInt (read var5 (nthAddrRange var0 var3))) 0)))))))
(check-sat)