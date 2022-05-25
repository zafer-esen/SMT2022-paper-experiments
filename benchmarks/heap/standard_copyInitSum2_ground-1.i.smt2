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
(declare-fun inv_main11 (Heap AddrRange AddrRange Int) Bool)
(declare-fun inv_main13 (Heap AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main16 (Heap AddrRange AddrRange Int) Bool)
(declare-fun inv_main18 (Heap AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main22 (Heap AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main5 (Heap AddrRange AddrRange Int) Bool)
(declare-fun inv_main7 (Heap AddrRange AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 AddrRange) (var6 Int) (var7 Heap) (var8 Heap)) (or (not (and (and (and (= var8 emptyHeap) (and (= var7 (newBatchHeap (batchAlloc emptyHeap (O_Int var6) 100000))) (= var5 (newAddrRange (batchAlloc emptyHeap (O_Int var6) 100000))))) (and (and (= var4 (newBatchHeap (batchAlloc emptyHeap (O_Int var3) 100000))) (= var2 var5)) (= var1 (newAddrRange (batchAlloc emptyHeap (O_Int var3) 100000))))) (= var0 0))) (inv_main5 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 AddrRange) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main7 var8 var7 var6 var5) (and (and (and (is-O_Int (read var8 (nthAddrRange var7 var5))) (is-O_Int (read var8 (nthAddrRange var7 var5)))) (and (and (and (= var4 (write var8 (nthAddrRange var7 var5) (O_Int 42))) (= var3 var7)) (= var2 var6)) (= var1 var5))) (= var0 (+ var1 1))))) (inv_main5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main18 var9 var8 var7 var6 var5) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1))) (and (and (is-O_Int (read var9 (nthAddrRange var8 var6))) (is-O_Int (read var9 (nthAddrRange var8 var6)))) (and (and (and (= var3 (write var9 (nthAddrRange var8 var6) (O_Int (+ var5 var6)))) (= var2 var8)) (= var1 var7)) (= var4 var6)))) (= var0 (+ var4 1))))) (inv_main16 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main13 var9 var8 var7 var6 var5) (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1)))) (and (and (is-O_Int (read var9 (nthAddrRange var7 var6))) (is-O_Int (read var9 (nthAddrRange var7 var6)))) (and (and (and (= var3 (write var9 (nthAddrRange var7 var6) (O_Int var5))) (= var2 var8)) (= var1 var7)) (= var4 var6)))) (= var0 0)))) (inv_main16 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main22 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var1 1))) (- 1))) (is-O_Int (read var5 (nthAddrRange var3 var1)))) (= var0 (+ var1 1))))) (inv_main22 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 AddrRange) (var10 Heap)) (or (not (and (inv_main18 var10 var9 var8 var7 var6) (and (and (and (not (<= 0 (+ (+ 100000 (* (- 1) (+ var5 1))) (- 1)))) (and (and (is-O_Int (read var10 (nthAddrRange var9 var7))) (is-O_Int (read var10 (nthAddrRange var9 var7)))) (and (and (and (= var4 (write var10 (nthAddrRange var9 var7) (O_Int (+ var6 var7)))) (= var3 var9)) (= var2 var8)) (= var5 var7)))) (= var1 (+ var5 1))) (= var0 0)))) (inv_main22 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main5 var4 var3 var2 var1) (and (not (<= 0 (+ (+ 100000 (* (- 1) var1)) (- 1)))) (= var0 0)))) (inv_main11 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main13 var9 var8 var7 var6 var5) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1))) (and (and (is-O_Int (read var9 (nthAddrRange var7 var6))) (is-O_Int (read var9 (nthAddrRange var7 var6)))) (and (and (and (= var3 (write var9 (nthAddrRange var7 var6) (O_Int var5))) (= var2 var8)) (= var1 var7)) (= var4 var6)))) (= var0 (+ var4 1))))) (inv_main11 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main11 var4 var3 var2 var1) (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (= var0 (getInt (read var4 (nthAddrRange var3 var1))))))) (inv_main13 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main5 var3 var2 var1 var0) (<= 0 (+ (+ 100000 (* (- 1) var0)) (- 1))))) (inv_main7 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main16 var4 var3 var2 var1) (and (is-O_Int (read var4 (nthAddrRange var2 var1))) (= var0 (getInt (read var4 (nthAddrRange var2 var1))))))) (inv_main18 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main7 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main7 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main7 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (is-O_Int (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var2 var1))) (not (is-O_Int (read var4 (nthAddrRange var2 var1)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main16 var3 var2 var1 var0) (not (is-O_Int (read var3 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 Heap)) (not (and (inv_main16 var3 var2 var1 var0) (and (is-O_Int (read var3 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (not (within var3 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var3 var1))) (not (is-O_Int (read var4 (nthAddrRange var3 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main22 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main22 var4 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main22 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main22 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Heap)) (not (and (inv_main22 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var2 var0))) (not (= (getInt (read var4 (nthAddrRange var2 var0))) (+ 42 var0))))))))
(check-sat)
