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

(declare-datatypes ((HeapObject 0) (item 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_item (getitem item)) (defObj))
                   ((item (next Addr) (data Addr)))))
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
(declare-fun inv_main13 (Heap Int Addr Int Int Addr) Bool)
(declare-fun inv_main14 (Heap Int Addr Int Int Addr) Bool)
(declare-fun inv_main16 (Heap Int Addr Int Int Addr Addr) Bool)
(declare-fun inv_main2 (Heap Int) Bool)
(declare-fun inv_main21 (Heap Int Addr Int) Bool)
(declare-fun inv_main23 (Heap Int Addr Int Addr) Bool)
(declare-fun inv_main28 (Heap Int Addr Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 0))) (inv_main2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (and (and (inv_main13 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 var1 (O_item (item var4 (data (getitem (readHeap var6 var1)))))))) (is-O_item (readHeap var6 var1))) (is-O_item (readHeap var6 var1)))) (inv_main14 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 item) (var4 Heap) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap) (var14 Heap) (var15 Int) (var16 Int) (var17 Addr) (var18 Addr) (var19 Int) (var20 Int) (var21 Addr) (var22 Int) (var23 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main16 var23 var22 var21 var20 var19 var18 var17) (= var0 (newAddr (allocHeap var14 (O_item var3))))) (= var1 2)) (= var2 (+ var12 1))) (= var4 (newHeap (allocHeap var14 (O_item var3))))) (= var9 var18)) (= var5 var19)) (= var7 var20)) (= var6 var21)) (= var11 var22)) (= var13 (writeHeap var23 var18 (O_item (item (next (getitem (readHeap var23 var18))) var17))))) (is-O_item (readHeap var23 var18))) (is-O_item (readHeap var23 var18))) (or (and (<= 0 (+ (+ (* (- 1) var11) 20) (* (- 1) 1))) (= var16 1)) (and (not (<= 0 (+ (+ (* (- 1) var11) 20) (* (- 1) 1)))) (= var16 0)))) (= var8 (+ var7 1))) (= var10 var9)) (= var12 var11)) (= var14 var13)) (not (= var15 0))) (not (= var16 0)))) (inv_main13 var4 var2 var10 var8 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 item) (var5 Heap) (var6 Addr) (var7 Int) (var8 Heap) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main2 var10 var9) (= var0 (newAddr (allocHeap var8 (O_item var4))))) (= var1 2)) (= var2 0)) (= var3 (+ var7 1))) (= var5 (newHeap (allocHeap var8 (O_item var4))))) (= var6 nullAddr)) (= var7 var9)) (= var8 var10))) (inv_main13 var5 var3 var6 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Heap)) (or (not (and (and (inv_main21 var4 var3 var2 var1) (= var0 (next (getitem (readHeap var4 var2))))) (is-O_item (readHeap var4 var2)))) (inv_main23 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap) (var10 Int) (var11 Addr) (var12 Int) (var13 Addr) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main23 var15 var14 var13 var12 var11) (= var0 (+ var10 (* (- 1) 1)))) (= var1 var5)) (= var10 var6)) (= var2 var7)) (= var3 var8)) (= var4 (writeHeap var9 var7 defObj))) (= var5 var11)) (= var6 var12)) (= var7 var13)) (= var8 var14)) (= var9 (writeHeap var15 (data (getitem (readHeap var15 var13))) defObj))) (is-O_item (readHeap var15 var13))) (<= 0 (+ (+ (* (- 1) 1) var10) (* (- 1) 1))))) (inv_main28 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Addr) (var13 Int) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main28 var14 var13 var12 var11) (= var0 (+ var10 (* (- 1) 1)))) (= var1 var5)) (= var10 var6)) (= var2 var7)) (= var3 var8)) (= var4 (writeHeap var9 var7 defObj))) (= var5 (next (getitem (readHeap var14 var12))))) (= var6 var11)) (= var7 var12)) (= var8 var13)) (= var9 var14)) (is-O_item (readHeap var14 var12))) (<= 0 (+ (+ (* (- 1) 1) var10) (* (- 1) 1))))) (inv_main28 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Addr) (var13 Int) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main16 var14 var13 var12 var11 var10 var9 var8) (= var0 (+ var7 1))) (= var1 var9)) (= var2 var10)) (= var7 var11)) (= var3 var12)) (= var4 var13)) (= var5 (writeHeap var14 var9 (O_item (item (next (getitem (readHeap var14 var9))) var8))))) (is-O_item (readHeap var14 var9))) (is-O_item (readHeap var14 var9))) (= var6 0)) (not (<= 0 (+ (+ 1 var7) (* (- 1) 1))))) (<= 0 (+ (+ 1 var7) (* (- 1) 1))))) (inv_main28 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Addr) (var13 Addr) (var14 Int) (var15 Int) (var16 Addr) (var17 Int) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main16 var18 var17 var16 var15 var14 var13 var12) (= var3 var13)) (= var0 var14)) (= var2 var15)) (= var1 var16)) (= var5 var17)) (= var7 (writeHeap var18 var13 (O_item (item (next (getitem (readHeap var18 var13))) var12))))) (is-O_item (readHeap var18 var13))) (is-O_item (readHeap var18 var13))) (or (and (<= 0 (+ (+ (* (- 1) var5) 20) (* (- 1) 1))) (= var10 1)) (and (not (<= 0 (+ (+ (* (- 1) var5) 20) (* (- 1) 1)))) (= var10 0)))) (= var11 (+ var2 1))) (= var4 var3)) (= var6 var5)) (= var8 var7)) (not (= var9 0))) (= var10 0)) (not (<= 0 (+ var11 (* (- 1) 1))))) (<= 0 (+ var11 (* (- 1) 1))))) (inv_main28 var8 var6 var4 var11))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Addr) (var13 Int) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main16 var14 var13 var12 var11 var10 var9 var8) (= var0 (+ var7 1))) (= var1 var9)) (= var2 var10)) (= var7 var11)) (= var3 var12)) (= var4 var13)) (= var5 (writeHeap var14 var9 (O_item (item (next (getitem (readHeap var14 var9))) var8))))) (is-O_item (readHeap var14 var9))) (is-O_item (readHeap var14 var9))) (= var6 0)) (<= 0 (+ (+ 1 var7) (* (- 1) 1))))) (inv_main21 var5 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap) (var8 Heap) (var9 Int) (var10 Int) (var11 Int) (var12 Addr) (var13 Addr) (var14 Int) (var15 Int) (var16 Addr) (var17 Int) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main16 var18 var17 var16 var15 var14 var13 var12) (= var3 var13)) (= var0 var14)) (= var2 var15)) (= var1 var16)) (= var5 var17)) (= var7 (writeHeap var18 var13 (O_item (item (next (getitem (readHeap var18 var13))) var12))))) (is-O_item (readHeap var18 var13))) (is-O_item (readHeap var18 var13))) (or (and (<= 0 (+ (+ (* (- 1) var5) 20) (* (- 1) 1))) (= var10 1)) (and (not (<= 0 (+ (+ (* (- 1) var5) 20) (* (- 1) 1)))) (= var10 0)))) (= var11 (+ var2 1))) (= var4 var3)) (= var6 var5)) (= var8 var7)) (not (= var9 0))) (= var10 0)) (<= 0 (+ var11 (* (- 1) 1))))) (inv_main21 var8 var6 var4 var11))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (and (inv_main14 var6 var5 var4 var3 var2 var1) (= var0 (data (getitem (readHeap var6 (next (getitem (readHeap var6 var1)))))))) (is-O_item (readHeap var6 (next (getitem (readHeap var6 var1)))))) (is-O_item (readHeap var6 var1))) (not (= (next (getitem (readHeap var6 var1))) nullAddr))) (is-O_item (readHeap var6 var1)))) (inv_main16 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 item) (var2 Heap) (var3 Addr) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Heap)) (or (not (and (and (and (and (inv_main14 var8 var7 var6 var5 var4 var3) (= var0 (newAddr (allocHeap var8 (O_item var1))))) (= var2 (newHeap (allocHeap var8 (O_item var1))))) (= (next (getitem (readHeap var8 var3))) nullAddr)) (is-O_item (readHeap var8 var3)))) (inv_main16 var2 var7 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (inv_main13 var5 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (and (inv_main13 var5 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var5 var0)))) (is-O_item (readHeap var5 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (and (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var5 var0)))) (not (= (next (getitem (readHeap var5 var0))) nullAddr))) (is-O_item (readHeap var5 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (and (and (and (inv_main14 var5 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var5 (next (getitem (readHeap var5 var0))))))) (is-O_item (readHeap var5 var0))) (not (= (next (getitem (readHeap var5 var0))) nullAddr))) (is-O_item (readHeap var5 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap)) (not (and (inv_main16 var6 var5 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap)) (not (and (and (inv_main16 var6 var5 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var6 var1)))) (is-O_item (readHeap var6 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Heap)) (not (and (inv_main21 var3 var2 var1 var0) (not (is-O_item (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main23 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var4 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Heap)) (not (and (inv_main28 var3 var2 var1 var0) (not (is-O_item (readHeap var3 var1)))))))
(check-sat)
