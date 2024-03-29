(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
(declare-heap Heap Addr HeapObject
 defObj
 ((HeapObject 0) (S 0)) (
  (
   (O_Int (getInt Int))
   (O_UInt (getUInt Int))
   (O_Addr (getAddr Addr))
   (O_S (getS S))
   (defObj)
  )
  (
   (S (n Int))
  )
))
(declare-fun inv_main11 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main15 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main18 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main8 (Heap AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (= var3 (newBatchHeap (batchAlloc emptyHeap (O_S (S 0)) 100000))) (= var2 (newAddrRange (batchAlloc emptyHeap (O_S (S 0)) 100000))))) (inv_main4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main4 var5 var4 var3 var2) (= var1 0))) (inv_main8 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main11 var8 var7 var6 var5) (and (and (and (is-O_S (read var8 (nthAddrRange var7 var6))) (is-O_S (read var8 (nthAddrRange var7 var6)))) (and (and (and (= var4 (write var8 (nthAddrRange var7 var6) (O_S (S 10)))) (= var3 var7)) (= var2 var6)) (= var1 var5))) (= var0 (+ var2 1))))) (inv_main8 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main8 var4 var3 var2 var1) (and (not (<= 0 (+ (+ 100000 (* (- 1) var2)) (- 1)))) (= var0 0)))) (inv_main15 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main8 var4 var3 var2 var1) (and (and (<= 0 (+ (+ var1 (- 5)) (- 1))) (<= 0 (+ (+ 100000 (* (- 1) var2)) (- 1)))) (= var0 0)))) (inv_main15 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main18 var4 var3 var2 var1) (and (is-O_S (read var4 (nthAddrRange var3 var2))) (= var0 (+ var2 1))))) (inv_main15 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main15 var4 var3 var2 var1) (and (and (not (<= 0 (+ 5 (* (- 1) var1)))) (<= 0 (+ (+ 100000 (* (- 1) var2)) (- 1)))) (= var0 (+ var2 1))))) (inv_main15 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main8 var3 var2 var1 var0) (and (not (<= 0 (+ (+ var0 (- 5)) (- 1)))) (<= 0 (+ (+ 100000 (* (- 1) var1)) (- 1)))))) (inv_main11 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main15 var3 var2 var1 var0) (and (<= 0 (+ 5 (* (- 1) var0))) (<= 0 (+ (+ 100000 (* (- 1) var1)) (- 1)))))) (inv_main18 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var1))) (not (is-O_S (read var3 (nthAddrRange var2 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var1))) (not (= (n (getS (read var3 (nthAddrRange var2 var1)))) 10)))))))
(check-sat)
