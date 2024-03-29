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
   (S (p Int) (n Int))
  )
))
(declare-fun inv_main13 (Heap AddrRange Int Int S) Bool)
(declare-fun inv_main16 (Heap AddrRange Int) Bool)
(declare-fun inv_main20 (Heap AddrRange Int) Bool)
(declare-fun inv_main23 (Heap AddrRange Int S) Bool)
(declare-fun inv_main3 (Heap AddrRange Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int) Bool)
(declare-fun inv_main5 (Heap AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and (= var2 (newBatchHeap (batchAlloc emptyHeap (O_S (S 0 0)) 100000))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_S (S 0 0)) 100000))))) (inv_main3 var2 var1 var0))))
(assert (forall ((var0 AddrRange) (var1 Heap) (var2 S) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main20 var6 var5 var4) (and (and (and (not (= var3 3)) (= (n var2) 0)) (is-O_S (read var6 (nthAddrRange var5 var4)))) (and (and (and (= var1 var6) (= var0 var5)) (= var3 var4)) (= var2 (getS (read var6 (nthAddrRange var5 var4)))))))) (inv_main23 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main16 var6 var5 var4) (and (and (and (is-O_S (read var6 (nthAddrRange var5 3))) (is-O_S (read var6 (nthAddrRange var5 3)))) (and (and (= var3 (write var6 (nthAddrRange var5 3) (O_S (S (p (getS (read var6 (nthAddrRange var5 3)))) 40)))) (= var2 var5)) (= var1 var4))) (= var0 0)))) (inv_main20 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 S) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main23 var4 var3 var2 var1) (and (<= 0 (+ (+ 100000 (* (- 1) (+ var2 1))) (- 1))) (= var0 (+ var2 1))))) (inv_main20 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 S) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main20 var7 var6 var5) (and (and (<= 0 (+ (+ 100000 (* (- 1) (+ var4 1))) (- 1))) (and (and (or (= var4 3) (not (= (n var3) 0))) (is-O_S (read var7 (nthAddrRange var6 var5)))) (and (and (and (= var2 var7) (= var1 var6)) (= var4 var5)) (= var3 (getS (read var7 (nthAddrRange var6 var5))))))) (= var0 (+ var4 1))))) (inv_main20 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main3 var3 var2 var1) (= var0 0))) (inv_main5 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 S) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main13 var8 var7 var6 var5 var4) (and (and (and (is-O_S (read var8 (nthAddrRange var7 var6))) (is-O_S (read var8 (nthAddrRange var7 var6)))) (and (and (= var3 (write var8 (nthAddrRange var7 var6) (O_S var4))) (= var2 var7)) (= var1 var6))) (= var0 (+ var1 1))))) (inv_main5 var3 var2 var0))))
(assert (forall ((var0 S) (var1 Int) (var2 S) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap) (var8 S) (var9 Int) (var10 AddrRange) (var11 Heap)) (or (not (and (inv_main5 var11 var10 var9) (and (and (and (= (n var8) 0) (and (and (and (and (= var7 var11) (= var6 var10)) (= var5 var9)) (= var4 var3)) (= var8 (S (p var2) var1)))) (<= 0 (+ (+ 100000 (* (- 1) var9)) (- 1)))) (= var0 (S 10 (n var8)))))) (inv_main13 var7 var6 var5 var4 var0))))
(assert (forall ((var0 S) (var1 Int) (var2 S) (var3 Int) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap) (var8 S) (var9 Int) (var10 AddrRange) (var11 Heap)) (or (not (and (inv_main5 var11 var10 var9) (and (and (and (not (= (n var8) 0)) (and (and (and (and (= var7 var11) (= var6 var10)) (= var5 var9)) (= var4 var3)) (= var8 (S (p var2) var1)))) (<= 0 (+ (+ 100000 (* (- 1) var9)) (- 1)))) (= var0 (S 20 (n var8)))))) (inv_main13 var7 var6 var5 var4 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main4 var3 var2 var1) (and (and (is-O_S (read var3 (nthAddrRange var2 3))) (is-O_S (read var3 (nthAddrRange var2 3)))) (= var0 (write var3 (nthAddrRange var2 3) (O_S (S 30 (n (getS (read var3 (nthAddrRange var2 3))))))))))) (inv_main16 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (or (not (and (inv_main5 var2 var1 var0) (not (<= 0 (+ (+ 100000 (* (- 1) var0)) (- 1)))))) (inv_main4 var2 var1 var0))))
(assert (forall ((var0 S) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_S (read var4 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 S) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O_S (read var4 (nthAddrRange var3 var2))) (not (within var3 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 S) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (and (is-O_S (read var4 (nthAddrRange var3 var2))) (not (is-O_S (read var4 (nthAddrRange var3 var2)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main4 var2 var1 var0) (not (is-O_S (read var2 (nthAddrRange var1 3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main4 var2 var1 var0) (and (is-O_S (read var2 (nthAddrRange var1 3))) (not (within var1 (nthAddrRange var1 3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main4 var2 var1 var0) (and (is-O_S (read var2 (nthAddrRange var1 3))) (not (is-O_S (read var2 (nthAddrRange var1 3)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (not (is-O_S (read var2 (nthAddrRange var1 3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (and (is-O_S (read var2 (nthAddrRange var1 3))) (not (within var1 (nthAddrRange var1 3))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (and (is-O_S (read var2 (nthAddrRange var1 3))) (not (is-O_S (read var2 (nthAddrRange var1 3)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main20 var2 var1 var0) (not (is-O_S (read var2 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap)) (not (and (inv_main20 var2 var1 var0) (and (is-O_S (read var2 (nthAddrRange var1 var0))) (not (within var1 (nthAddrRange var1 var0))))))))
(assert (forall ((var0 S) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main23 var3 var2 var1 var0) (not (= (p var0) 10))))))
(check-sat)
