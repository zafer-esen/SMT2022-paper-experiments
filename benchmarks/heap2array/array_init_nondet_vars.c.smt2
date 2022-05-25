(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status sat)
;===============================================================================
; Encoding of Heap sorts and operations
;-------------------------------------------------------------------------------
(define-sort Addr() Int)
(declare-datatypes ((AddrRange 0))
                   (((AddrRange (AddrRangeStart Addr) (AddrRangeSize Int)))))

(declare-datatypes ((HeapObject 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (defObj))))
(declare-datatypes ((BatchAllocResHeap 0) (AllocResHeap 0) (Heap 0))
                   (((BatchAllocResHeap   (newBatchHeap Heap) (newAddrRange AddrRange)))
                   ((AllocResHeap   (newHeap Heap) (newAddr Addr)))
                    ((HeapCtor (HeapSize Int)
                               (HeapContents (Array Addr HeapObject))))))
(define-fun nullAddr  () Addr 0)
(define-fun validHeap     ((h Heap) (p Addr)) Bool
  (and (>= (HeapSize h) p) (> p 0)))
(define-fun emptyHeap () Heap (
  HeapCtor 0 (( as const (Array Addr HeapObject)) defObj)))
(define-fun readHeap ((h Heap) (p Addr)) HeapObject
  (ite (validHeap h p)
       (select (HeapContents h) p)
       defObj))
(define-fun writeHeap ((h Heap) (p Addr) (o HeapObject)) Heap
  (ite (validHeap h p)
       (HeapCtor (HeapSize h) (store (HeapContents h) p o))
       h))
(define-fun allocHeap   ((h Heap) (o HeapObject)) AllocResHeap
  (AllocResHeap (HeapCtor (+ 1 (HeapSize h))
                    (store (HeapContents h) (+ 1 (HeapSize h)) o))
          (+ 1 (HeapSize h))))
(define-fun Heap-eq     ((h1 Heap) (h2 Heap)) Bool
  (forall ((p Addr))
          (and (= (validHeap h1 p) (validHeap h2 p))
               (= (readHeap h1 p) (readHeap h2 p)))))
(define-fun nthAddrRange((ar AddrRange) (n Int)) Addr
  (ite (and (>= n 0) (< n (AddrRangeSize ar)))
       (+ (AddrRangeStart ar) n)
       nullAddr))
(define-fun withinHeap ((ar AddrRange ) (p Addr)) Bool
  (and (>= p (AddrRangeStart ar)) (< p (+ (AddrRangeStart ar) (AddrRangeSize ar)))))

(declare-fun batchAllocHeap     (Heap Heap HeapObject Int Int) Bool)
(declare-fun batchAllocPostHeap (Heap Heap HeapObject Int) Bool)

(assert (forall ((h1 Heap) (h2 Heap) (o HeapObject) (n1 Int) (n2 Int))
                (=> (and (> n2 0) (batchAllocHeap h1 h2 o n1 n2))
                   (batchAllocHeap h1 (newHeap (allocHeap h2 o)) o n1 (- n2 1)))))
(assert (forall ((h1 Heap) (h2 Heap) (o HeapObject) (n1 Int) (n2 Int))
                (=> (and (<= n2 0) (batchAllocHeap h1 h2 o n1 n2))
                   (batchAllocPostHeap h1 h2 o n1))))

(declare-fun batchWriteHeap     (Heap Heap Addr Addr HeapObject Int Int) Bool)
(declare-fun batchWritePostHeap (Heap Heap Addr HeapObject Int) Bool)

(assert (forall ((h1 Heap) (h2 Heap) (a1 Addr) (a2 Addr) (o HeapObject) (n1 Int) (n2 Int))
                (=> (and (> n2 0) (batchWriteHeap h1 h2 a1 a2 o n1 n2))
                   (batchWriteHeap h1 (writeHeap h2 a2 o) a1 (+ a2 1) o n1 (- n2 1)))))
(assert (forall ((h1 Heap) (h2 Heap) (a1 Addr) (a2 Addr) (o HeapObject) (n1 Int) (n2 Int))
                (=> (and (<= n2 0) (batchWriteHeap h1 h2 a1 a2 o n1 n2))
                   (batchWritePostHeap h1 h2 a1 o n1))))

;===============================================================================
(declare-fun inv_main27 (Heap Int Int Int AddrRange Int) Bool)
(declare-fun inv_main3 (Heap Int) Bool)
(declare-fun inv_main35 (Heap Int Int Int AddrRange) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (= var1 emptyHeap)) (inv_main3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Heap) (var11 Heap) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Int) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main27 var18 var17 var16 var15 var14 var13) (= var2 var14)) (= var4 var15)) (= var6 var16)) (= var8 var17)) (= var10 (writeHeap var18 (nthAddrRange var14 var17) (O_Int (+ (+ var16 var17) var13))))) (is-O_Int (readHeap var18 (nthAddrRange var14 var17)))) (is-O_Int (readHeap var18 (nthAddrRange var14 var17)))) (<= 0 (+ (+ (* (- 1) (+ var8 1)) var4) (* (- 1) 1)))) (or (and (and (<= 0 (+ (+ (* (- 1) var0) 10000) (* (- 1) 1))) (<= 0 (+ var0 (* (- 1) 1)))) (= var12 1)) (and (not (and (<= 0 (+ var0 (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var0) 10000) (* (- 1) 1))))) (= var12 0)))) (= var1 var0)) (= var3 var2)) (= var5 var4)) (= var7 var6)) (= var9 (+ var8 1))) (= var11 var10)) (not (= var12 0)))) (inv_main27 var11 var9 var7 var5 var3 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Heap) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Heap) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Heap) (var25 Heap) (var26 Int) (var27 Int) (var28 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var13 (O_Int var7) var6) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var28 var27) (or (and (<= 0 (+ (+ (* (- 1) var0) 100000) (* (- 1) 1))) (= var3 1)) (and (not (<= 0 (+ (+ (* (- 1) var0) 100000) (* (- 1) 1)))) (= var3 0)))) (= var6 var0)) (= var4 var1)) (= var5 var27)) (= var2 var28)) (not (= var3 0))) (= var8 (AddrRange (ite (<= 0 (+ var6 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var6))) (= var9 var6)) (= var10 var4)) (= var11 var5)) true) (or (and (and (<= 0 (+ (+ (* (- 1) var10) 10000) (* (- 1) 1))) (<= 0 (+ var10 (* (- 1) 1)))) (= var14 1)) (and (not (and (<= 0 (+ var10 (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var10) 10000) (* (- 1) 1))))) (= var14 0)))) (= var17 var8)) (= var19 var9)) (= var21 var10)) (= var12 var11)) (= var24 var13)) (not (= var14 0))) (<= 0 (+ (+ (* (- 1) 1) var19) (* (- 1) 1)))) (or (and (and (<= 0 (+ (+ (* (- 1) var15) 10000) (* (- 1) 1))) (<= 0 (+ var15 (* (- 1) 1)))) (= var26 1)) (and (not (and (<= 0 (+ var15 (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var15) 10000) (* (- 1) 1))))) (= var26 0)))) (= var16 var15)) (= var18 var17)) (= var20 var19)) (= var22 var21)) (= var23 1)) (= var25 var24)) (not (= var26 0))))) (inv_main27 var25 var23 var22 var20 var18 var16))))
(assert (forall ((var0 Int) (var1 Int) (var2 Heap) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Heap) (var14 Int) (var15 Int) (var16 Int) (var17 AddrRange) (var18 AddrRange) (var19 Int) (var20 Int) (var21 Int) (var22 Int) (var23 Int) (var24 Heap) (var25 Heap) (var26 Int) (var27 Int) (var28 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var28 var27) (or (and (<= 0 (+ (+ (* (- 1) var0) 100000) (* (- 1) 1))) (= var3 1)) (and (not (<= 0 (+ (+ (* (- 1) var0) 100000) (* (- 1) 1)))) (= var3 0)))) (= var6 var0)) (= var4 var1)) (= var5 var27)) (= var2 var28)) (not (= var3 0))) (= var8 (AddrRange (ite (<= 0 (+ var6 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var6))) (= var9 var6)) (= var10 var4)) (= var11 var5)) true) (or (and (and (<= 0 (+ (+ (* (- 1) var10) 10000) (* (- 1) 1))) (<= 0 (+ var10 (* (- 1) 1)))) (= var14 1)) (and (not (and (<= 0 (+ var10 (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var10) 10000) (* (- 1) 1))))) (= var14 0)))) (= var17 var8)) (= var19 var9)) (= var21 var10)) (= var12 var11)) (= var24 var13)) (not (= var14 0))) (<= 0 (+ (+ (* (- 1) 1) var19) (* (- 1) 1)))) (or (and (and (<= 0 (+ (+ (* (- 1) var15) 10000) (* (- 1) 1))) (<= 0 (+ var15 (* (- 1) 1)))) (= var26 1)) (and (not (and (<= 0 (+ var15 (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var15) 10000) (* (- 1) 1))))) (= var26 0)))) (= var16 var15)) (= var18 var17)) (= var20 var19)) (= var22 var21)) (= var23 1)) (= var25 var24)) (not (= var26 0)))) (batchAllocHeap emptyHeap emptyHeap (O_Int var7) var6 var6))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (and (and (inv_main35 var5 var4 var3 var2 var1) (= var0 (+ var4 1))) (is-O_Int (readHeap var5 (nthAddrRange var1 var4)))) (<= 0 (+ (+ (* (- 1) (+ var4 1)) var2) (* (- 1) 1))))) (inv_main35 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Int) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main27 var11 var10 var9 var8 var7 var6) (= var0 1)) (= var1 var7)) (= var5 var8)) (= var2 var9)) (= var4 var10)) (= var3 (writeHeap var11 (nthAddrRange var7 var10) (O_Int (+ (+ var9 var10) var6))))) (is-O_Int (readHeap var11 (nthAddrRange var7 var10)))) (is-O_Int (readHeap var11 (nthAddrRange var7 var10)))) (not (<= 0 (+ (+ (* (- 1) (+ var4 1)) var5) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) 1) var5) (* (- 1) 1))))) (inv_main35 var3 var0 var2 var5 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap) (var17 Heap) (var18 Int) (var19 Int) (var20 Int) (var21 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var16 (O_Int var8) var7) (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var21 var20) (= var0 1)) (or (and (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1))) (= var4 1)) (and (not (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1)))) (= var4 0)))) (= var7 var1)) (= var5 var2)) (= var6 var20)) (= var3 var21)) (not (= var4 0))) (= var9 (AddrRange (ite (<= 0 (+ var7 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var7))) (= var11 var7)) (= var12 var5)) (= var14 var6)) true) (or (and (and (<= 0 (+ (+ (* (- 1) var12) 10000) (* (- 1) 1))) (<= 0 (+ var12 (* (- 1) 1)))) (= var18 1)) (and (not (and (<= 0 (+ var12 (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var12) 10000) (* (- 1) 1))))) (= var18 0)))) (= var10 var9)) (= var19 var11)) (= var13 var12)) (= var15 var14)) (= var17 var16)) (not (= var18 0))) (not (<= 0 (+ (+ (* (- 1) 1) var19) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) 1) var19) (* (- 1) 1)))))) (inv_main35 var17 var0 var13 var19 var10))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 AddrRange) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap) (var17 Heap) (var18 Int) (var19 Int) (var20 Int) (var21 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var21 var20) (= var0 1)) (or (and (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1))) (= var4 1)) (and (not (<= 0 (+ (+ (* (- 1) var1) 100000) (* (- 1) 1)))) (= var4 0)))) (= var7 var1)) (= var5 var2)) (= var6 var20)) (= var3 var21)) (not (= var4 0))) (= var9 (AddrRange (ite (<= 0 (+ var7 (- 1))) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) var7))) (= var11 var7)) (= var12 var5)) (= var14 var6)) true) (or (and (and (<= 0 (+ (+ (* (- 1) var12) 10000) (* (- 1) 1))) (<= 0 (+ var12 (* (- 1) 1)))) (= var18 1)) (and (not (and (<= 0 (+ var12 (* (- 1) 1))) (<= 0 (+ (+ (* (- 1) var12) 10000) (* (- 1) 1))))) (= var18 0)))) (= var10 var9)) (= var19 var11)) (= var13 var12)) (= var15 var14)) (= var17 var16)) (not (= var18 0))) (not (<= 0 (+ (+ (* (- 1) 1) var19) (* (- 1) 1))))) (<= 0 (+ (+ (* (- 1) 1) var19) (* (- 1) 1))))) (batchAllocHeap emptyHeap emptyHeap (O_Int var8) var7 var7))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main27 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var1 var4))))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main27 var5 var4 var3 var2 var1 var0) (not (withinHeap var1 (nthAddrRange var1 var4)))) (is-O_Int (readHeap var5 (nthAddrRange var1 var4)))))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main27 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var1 var4))))) (is-O_Int (readHeap var5 (nthAddrRange var1 var4)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main35 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 var3))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main35 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 var3)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main35 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 (nthAddrRange var0 var3))))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main35 var4 var3 var2 var1 var0) (not (withinHeap var0 (nthAddrRange var0 var3)))) (is-O_Int (readHeap var4 (nthAddrRange var0 var3)))))))
(assert (forall ((var0 AddrRange) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main35 var4 var3 var2 var1 var0) (not (<= 0 (+ (getInt (readHeap var4 (nthAddrRange var0 var3))) (* (- 1) (+ var3 2)))))) (is-O_Int (readHeap var4 (nthAddrRange var0 var3)))))))
(check-sat)
