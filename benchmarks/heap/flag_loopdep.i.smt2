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
   (S (n Addr))
  )
))
(declare-fun inv_main15 (Heap AddrRange Int Int AddrRange Int Int Addr) Bool)
(declare-fun inv_main18 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main24 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main27 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main5 (Heap AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 S) (var4 Heap) (var5 Heap)) (or (not (and (= var5 emptyHeap) (and (= var4 (newBatchHeap (batchAlloc emptyHeap (O_S var3) 1000000))) (= var2 (newAddrRange (batchAlloc emptyHeap (O_S var3) 1000000)))))) (inv_main5 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Addr) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Heap)) (or (not (and (inv_main18 var10 var9 var8 var7) (and (and (and (not (<= 0 (+ (+ 1000000 (* (- 1) (+ var6 1))) (- 1)))) (and (and (not (= var5 nullAddr)) (is-O_S (read var10 (nthAddrRange var9 var8)))) (and (and (and (and (= var4 var10) (= var3 var9)) (= var6 var8)) (= var2 var7)) (= var5 (n (getS (read var10 (nthAddrRange var9 var8)))))))) (= var1 0)) (= var0 1)))) (inv_main24 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main18 var9 var8 var7 var6) (and (and (not (<= 0 (+ (+ 1000000 (* (- 1) (+ var5 1))) (- 1)))) (and (and (= var4 nullAddr) (is-O_S (read var9 (nthAddrRange var8 var7)))) (and (and (and (and (= var3 var9) (= var2 var8)) (= var5 var7)) (= var1 var6)) (= var4 (n (getS (read var9 (nthAddrRange var8 var7)))))))) (= var0 0)))) (inv_main24 var3 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main27 var4 var3 var2 var1) (and (is-O_S (read var4 (nthAddrRange var3 var2))) (= var0 (+ var2 1))))) (inv_main24 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (inv_main24 var4 var3 var2 var1) (and (and (not (= var1 0)) (<= 0 (+ (+ 1000000 (* (- 1) var2)) (- 1)))) (= var0 (+ var2 1))))) (inv_main24 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (inv_main24 var3 var2 var1 var0) (and (= var0 0) (<= 0 (+ (+ 1000000 (* (- 1) var1)) (- 1)))))) (inv_main27 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Heap)) (or (not (and (inv_main15 var15 var14 var13 var12 var11 var10 var9 var8) (and (and (not (<= 0 (+ (+ var7 (* (- 1) (+ var6 1))) (- 1)))) (and (and (is-O_S (read var15 (nthAddrRange var11 var9))) (is-O_S (read var15 (nthAddrRange var11 var9)))) (and (and (and (and (and (and (= var5 (write var15 (nthAddrRange var11 var9) (O_S (S var8)))) (= var4 var14)) (= var3 var13)) (= var2 var12)) (= var1 var11)) (= var7 var10)) (= var6 var9)))) (= var0 0)))) (inv_main18 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Addr) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Heap)) (or (not (and (inv_main18 var10 var9 var8 var7) (and (and (and (<= 0 (+ (+ 1000000 (* (- 1) (+ var6 1))) (- 1))) (and (and (not (= var5 nullAddr)) (is-O_S (read var10 (nthAddrRange var9 var8)))) (and (and (and (and (= var4 var10) (= var3 var9)) (= var6 var8)) (= var2 var7)) (= var5 (n (getS (read var10 (nthAddrRange var9 var8)))))))) (= var1 (+ var6 1))) (= var0 1)))) (inv_main18 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main18 var9 var8 var7 var6) (and (and (<= 0 (+ (+ 1000000 (* (- 1) (+ var5 1))) (- 1))) (and (and (= var4 nullAddr) (is-O_S (read var9 (nthAddrRange var8 var7)))) (and (and (and (and (= var3 var9) (= var2 var8)) (= var5 var7)) (= var1 var6)) (= var4 (n (getS (read var9 (nthAddrRange var8 var7)))))))) (= var0 (+ var5 1))))) (inv_main18 var3 var2 var0 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Addr) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Int) (var16 Int) (var17 AddrRange) (var18 Heap)) (or (not (and (inv_main15 var18 var17 var16 var15 var14 var13 var12 var11) (and (and (and (and (<= 0 (+ (+ var10 (* (- 1) (+ var9 1))) (- 1))) (and (and (is-O_S (read var18 (nthAddrRange var14 var12))) (is-O_S (read var18 (nthAddrRange var14 var12)))) (and (and (and (and (and (and (= var8 (write var18 (nthAddrRange var14 var12) (O_S (S var11)))) (= var7 var17)) (= var6 var16)) (= var5 var15)) (= var4 var14)) (= var10 var13)) (= var9 var12)))) (= var3 (newHeap (alloc var8 (O_Int var2))))) (= var1 (+ var9 1))) (= var0 (newAddr (alloc var8 (O_Int var2))))))) (inv_main15 var3 var7 var6 var5 var4 var10 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (inv_main5 var9 var8 var7 var6) (and (and (and (and (= var5 (newHeap (alloc var9 (O_Int var4)))) (= var3 0)) (= var2 1000000)) (= var1 0)) (= var0 (newAddr (alloc var9 (O_Int var4))))))) (inv_main15 var5 var8 var7 var3 var8 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_S (read var7 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_S (read var7 (nthAddrRange var3 var1))) (not (within var3 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0) (and (is-O_S (read var7 (nthAddrRange var3 var1))) (not (is-O_S (read var7 (nthAddrRange var3 var1)))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (not (within var2 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (not (is-O_S (read var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var1))) (not (within var2 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (and (is-O_S (read var3 (nthAddrRange var2 var1))) (not (= (n (getS (read var3 (nthAddrRange var2 var1)))) nullAddr)))))))
(check-sat)
