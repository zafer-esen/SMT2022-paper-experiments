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
(declare-fun inv_main14 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main16 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main17 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main19 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main22 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main24 (Heap AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main26 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main29 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main30 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(declare-fun inv_main31 (Heap AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main32 (Heap AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main36 (Heap AddrRange AddrRange AddrRange Int Int Int) Bool)
(declare-fun inv_main7 (Heap AddrRange AddrRange AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Heap) (var11 AddrRange) (var12 Int) (var13 Heap) (var14 Heap)) (or (not (and (and (and (= var14 emptyHeap) (and (= var13 (newBatchHeap (batchAlloc emptyHeap (O_Int var12) 200000))) (= var11 (newAddrRange (batchAlloc emptyHeap (O_Int var12) 200000))))) (and (and (= var10 (newBatchHeap (batchAlloc emptyHeap (O_Int var9) 200000))) (= var8 var11)) (= var7 (newAddrRange (batchAlloc emptyHeap (O_Int var9) 200000))))) (and (and (and (= var6 (newBatchHeap (batchAlloc emptyHeap (O_Int var5) 200000))) (= var4 var8)) (= var3 var7)) (= var2 (newAddrRange (batchAlloc emptyHeap (O_Int var5) 200000)))))) (inv_main7 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 AddrRange) (var12 Heap)) (or (not (and (inv_main16 var12 var11 var10 var9 var8 var7) (and (and (is-O_Int (read var12 (nthAddrRange var10 var8))) (is-O_Int (read var12 (nthAddrRange var10 var8)))) (and (and (and (and (and (= var6 (write var12 (nthAddrRange var10 var8) (O_Int var5))) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7))))) (inv_main17 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main29 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var6 (nthAddrRange var4 var2))) (= var0 (getInt (read var6 (nthAddrRange var4 var2))))))) (inv_main31 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main30 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var6 (nthAddrRange var5 var2))) (= var0 (getInt (read var6 (nthAddrRange var5 var2))))))) (inv_main32 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main36 var7 var6 var5 var4 var3 var2 var1) (and (and (<= 0 (+ (+ 200000 (* (- 1) (+ var1 1))) (- 1))) (and (is-O_Int (read var7 (nthAddrRange var5 var1))) (is-O_Int (read var7 (nthAddrRange var4 var1))))) (= var0 (+ var1 1))))) (inv_main36 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main26 var6 var5 var4 var3 var2 var1) (and (not (<= 0 (+ (+ 200000 (* (- 1) var2)) (- 1)))) (= var0 0)))) (inv_main36 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main26 var5 var4 var3 var2 var1 var0) (and (not (= var1 var0)) (<= 0 (+ (+ 200000 (* (- 1) var1)) (- 1)))))) (inv_main29 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 AddrRange) (var12 Heap)) (or (not (and (inv_main14 var12 var11 var10 var9 var8 var7) (and (and (is-O_Int (read var12 (nthAddrRange var11 var8))) (is-O_Int (read var12 (nthAddrRange var11 var8)))) (and (and (and (and (and (= var6 (write var12 (nthAddrRange var11 var8) (O_Int var5))) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8)) (= var0 var7))))) (inv_main16 var6 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main19 var6 var5 var4 var3 var2 var1) (and (not (<= 0 (+ (+ 200000 (* (- 1) var2)) (- 1)))) (= var0 0)))) (inv_main26 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (inv_main31 var13 var12 var11 var10 var9 var8 var7) (and (and (and (is-O_Int (read var13 (nthAddrRange var10 var9))) (is-O_Int (read var13 (nthAddrRange var10 var9)))) (and (and (and (and (and (= var6 (write var13 (nthAddrRange var10 var9) (O_Int var7))) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 (+ var2 1))))) (inv_main26 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (inv_main32 var13 var12 var11 var10 var9 var8 var7) (and (and (and (is-O_Int (read var13 (nthAddrRange var10 var9))) (is-O_Int (read var13 (nthAddrRange var10 var9)))) (and (and (and (and (and (= var6 (write var13 (nthAddrRange var10 var9) (O_Int var7))) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 (+ var2 1))))) (inv_main26 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main22 var6 var5 var4 var3 var2 var1) (and (is-O_Int (read var6 (nthAddrRange var5 var2))) (= var0 (getInt (read var6 (nthAddrRange var5 var2))))))) (inv_main24 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main26 var5 var4 var3 var2 var1 var0) (and (= var1 var0) (<= 0 (+ (+ 200000 (* (- 1) var1)) (- 1)))))) (inv_main30 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (inv_main17 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 (+ (+ 200000 (* (- 1) (+ var7 1))) (- 1)))) (and (and (is-O_Int (read var13 (nthAddrRange var10 var9))) (is-O_Int (read var13 (nthAddrRange var10 var9)))) (and (and (and (and (and (= var6 (write var13 (nthAddrRange var10 var9) (O_Int var5))) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var7 var9)) (= var1 var8)))) (= var0 0)))) (inv_main19 var6 var4 var3 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (inv_main24 var13 var12 var11 var10 var9 var8 var7) (and (and (and (is-O_Int (read var13 (nthAddrRange var11 var9))) (is-O_Int (read var13 (nthAddrRange var11 var9)))) (and (and (and (and (and (= var6 (write var13 (nthAddrRange var11 var9) (O_Int var7))) (= var5 var12)) (= var4 var11)) (= var3 var10)) (= var2 var9)) (= var1 var8))) (= var0 (+ var2 1))))) (inv_main19 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (or (not (and (inv_main19 var6 var5 var4 var3 var2 var1) (and (and (= var2 var1) (<= 0 (+ (+ 200000 (* (- 1) var2)) (- 1)))) (= var0 (+ var2 1))))) (inv_main19 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 AddrRange) (var6 AddrRange) (var7 Heap)) (or (not (and (inv_main7 var7 var6 var5 var4 var3 var2) (and (= var1 0) (= var0 150000)))) (inv_main14 var7 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 AddrRange) (var11 AddrRange) (var12 AddrRange) (var13 Heap)) (or (not (and (inv_main17 var13 var12 var11 var10 var9 var8) (and (and (<= 0 (+ (+ 200000 (* (- 1) (+ var7 1))) (- 1))) (and (and (is-O_Int (read var13 (nthAddrRange var10 var9))) (is-O_Int (read var13 (nthAddrRange var10 var9)))) (and (and (and (and (and (= var6 (write var13 (nthAddrRange var10 var9) (O_Int var5))) (= var4 var12)) (= var3 var11)) (= var2 var10)) (= var7 var9)) (= var1 var8)))) (= var0 (+ var7 1))))) (inv_main14 var6 var4 var3 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (or (not (and (inv_main19 var5 var4 var3 var2 var1 var0) (and (not (= var1 var0)) (<= 0 (+ (+ 200000 (* (- 1) var1)) (- 1)))))) (inv_main22 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main14 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var4 var1))) (not (within var4 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main14 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var4 var1))) (not (is-O_Int (read var5 (nthAddrRange var4 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main16 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main16 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var3 var1))) (not (within var3 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main16 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var3 var1))) (not (is-O_Int (read var5 (nthAddrRange var3 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main17 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var2 var1))) (not (is-O_Int (read var5 (nthAddrRange var2 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main22 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main22 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var4 var1))) (not (within var4 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var4 var2))) (not (within var4 (nthAddrRange var4 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main24 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var4 var2))) (not (is-O_Int (read var6 (nthAddrRange var4 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main29 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main29 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var3 var1))) (not (within var3 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main31 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main31 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var3 var2))) (not (within var3 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main31 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var3 var2))) (not (is-O_Int (read var6 (nthAddrRange var3 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main30 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var5 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 AddrRange) (var5 Heap)) (not (and (inv_main30 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var5 (nthAddrRange var4 var1))) (not (within var4 (nthAddrRange var4 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var3 var2))) (not (within var3 (nthAddrRange var3 var2))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var3 var2))) (not (is-O_Int (read var6 (nthAddrRange var3 var2)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (within var4 (nthAddrRange var4 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (within var3 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (read var6 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var4 var0))) (not (within var4 (nthAddrRange var4 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (and (is-O_Int (read var6 (nthAddrRange var4 var0))) (not (is-O_Int (read var6 (nthAddrRange var3 var0)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var4 var0))) (is-O_Int (read var6 (nthAddrRange var3 var0)))) (not (within var3 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 AddrRange) (var5 AddrRange) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (and (and (is-O_Int (read var6 (nthAddrRange var4 var0))) (is-O_Int (read var6 (nthAddrRange var3 var0)))) (not (= (getInt (read var6 (nthAddrRange var4 var0))) (getInt (read var6 (nthAddrRange var3 var0))))))))))
(check-sat)
