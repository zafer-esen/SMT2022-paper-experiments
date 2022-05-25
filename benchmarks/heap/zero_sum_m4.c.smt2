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
(declare-fun inv_main17 (Heap Int Int AddrRange Int Int) Bool)
(declare-fun inv_main19 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main2 (Heap Int) Bool)
(declare-fun inv_main20 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main25 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main29 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main30 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main35 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main39 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main40 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main45 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main49 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main50 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main53 (Heap Int Int AddrRange Int) Bool)
(declare-fun inv_main55 (Heap Int Int AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 0))) (inv_main2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main50 var11 var10 var9 var8 var7) (and (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var6 var11) (= var5 var10)) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (* (- 1) (getInt (read var11 (nthAddrRange var8 var9)))))))) (= var0 (+ var4 1))))) (inv_main49 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main39 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var4 (- 1)))) (not (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main49 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main45 var11 var10 var9 var8 var7) (and (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (* (- 1) (getInt (read var11 (nthAddrRange var8 var9))))))))) (= var0 0)))) (inv_main49 var4 var6 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main29 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var4 (- 1))) (not (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main35 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main35 var11 var10 var9 var8 var7) (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (getInt (read var11 (nthAddrRange var8 var9)))))))) (= var0 (+ var5 1))))) (inv_main35 var4 var6 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main49 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var4 (- 1))) (not (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main55 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main55 var11 var10 var9 var8 var7) (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (* (- 1) (getInt (read var11 (nthAddrRange var8 var9))))))))) (= var0 (+ var5 1))))) (inv_main55 var4 var6 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (inv_main19 var4 var3 var2 var1 var0) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1))))) (inv_main20 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main30 var11 var10 var9 var8 var7) (and (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var6 var11) (= var5 var10)) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (getInt (read var11 (nthAddrRange var8 var9))))))) (= var0 (+ var4 1))))) (inv_main29 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main19 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var4 (- 1)))) (not (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main29 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main25 var11 var10 var9 var8 var7) (and (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (getInt (read var11 (nthAddrRange var8 var9)))))))) (= var0 0)))) (inv_main29 var4 var6 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (inv_main29 var4 var3 var2 var1 var0) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1))))) (inv_main30 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main49 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var4 (- 1)))) (not (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main53 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main55 var11 var10 var9 var8 var7) (and (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (* (- 1) (getInt (read var11 (nthAddrRange var8 var9))))))))) (= var0 (+ var5 1))))) (inv_main53 var4 var6 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main40 var11 var10 var9 var8 var7) (and (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var6 var11) (= var5 var10)) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (* (- 1) (getInt (read var11 (nthAddrRange var8 var9)))))))) (= var0 (+ var4 1))))) (inv_main39 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main29 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var4 (- 1)))) (not (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main39 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main35 var11 var10 var9 var8 var7) (and (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (getInt (read var11 (nthAddrRange var8 var9)))))))) (= var0 0)))) (inv_main39 var4 var6 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (inv_main49 var4 var3 var2 var1 var0) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1))))) (inv_main50 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (inv_main39 var4 var3 var2 var1 var0) (<= 0 (+ (+ var3 (* (- 1) var2)) (- 1))))) (inv_main40 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main39 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var4 (- 1))) (not (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main45 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main45 var11 var10 var9 var8 var7) (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (* (- 1) (getInt (read var11 (nthAddrRange var8 var9))))))))) (= var0 (+ var5 1))))) (inv_main45 var4 var6 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main17 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1)))) (and (and (is-O_Int (read var13 (nthAddrRange var10 var8))) (is-O_Int (read var13 (nthAddrRange var10 var8)))) (and (and (and (and (and (= var5 (write var13 (nthAddrRange var10 var8) (O_Int var4))) (= var7 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var6 var8)))) (= var0 0)))) (inv_main19 var5 var7 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main20 var11 var10 var9 var8 var7) (and (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var6 var11) (= var5 var10)) (= var4 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (getInt (read var11 (nthAddrRange var8 var9))))))) (= var0 (+ var4 1))))) (inv_main19 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main2 var10 var9) (and (and (and (and (not (<= 0 (+ var8 (- 1)))) (and (and (and (= var7 (newBatchHeap (batchAlloc emptyHeap (O_Int var6) var5))) (= var8 var5)) (= var4 var3)) (= var2 (newAddrRange (batchAlloc emptyHeap (O_Int var6) var5))))) (<= 0 (+ (+ var5 (- 1)) (- 1)))) (= var1 0)) (= var0 0)))) (inv_main19 var7 var8 var1 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main17 var13 var12 var11 var10 var9 var8) (and (and (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1))) (and (and (is-O_Int (read var13 (nthAddrRange var10 var8))) (is-O_Int (read var13 (nthAddrRange var10 var8)))) (and (and (and (and (and (= var5 (write var13 (nthAddrRange var10 var8) (O_Int var4))) (= var7 var12)) (= var3 var11)) (= var2 var10)) (= var1 var9)) (= var6 var8)))) (= var0 (+ var6 1))))) (inv_main17 var5 var7 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (inv_main2 var10 var9) (and (and (and (and (<= 0 (+ var8 (- 1))) (and (and (and (= var7 (newBatchHeap (batchAlloc emptyHeap (O_Int var6) var5))) (= var8 var5)) (= var4 var3)) (= var2 (newAddrRange (batchAlloc emptyHeap (O_Int var6) var5))))) (<= 0 (+ (+ var5 (- 1)) (- 1)))) (= var1 0)) (= var0 0)))) (inv_main17 var7 var8 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main19 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var4 (- 1))) (not (<= 0 (+ (+ var4 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main25 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (inv_main25 var11 var10 var9 var8 var7) (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (is-O_Int (read var11 (nthAddrRange var8 var9))) (and (and (and (and (and (= var4 var11) (= var6 var10)) (= var5 var9)) (= var3 var8)) (= var2 var7)) (= var1 (+ var7 (getInt (read var11 (nthAddrRange var8 var9)))))))) (= var0 (+ var5 1))))) (inv_main25 var4 var6 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var2 var0))) (not (within var2 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var2 var0))) (not (is-O_Int (read var5 (nthAddrRange var2 var0)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main20 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main20 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main25 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main25 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main30 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main30 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main35 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main35 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main40 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main40 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main45 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main45 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main50 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main50 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main55 var4 var3 var2 var1 var0) (not (is-O_Int (read var4 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main55 var4 var3 var2 var1 var0) (and (is-O_Int (read var4 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main53 var4 var3 var2 var1 var0) (not (= var0 0))))))
(check-sat)
