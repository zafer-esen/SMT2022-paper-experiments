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
(declare-fun inv_main15 (Heap Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main18 (Heap Int Int AddrRange Int Int) Bool)
(declare-fun inv_main22 (Heap Int Int AddrRange Int Int Int) Bool)
(declare-fun inv_main31 (Heap Int Int AddrRange Int Int Int Int Int) Bool)
(declare-fun inv_main4 (Heap Int Int AddrRange Int) Bool)
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var5 (O_Int var4) 100000) (and (and (and (and (and (and (= var6 0) (= var7 0)) (= var8 emptyHeap)) (= var1 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var2 var6)) (= var3 var7)) true))) (inv_main4 var5 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (and (and (and (and (and (= var6 0) (= var7 0)) (= var8 emptyHeap)) (= var1 (AddrRange (ite (<= 0 99999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 100000))) (= var2 var6)) (= var3 var7)) true)) (batchAllocHeap emptyHeap emptyHeap (O_Int var4) 100000 100000))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main22 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var1 1))) (= var8 (getInt (readHeap var15 (nthAddrRange var12 var9))))) (= var1 var9)) (= var2 var10)) (= var7 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (is-O_Int (readHeap var15 (nthAddrRange var12 var9)))) (not (= var8 var7)))) (inv_main22 var6 var5 var4 var3 var7 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main18 var12 var11 var10 var9 var8 var7) (= var0 0)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (= var5 var11)) (= var6 (writeHeap var12 (nthAddrRange var9 var7) (O_Int var8)))) (is-O_Int (readHeap var12 (nthAddrRange var9 var7)))) (is-O_Int (readHeap var12 (nthAddrRange var9 var7))))) (inv_main22 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main15 var14 var13 var12 var11 var10 var9 var8) (= var6 var8)) (= var7 var9)) (= var0 var10)) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var5 (writeHeap var14 (nthAddrRange var11 var8) (O_Int var4)))) (is-O_Int (readHeap var14 (nthAddrRange var11 var8)))) (is-O_Int (readHeap var14 (nthAddrRange var11 var8)))) (not (<= 0 (+ (+ (* (- 1) (+ var6 1)) 100000) (* (- 1) 1))))) (<= 0 var7)) (<= 0 (+ (+ (* (- 1) var7) 100000) (* (- 1) 1))))) (inv_main18 var5 var3 var2 var1 var0 var7))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 AddrRange) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main15 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var8 1))) (= var8 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var7 (writeHeap var15 (nthAddrRange var12 var9) (O_Int var6)))) (is-O_Int (readHeap var15 (nthAddrRange var12 var9)))) (is-O_Int (readHeap var15 (nthAddrRange var12 var9)))) (<= 0 (+ (+ (* (- 1) (+ var8 1)) 100000) (* (- 1) 1))))) (inv_main15 var7 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (inv_main4 var7 var6 var5 var4 var3) (= var2 0))) (inv_main15 var7 var6 var5 var4 var1 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 AddrRange) (var8 AddrRange) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Heap) (var14 Heap) (var15 Int) (var16 Int) (var17 Int) (var18 Int) (var19 AddrRange) (var20 Int) (var21 Int) (var22 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main22 var22 var21 var20 var19 var18 var17 var16) (= var0 (getInt (readHeap var22 (nthAddrRange var19 var16))))) (= var1 var16)) (= var3 var17)) (= var5 var18)) (= var7 var19)) (= var9 var20)) (= var11 var21)) (= var13 var22)) (is-O_Int (readHeap var22 (nthAddrRange var19 var16)))) (= var0 var5)) (or (and (<= 0 (+ var3 (* (- 1) var1))) (= var15 1)) (and (not (<= 0 (+ var3 (* (- 1) var1)))) (= var15 0)))) (= var2 var1)) (= var4 var3)) (= var6 var5)) (= var8 var7)) (= var10 var9)) (= var12 var11)) (= var14 var13)) (= var15 0))) (inv_main31 var14 var12 var10 var8 var6 var4 var2 var15 var15))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main15 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main15 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main15 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var0))))) (is-O_Int (readHeap var6 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main18 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var2 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main18 var5 var4 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var0)))) (is-O_Int (readHeap var5 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main18 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 (nthAddrRange var2 var0))))) (is-O_Int (readHeap var5 (nthAddrRange var2 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main22 var6 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var6 (nthAddrRange var3 var0))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main22 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var0)))) (is-O_Int (readHeap var6 (nthAddrRange var3 var0)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 AddrRange) (var6 Int) (var7 Int) (var8 Heap)) (not (inv_main31 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(check-sat)
