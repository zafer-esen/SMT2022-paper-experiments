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

(declare-datatypes ((HeapObject 0) (sl_item 0) (sl 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_sl_item (getsl_item sl_item)) (O_sl (getsl sl)) (defObj))
                   ((sl_item (n1 Addr) (n2 Addr) (n3 Addr)))
                   ((sl (head Addr) (tail Addr)))))
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
(declare-fun inv_main10 (Heap Addr Addr) Bool)
(declare-fun inv_main11 (Heap Addr) Bool)
(declare-fun inv_main12 (Heap Addr Addr) Bool)
(declare-fun inv_main13 (Heap Addr Addr) Bool)
(declare-fun inv_main14 (Heap Addr Addr) Bool)
(declare-fun inv_main16 (Heap Addr Addr) Bool)
(declare-fun inv_main17 (Heap Addr Addr) Bool)
(declare-fun inv_main18 (Heap Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main26 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main27 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main30 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main31 (Heap Addr Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main36 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main38 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main39 (Heap Addr Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main44 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main46 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main47 (Heap Addr Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main52 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main54 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main55 (Heap Addr Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main57 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main60 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main61 (Heap Addr Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main63 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main66 (Heap Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main67 (Heap Addr Addr Addr Addr Addr Addr Addr) Bool)
(declare-fun inv_main72 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main74 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main75 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main78 (Heap Addr Addr Addr Addr) Bool)
(declare-fun inv_main8 (Heap Addr Addr) Bool)
(declare-fun inv_main9 (Heap Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main47 var16 var15 var14 var13 var12 var11 var10 var9) (or (and (not (= var9 (n2 (getsl_item (readHeap var16 var12))))) (= var7 1)) (and (= var9 (n2 (getsl_item (readHeap var16 var12)))) (= var7 0)))) (= var0 var10)) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (is-O_sl_item (readHeap var16 var12))) (not (= var7 0))) (not (= var8 0)))) (inv_main46 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main26 var14 var13 var12 var11 var10 var9 var8) (= var0 (head (getsl (readHeap var14 var12))))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 var13)) (= var7 var14)) (is-O_sl (readHeap var14 var12)))) (inv_main27 var7 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main30 var14 var13 var12 var11 var10 var9 var8) (= var0 (n3 (getsl_item (readHeap var14 var9))))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 var13)) (= var7 var14)) (is-O_sl_item (readHeap var14 var9)))) (inv_main27 var7 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (inv_main55 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var8 var2 (O_sl_item (sl_item var1 (n2 (getsl_item (readHeap var8 var2))) (n3 (getsl_item (readHeap var8 var2)))))))) (is-O_sl_item (readHeap var8 var2))) (is-O_sl_item (readHeap var8 var2)))) (inv_main54 var0 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (inv_main67 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var8 var2 (O_sl_item (sl_item (n1 (getsl_item (readHeap var8 var2))) (n2 (getsl_item (readHeap var8 var2))) var1))))) (is-O_sl_item (readHeap var8 var2))) (is-O_sl_item (readHeap var8 var2)))) (inv_main66 var0 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main46 var14 var13 var12 var11 var10 var9 var8) (= var0 (n1 (getsl_item (readHeap var14 var11))))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 var13)) (= var7 var14)) (is-O_sl_item (readHeap var14 var11)))) (inv_main44 var7 var6 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main39 var15 var14 var13 var12 var11 var10 var9 var8) (or (and (not (= var8 (n3 (getsl_item (readHeap var15 var10))))) (= var7 1)) (and (= var8 (n3 (getsl_item (readHeap var15 var10)))) (= var7 0)))) (= var0 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (is-O_sl_item (readHeap var15 var10))) (= var7 0))) (inv_main44 var6 var5 var4 var2 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main39 var16 var15 var14 var13 var12 var11 var10 var9) (or (and (not (= var9 (n3 (getsl_item (readHeap var16 var11))))) (= var7 1)) (and (= var9 (n3 (getsl_item (readHeap var16 var11)))) (= var7 0)))) (= var0 var10)) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (is-O_sl_item (readHeap var16 var11))) (not (= var7 0))) (= var8 0))) (inv_main44 var6 var5 var4 var2 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main72 var3 var2 var1 var0) (not (= (head (getsl (readHeap var3 var1))) nullAddr))) (is-O_sl (readHeap var3 var1)))) (inv_main74 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 sl_item) (var15 Heap) (var16 Heap) (var17 Addr) (var18 Addr) (var19 Addr) (var20 Addr) (var21 Addr) (var22 Addr) (var23 Addr) (var24 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main47 var24 var23 var22 var21 var20 var19 var18 var17) (or (and (not (= var17 (n2 (getsl_item (readHeap var24 var20))))) (= var0 1)) (and (= var17 (n2 (getsl_item (readHeap var24 var20)))) (= var0 0)))) (= var2 var18)) (= var4 var19)) (= var6 var20)) (= var8 var21)) (= var10 var22)) (= var12 var23)) (= var15 var24)) (is-O_sl_item (readHeap var24 var20))) (= var0 0)) (= var1 (newAddr (allocHeap var15 (O_sl_item var14))))) (= var3 var2)) (= var5 var4)) (= var7 var6)) (= var9 var8)) (= var11 var10)) (= var13 var12)) (= var16 (newHeap (allocHeap var15 (O_sl_item var14)))))) (inv_main52 var16 var13 var11 var9 var7 var5 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 sl_item) (var16 Heap) (var17 Heap) (var18 Addr) (var19 Addr) (var20 Addr) (var21 Addr) (var22 Addr) (var23 Addr) (var24 Addr) (var25 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main47 var25 var24 var23 var22 var21 var20 var19 var18) (or (and (not (= var18 (n2 (getsl_item (readHeap var25 var21))))) (= var0 1)) (and (= var18 (n2 (getsl_item (readHeap var25 var21)))) (= var0 0)))) (= var3 var19)) (= var5 var20)) (= var7 var21)) (= var9 var22)) (= var11 var23)) (= var13 var24)) (= var16 var25)) (is-O_sl_item (readHeap var25 var21))) (not (= var0 0))) (= var1 0)) (= var2 (newAddr (allocHeap var16 (O_sl_item var15))))) (= var4 var3)) (= var6 var5)) (= var8 var7)) (= var10 var9)) (= var12 var11)) (= var14 var13)) (= var17 (newHeap (allocHeap var16 (O_sl_item var15)))))) (inv_main52 var17 var14 var12 var10 var8 var6 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (inv_main57 var7 var6 var5 var4 var3 var2 var1) (= var0 (n2 (getsl_item (readHeap var7 var3))))) (is-O_sl_item (readHeap var7 var3)))) (inv_main61 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (and (inv_main17 var4 var3 var2) (= var0 var3)) (= var1 (writeHeap var4 (tail (getsl (readHeap var4 var3))) (O_sl_item (sl_item (n1 (getsl_item (readHeap var4 (tail (getsl (readHeap var4 var3)))))) (n2 (getsl_item (readHeap var4 (tail (getsl (readHeap var4 var3)))))) var2))))) (is-O_sl_item (readHeap var4 (tail (getsl (readHeap var4 var3)))))) (is-O_sl_item (readHeap var4 (tail (getsl (readHeap var4 var3)))))) (is-O_sl (readHeap var4 var3)))) (inv_main18 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (inv_main66 var9 var8 var7 var6 var5 var4 var3) (= var0 var7)) (= var1 var8)) (= var2 (writeHeap var9 var4 (O_sl_item (sl_item (n1 (getsl_item (readHeap var9 var4))) (n2 (getsl_item (readHeap var9 var4))) var3))))) (is-O_sl_item (readHeap var9 var4))) (is-O_sl_item (readHeap var9 var4)))) (inv_main18 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main54 var14 var13 var12 var11 var10 var9 var8) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 (writeHeap var14 var11 (O_sl_item (sl_item var8 (n2 (getsl_item (readHeap var14 var11))) (n3 (getsl_item (readHeap var14 var11)))))))) (is-O_sl_item (readHeap var14 var11))) (is-O_sl_item (readHeap var14 var11))) (= var7 0))) (inv_main18 var6 var5))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main60 var14 var13 var12 var11 var10 var9 var8) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 (writeHeap var14 var10 (O_sl_item (sl_item (n1 (getsl_item (readHeap var14 var10))) var8 (n3 (getsl_item (readHeap var14 var10)))))))) (is-O_sl_item (readHeap var14 var10))) (is-O_sl_item (readHeap var14 var10))) (= var7 0))) (inv_main18 var6 var5))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main38 var14 var13 var12 var11 var10 var9 var8) (= var0 (n2 (getsl_item (readHeap var14 var10))))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 var13)) (= var7 var14)) (is-O_sl_item (readHeap var14 var10)))) (inv_main36 var7 var6 var5 var4 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main31 var15 var14 var13 var12 var11 var10 var9 var8) (or (and (not (= var8 (tail (getsl (readHeap var15 var13))))) (= var7 1)) (and (= var8 (tail (getsl (readHeap var15 var13)))) (= var7 0)))) (= var0 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (is-O_sl (readHeap var15 var13))) (= var7 0))) (inv_main36 var6 var5 var4 var3 var1 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main31 var16 var15 var14 var13 var12 var11 var10 var9) (or (and (not (= var9 (tail (getsl (readHeap var16 var14))))) (= var7 1)) (and (= var9 (tail (getsl (readHeap var16 var14)))) (= var7 0)))) (= var0 var10)) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (is-O_sl (readHeap var16 var14))) (not (= var7 0))) (= var8 0))) (inv_main36 var6 var5 var4 var3 var1 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Addr) (var6 Heap)) (or (not (and (inv_main18 var6 var5) (not (= var4 0)))) (inv_main26 var6 var5 var5 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (inv_main74 var8 var7 var6 var5) (= var0 (head (getsl (readHeap var8 var6))))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_sl (readHeap var8 var6)))) (inv_main75 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main54 var14 var13 var12 var11 var10 var9 var8) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 (writeHeap var14 var11 (O_sl_item (sl_item var8 (n2 (getsl_item (readHeap var14 var11))) (n3 (getsl_item (readHeap var14 var11)))))))) (is-O_sl_item (readHeap var14 var11))) (is-O_sl_item (readHeap var14 var11))) (not (= var7 0)))) (inv_main57 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main60 var14 var13 var12 var11 var10 var9 var8) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 (writeHeap var14 var10 (O_sl_item (sl_item (n1 (getsl_item (readHeap var14 var10))) var8 (n3 (getsl_item (readHeap var14 var10)))))))) (is-O_sl_item (readHeap var14 var10))) (is-O_sl_item (readHeap var14 var10))) (not (= var7 0)))) (inv_main63 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (inv_main52 var7 var6 var5 var4 var3 var2 var1) (= var0 (n1 (getsl_item (readHeap var7 var4))))) (is-O_sl_item (readHeap var7 var4)))) (inv_main55 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (inv_main63 var7 var6 var5 var4 var3 var2 var1) (= var0 (n3 (getsl_item (readHeap var7 var2))))) (is-O_sl_item (readHeap var7 var2)))) (inv_main67 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (and (inv_main11 var3 var2) (= var0 nullAddr)) (= var1 (writeHeap var3 (tail (getsl (readHeap var3 var2))) (O_sl_item (sl_item nullAddr (n2 (getsl_item (readHeap var3 (tail (getsl (readHeap var3 var2)))))) (n3 (getsl_item (readHeap var3 (tail (getsl (readHeap var3 var2))))))))))) (is-O_sl_item (readHeap var3 (tail (getsl (readHeap var3 var2)))))) (is-O_sl_item (readHeap var3 (tail (getsl (readHeap var3 var2)))))) (is-O_sl (readHeap var3 var2)))) (inv_main16 var1 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main78 var9 var8 var7 var6 var5) (= var0 (writeHeap var4 var1 defObj))) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 (writeHeap var9 var7 (O_sl (sl var5 (tail (getsl (readHeap var9 var7)))))))) (is-O_sl (readHeap var9 var7))) (is-O_sl (readHeap var9 var7)))) (inv_main72 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap)) (or (not (and (inv_main18 var3 var2) (= var1 0))) (inv_main72 var3 var2 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main31 var16 var15 var14 var13 var12 var11 var10 var9) (or (and (not (= var9 (tail (getsl (readHeap var16 var14))))) (= var7 1)) (and (= var9 (tail (getsl (readHeap var16 var14)))) (= var7 0)))) (= var0 var10)) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (is-O_sl (readHeap var16 var14))) (not (= var7 0))) (not (= var8 0)))) (inv_main30 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 sl_item) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (inv_main8 var7 var6 var5) (= var0 (newAddr (allocHeap var4 (O_sl_item var1))))) (= var2 (newHeap (allocHeap var4 (O_sl_item var1))))) (= var3 var6)) (= var4 (writeHeap var7 var6 (O_sl (sl var5 (tail (getsl (readHeap var7 var6)))))))) (is-O_sl (readHeap var7 var6))) (is-O_sl (readHeap var7 var6)))) (inv_main10 var2 var3 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main75 var4 var3 var2 var1) (= var0 (n1 (getsl_item (readHeap var4 (head (getsl (readHeap var4 var2)))))))) (is-O_sl_item (readHeap var4 (head (getsl (readHeap var4 var2)))))) (is-O_sl (readHeap var4 var2)))) (inv_main78 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (inv_main27 var7 var6 var5 var4 var3 var2 var1) (= var0 (n3 (getsl_item (readHeap var7 var2))))) (is-O_sl_item (readHeap var7 var2)))) (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 sl_item) (var2 Heap) (var3 Addr) (var4 sl) (var5 Heap) (var6 Heap)) (or (not (and (and (and (and (inv_main2 var6) (= var0 (newAddr (allocHeap var5 (O_sl_item var1))))) (= var2 (newHeap (allocHeap var5 (O_sl_item var1))))) (= var3 (newAddr (allocHeap var6 (O_sl var4))))) (= var5 (newHeap (allocHeap var6 (O_sl var4)))))) (inv_main8 var2 var3 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (inv_main61 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var8 var2 (O_sl_item (sl_item (n1 (getsl_item (readHeap var8 var2))) var1 (n3 (getsl_item (readHeap var8 var2)))))))) (is-O_sl_item (readHeap var8 var2))) (is-O_sl_item (readHeap var8 var2)))) (inv_main60 var0 var7 var6 var5 var4 var3 var2))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main12 var3 var2 var1) (= var0 (writeHeap var3 (head (getsl (readHeap var3 var2))) (O_sl_item (sl_item var1 (n2 (getsl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) (n3 (getsl_item (readHeap var3 (head (getsl (readHeap var3 var2))))))))))) (is-O_sl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) (is-O_sl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) (is-O_sl (readHeap var3 var2)))) (inv_main13 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main10 var3 var2 var1) (= var0 (writeHeap var3 var2 (O_sl (sl (head (getsl (readHeap var3 var2))) var1))))) (is-O_sl (readHeap var3 var2))) (is-O_sl (readHeap var3 var2)))) (inv_main9 var0 var2))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main13 var3 var2 var1) (= var0 (writeHeap var3 (head (getsl (readHeap var3 var2))) (O_sl_item (sl_item (n1 (getsl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) var1 (n3 (getsl_item (readHeap var3 (head (getsl (readHeap var3 var2))))))))))) (is-O_sl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) (is-O_sl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) (is-O_sl (readHeap var3 var2)))) (inv_main14 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main14 var3 var2 var1) (= var0 (writeHeap var3 (head (getsl (readHeap var3 var2))) (O_sl_item (sl_item (n1 (getsl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) (n2 (getsl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) var1))))) (is-O_sl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) (is-O_sl_item (readHeap var3 (head (getsl (readHeap var3 var2)))))) (is-O_sl (readHeap var3 var2)))) (inv_main11 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main9 var2 var1) (= var0 (tail (getsl (readHeap var2 var1))))) (is-O_sl (readHeap var2 var1)))) (inv_main12 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (inv_main36 var7 var6 var5 var4 var3 var2 var1) (= var0 (n2 (getsl_item (readHeap var7 var3))))) (is-O_sl_item (readHeap var7 var3)))) (inv_main39 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main39 var16 var15 var14 var13 var12 var11 var10 var9) (or (and (not (= var9 (n3 (getsl_item (readHeap var16 var11))))) (= var7 1)) (and (= var9 (n3 (getsl_item (readHeap var16 var11)))) (= var7 0)))) (= var0 var10)) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (is-O_sl_item (readHeap var16 var11))) (not (= var7 0))) (not (= var8 0)))) (inv_main38 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (inv_main44 var7 var6 var5 var4 var3 var2 var1) (= var0 (n1 (getsl_item (readHeap var7 var4))))) (is-O_sl_item (readHeap var7 var4)))) (inv_main47 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main16 var3 var2 var1) (= var0 (writeHeap var3 (tail (getsl (readHeap var3 var2))) (O_sl_item (sl_item (n1 (getsl_item (readHeap var3 (tail (getsl (readHeap var3 var2)))))) var1 (n3 (getsl_item (readHeap var3 (tail (getsl (readHeap var3 var2))))))))))) (is-O_sl_item (readHeap var3 (tail (getsl (readHeap var3 var2)))))) (is-O_sl_item (readHeap var3 (tail (getsl (readHeap var3 var2)))))) (is-O_sl (readHeap var3 var2)))) (inv_main17 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main8 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main8 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main10 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main10 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main9 var1 var0) (not (is-O_sl (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main12 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1))))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main12 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1))))))) (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1)))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main13 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1))))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main13 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1))))))) (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1)))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main14 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main14 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1))))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main14 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1))))))) (is-O_sl_item (readHeap var2 (head (getsl (readHeap var2 var1)))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main11 var1 var0) (not (is-O_sl (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main11 var1 var0) (not (is-O_sl_item (readHeap var1 (tail (getsl (readHeap var1 var0))))))) (is-O_sl (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (and (inv_main11 var1 var0) (not (is-O_sl_item (readHeap var1 (tail (getsl (readHeap var1 var0))))))) (is-O_sl_item (readHeap var1 (tail (getsl (readHeap var1 var0)))))) (is-O_sl (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main16 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (tail (getsl (readHeap var2 var1))))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main16 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (tail (getsl (readHeap var2 var1))))))) (is-O_sl_item (readHeap var2 (tail (getsl (readHeap var2 var1)))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main17 var2 var1 var0) (not (is-O_sl (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main17 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (tail (getsl (readHeap var2 var1))))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main17 var2 var1 var0) (not (is-O_sl_item (readHeap var2 (tail (getsl (readHeap var2 var1))))))) (is-O_sl_item (readHeap var2 (tail (getsl (readHeap var2 var1)))))) (is-O_sl (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main26 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl (readHeap var6 var4)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main27 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (inv_main31 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl (readHeap var7 var5)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main30 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (inv_main39 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var7 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main38 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main44 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var3)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (inv_main47 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var7 var3)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main46 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var3)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main52 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var3)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (inv_main55 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var7 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (and (inv_main55 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var7 var1)))) (is-O_sl_item (readHeap var7 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main54 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var3)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (and (inv_main54 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var3)))) (is-O_sl_item (readHeap var6 var3))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main57 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (inv_main61 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var7 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (and (inv_main61 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var7 var1)))) (is-O_sl_item (readHeap var7 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main60 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (and (inv_main60 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var2)))) (is-O_sl_item (readHeap var6 var2))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main63 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (inv_main67 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var7 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (not (and (and (inv_main67 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var7 var1)))) (is-O_sl_item (readHeap var7 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main66 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (and (inv_main66 var6 var5 var4 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var6 var1)))) (is-O_sl_item (readHeap var6 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main72 var3 var2 var1 var0) (not (is-O_sl (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main74 var3 var2 var1 var0) (not (is-O_sl (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main75 var3 var2 var1 var0) (not (is-O_sl (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main75 var3 var2 var1 var0) (not (is-O_sl_item (readHeap var3 (head (getsl (readHeap var3 var1))))))) (is-O_sl (readHeap var3 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main78 var4 var3 var2 var1 var0) (not (is-O_sl (readHeap var4 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main78 var4 var3 var2 var1 var0) (not (is-O_sl (readHeap var4 var2)))) (is-O_sl (readHeap var4 var2))))))
(check-sat)
