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
   (S (p Int) (q Int))
  )
))
(declare-fun inv_main11 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main17 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main19 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main22 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main25 (Heap AddrRange Int Int Int) Bool)
(declare-fun inv_main4 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main7 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main9 (Heap AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Heap) (var3 Int)) (or (not (and (<= 0 var3) (and (= var2 (newBatchHeap (batchAlloc emptyHeap (O_S (S 0 0)) 10000))) (= var1 (newAddrRange (batchAlloc emptyHeap (O_S (S 0 0)) 10000)))))) (inv_main4 var2 var1 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main4 var4 var3 var2 var1) (= var0 0))) (inv_main7 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main9 var8 var7 var6 var5) (and (and (<= 0 (+ (+ 1000000 (* (- 1) (+ var4 1))) (- 1))) (and (and (is-O_S (read var8 (nthAddrRange var7 var5))) (is-O_S (read var8 (nthAddrRange var7 var5)))) (and (and (and (= var3 (write var8 (nthAddrRange var7 var5) (O_S (S (p (getS (read var8 (nthAddrRange var7 var5)))) var5)))) (= var2 var7)) (= var1 var6)) (= var4 var5)))) (= var0 (+ var4 1))))) (inv_main7 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main9 var8 var7 var6 var5) (and (and (not (<= 0 (+ (+ 1000000 (* (- 1) (+ var4 1))) (- 1)))) (and (and (is-O_S (read var8 (nthAddrRange var7 var5))) (is-O_S (read var8 (nthAddrRange var7 var5)))) (and (and (and (= var3 (write var8 (nthAddrRange var7 var5) (O_S (S (p (getS (read var8 (nthAddrRange var7 var5)))) var5)))) (= var2 var7)) (= var1 var6)) (= var4 var5)))) (= var0 0)))) (inv_main11 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main19 var8 var7 var6 var5) (and (and (and (is-O_S (read var8 (nthAddrRange var7 var5))) (is-O_S (read var8 (nthAddrRange var7 var5)))) (and (and (and (= var4 (write var8 (nthAddrRange var7 var5) (O_S (S (p (getS (read var8 (nthAddrRange var7 var5)))) (* var6 var6))))) (= var3 var7)) (= var2 var6)) (= var1 var5))) (= var0 (+ var1 1))))) (inv_main11 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main11 var5 var4 var3 var2) (and (and (= var1 0) (<= 0 (+ (+ 1000000 (* (- 1) var2)) (- 1)))) (= var0 (+ var2 1))))) (inv_main11 var5 var4 var3 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main17 var4 var3 var2 var1) (and (and (is-O_S (read var4 (nthAddrRange var3 var1))) (is-O_S (read var4 (nthAddrRange var3 var1)))) (= var0 (write var4 (nthAddrRange var3 var1) (O_S (S var2 (q (getS (read var4 (nthAddrRange var3 var1))))))))))) (inv_main19 var0 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main7 var4 var3 var2 var1) (and (and (is-O_S (read var4 (nthAddrRange var3 var1))) (is-O_S (read var4 (nthAddrRange var3 var1)))) (= var0 (write var4 (nthAddrRange var3 var1) (O_S (S var1 (q (getS (read var4 (nthAddrRange var3 var1))))))))))) (inv_main9 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main11 var5 var4 var3 var2) (and (not (= var1 0)) (<= 0 (+ (+ 1000000 (* (- 1) var2)) (- 1)))))) (inv_main17 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main11 var4 var3 var2 var1) (and (not (<= 0 (+ (+ 1000000 (* (- 1) var1)) (- 1)))) (= var0 0)))) (inv_main22 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main25 var5 var4 var3 var2 var1) (and (<= 0 (+ (+ 1000000 (* (- 1) (+ var2 1))) (- 1))) (= var0 (+ var2 1))))) (inv_main22 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap)) (or (not (and (inv_main22 var8 var7 var6 var5) (and (and (and (and (and (and (is-O_S (read var8 (nthAddrRange var7 var5))) (is-O_S (read var8 (nthAddrRange var7 var5)))) (not (= (p (getS (read var8 (nthAddrRange var7 var5)))) (q (getS (read var8 (nthAddrRange var7 var5))))))) (is-O_S (read var8 (nthAddrRange var7 var5)))) (is-O_S (read var8 (nthAddrRange var7 var5)))) (is-O_S (read var8 (nthAddrRange var7 var5)))) (and (and (and (and (= var4 var8) (= var3 var7)) (= var2 var6)) (= var1 var5)) (or (and (= (q (getS (read var8 (nthAddrRange var7 var5)))) (* (p (getS (read var8 (nthAddrRange var7 var5)))) (p (getS (read var8 (nthAddrRange var7 var5)))))) (= var0 1)) (and (not (= (q (getS (read var8 (nthAddrRange var7 var5)))) (* (p (getS (read var8 (nthAddrRange var7 var5)))) (p (getS (read var8 (nthAddrRange var7 var5))))))) (= var0 0))))))) (inv_main25 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main22 var4 var3 var2 var1) (and (and (and (is-O_S (read var4 (nthAddrRange var3 var1))) (is-O_S (read var4 (nthAddrRange var3 var1)))) (= (p (getS (read var4 (nthAddrRange var3 var1)))) (q (getS (read var4 (nthAddrRange var3 var1)))))) (= var0 1)))) (inv_main25 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main7 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main7 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main7 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (is-O_S (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main9 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main9 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main9 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (is-O_S (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main17 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main17 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main17 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (is-O_S (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main19 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main19 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main19 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (is-O_S (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var0))) (not (is-O_S (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (and (is-O_S (read var3 (nthAddrRange var2 var0))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (and (and (is-O_S (read var3 (nthAddrRange var2 var0))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (= (p (getS (read var3 (nthAddrRange var2 var0)))) (q (getS (read var3 (nthAddrRange var2 var0))))))) (not (is-O_S (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (and (and (and (is-O_S (read var3 (nthAddrRange var2 var0))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (= (p (getS (read var3 (nthAddrRange var2 var0)))) (q (getS (read var3 (nthAddrRange var2 var0))))))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (and (and (and (is-O_S (read var3 (nthAddrRange var2 var0))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (= (p (getS (read var3 (nthAddrRange var2 var0)))) (q (getS (read var3 (nthAddrRange var2 var0))))))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (is-O_S (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (and (and (and (and (is-O_S (read var3 (nthAddrRange var2 var0))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (= (p (getS (read var3 (nthAddrRange var2 var0)))) (q (getS (read var3 (nthAddrRange var2 var0))))))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (and (and (and (and (is-O_S (read var3 (nthAddrRange var2 var0))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (= (p (getS (read var3 (nthAddrRange var2 var0)))) (q (getS (read var3 (nthAddrRange var2 var0))))))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (is-O_S (read var3 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (and (and (and (and (and (and (is-O_S (read var3 (nthAddrRange var2 var0))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (= (p (getS (read var3 (nthAddrRange var2 var0)))) (q (getS (read var3 (nthAddrRange var2 var0))))))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (is-O_S (read var3 (nthAddrRange var2 var0)))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (not (and (inv_main25 var4 var3 var2 var1 var0) (= var0 0)))))
(check-sat)
