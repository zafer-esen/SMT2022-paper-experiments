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
(declare-fun inv_main17 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main2 (Heap Int Int) Bool)
(declare-fun inv_main20 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main21 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main26 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main30 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main31 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main36 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main40 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main41 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main46 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main50 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main51 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main56 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main60 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main61 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main64 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main66 (Heap Int Int Int AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var2 emptyHeap) (= var1 0)) (= var0 100000))) (inv_main2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main40 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ var4 (* (- 1) var2)) (- 1))))) (inv_main41 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main40 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var5 (- 1))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main46 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main46 var13 var12 var11 var10 var9 var8) (and (and (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 (+ var6 1))))) (inv_main46 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main20 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ var4 (* (- 1) var2)) (- 1))))) (inv_main21 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main60 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ var4 (* (- 1) var2)) (- 1))))) (inv_main61 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main51 var13 var12 var11 var10 var9 var8) (and (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var7 var13) (= var6 var12)) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (getInt (read var13 (nthAddrRange var9 var10))))))) (= var0 (+ var4 1))))) (inv_main50 var7 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main40 var6 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var5 (- 1)))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main50 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main46 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1)))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 0)))) (inv_main50 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main61 var13 var12 var11 var10 var9 var8) (and (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var7 var13) (= var6 var12)) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (getInt (read var13 (nthAddrRange var9 var10))))))) (= var0 (+ var4 1))))) (inv_main60 var7 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main50 var6 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var5 (- 1)))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main60 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main56 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1)))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 0)))) (inv_main60 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main60 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var5 (- 1))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main66 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main66 var13 var12 var11 var10 var9 var8) (and (and (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 (+ var6 1))))) (inv_main66 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main41 var13 var12 var11 var10 var9 var8) (and (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var7 var13) (= var6 var12)) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (getInt (read var13 (nthAddrRange var9 var10))))))) (= var0 (+ var4 1))))) (inv_main40 var7 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main30 var6 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var5 (- 1)))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main40 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main36 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1)))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 0)))) (inv_main40 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main60 var6 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var5 (- 1)))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main64 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main66 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1)))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 (+ var6 1))))) (inv_main64 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main30 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ var4 (* (- 1) var2)) (- 1))))) (inv_main31 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (inv_main17 var12 var11 var10 var9 var8 var7) (and (and (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1))) (and (and (is-O_Int (read var12 (nthAddrRange var8 var9))) (is-O_Int (read var12 (nthAddrRange var8 var9)))) (and (and (and (and (and (= var4 (write var12 (nthAddrRange var8 var9) (O_Int 1))) (= var6 var11)) (= var3 var10)) (= var5 var9)) (= var2 var8)) (= var1 var7)))) (= var0 (+ var5 1))))) (inv_main17 var4 var6 var3 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Heap) (var12 Heap) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (inv_main2 var16 var15 var14) (and (and (and (and (<= 0 (+ var13 (- 1))) (and (and (and (and (= var12 (newBatchHeap (batchAlloc var11 (O_Int var10) var9))) (= var13 var9)) (= var8 var7)) (= var6 var5)) (= var4 (newAddrRange (batchAlloc var11 (O_Int var10) var9))))) (and (not (= var3 0)) (and (<= 0 (+ (+ var2 (- 1)) (- 1))) (and (and (and (= var11 var16) (= var9 var2)) (= var7 var14)) (or (and (<= 0 (+ (+ var14 (* (- 1) var2)) (- 1))) (= var3 1)) (and (not (<= 0 (+ (+ var14 (* (- 1) var2)) (- 1)))) (= var3 0))))))) (= var1 0)) (= var0 0)))) (inv_main17 var12 var13 var8 var1 var4 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main31 var13 var12 var11 var10 var9 var8) (and (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var7 var13) (= var6 var12)) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (getInt (read var13 (nthAddrRange var9 var10))))))) (= var0 (+ var4 1))))) (inv_main30 var7 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main20 var6 var5 var4 var3 var2 var1) (and (and (not (<= 0 (+ var5 (- 1)))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main30 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main26 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1)))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 0)))) (inv_main30 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main50 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var5 (- 1))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main56 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main56 var13 var12 var11 var10 var9 var8) (and (and (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 (+ var6 1))))) (inv_main56 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main20 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var5 (- 1))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main26 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main26 var13 var12 var11 var10 var9 var8) (and (and (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 (+ var6 1))))) (inv_main26 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main21 var13 var12 var11 var10 var9 var8) (and (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var7 var13) (= var6 var12)) (= var5 var11)) (= var4 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (getInt (read var13 (nthAddrRange var9 var10))))))) (= var0 (+ var4 1))))) (inv_main20 var7 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Heap) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (inv_main17 var12 var11 var10 var9 var8 var7) (and (and (not (<= 0 (+ (+ var6 (* (- 1) (+ var5 1))) (- 1)))) (and (and (is-O_Int (read var12 (nthAddrRange var8 var9))) (is-O_Int (read var12 (nthAddrRange var8 var9)))) (and (and (and (and (and (= var4 (write var12 (nthAddrRange var8 var9) (O_Int 1))) (= var6 var11)) (= var3 var10)) (= var5 var9)) (= var2 var8)) (= var1 var7)))) (= var0 0)))) (inv_main20 var4 var6 var3 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Heap) (var12 Heap) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (inv_main2 var16 var15 var14) (and (and (and (and (not (<= 0 (+ var13 (- 1)))) (and (and (and (and (= var12 (newBatchHeap (batchAlloc var11 (O_Int var10) var9))) (= var13 var9)) (= var8 var7)) (= var6 var5)) (= var4 (newAddrRange (batchAlloc var11 (O_Int var10) var9))))) (and (not (= var3 0)) (and (<= 0 (+ (+ var2 (- 1)) (- 1))) (and (and (and (= var11 var16) (= var9 var2)) (= var7 var14)) (or (and (<= 0 (+ (+ var14 (* (- 1) var2)) (- 1))) (= var3 1)) (and (not (<= 0 (+ (+ var14 (* (- 1) var2)) (- 1)))) (= var3 0))))))) (= var1 0)) (= var0 0)))) (inv_main20 var12 var13 var8 var1 var4 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main30 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ var5 (- 1))) (not (<= 0 (+ (+ var5 (* (- 1) var3)) (- 1))))) (= var0 0)))) (inv_main36 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (inv_main36 var13 var12 var11 var10 var9 var8) (and (and (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1))) (and (is-O_Int (read var13 (nthAddrRange var9 var10))) (and (and (and (and (and (and (= var5 var13) (= var7 var12)) (= var4 var11)) (= var6 var10)) (= var3 var9)) (= var2 var8)) (= var1 (+ var8 (* (- 1) (getInt (read var13 (nthAddrRange var9 var10))))))))) (= var0 (+ var6 1))))) (inv_main36 var5 var7 var4 var0 var3 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (inv_main50 var5 var4 var3 var2 var1 var0) (<= 0 (+ (+ var4 (* (- 1) var2)) (- 1))))) (inv_main51 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (is-O_Int (read var5 (nthAddrRange var1 var2)))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main21 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main21 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main26 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main26 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main31 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main31 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main36 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main36 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main41 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main41 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main46 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main46 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main51 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main51 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main56 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main56 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main61 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main61 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main66 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main66 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var1 var2))) (not (within var1 (nthAddrRange var1 var2))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main64 var5 var4 var3 var2 var1 var0) (not (= var0 0))))))
(check-sat)
