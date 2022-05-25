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

(declare-datatypes ((HeapObject 0) (S 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_S (getS S)) (defObj))
                   ((S (n Addr)))))
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
(declare-fun inv_main15 (Heap AddrRange Int Int AddrRange Int Int Addr) Bool)
(declare-fun inv_main18 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main24 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main27 (Heap AddrRange Int Int) Bool)
(declare-fun inv_main5 (Heap AddrRange Int Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 S) (var4 Heap) (var5 Heap)) (or (not (and (batchAllocPostHeap emptyHeap var4 (O_S var3) 1000000) (and (and (= var5 emptyHeap) (= var2 (AddrRange (ite (<= 0 999999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 1000000))) true))) (inv_main5 var4 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 S) (var4 Heap) (var5 Heap)) (or (not (and (and (= var5 emptyHeap) (= var2 (AddrRange (ite (<= 0 999999) (+ (HeapSize emptyHeap) 1) (HeapSize emptyHeap)) 1000000))) true)) (batchAllocHeap emptyHeap emptyHeap (O_S var3) 1000000 1000000))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Addr) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main18 var10 var9 var8 var7) (= var0 1)) (= var1 0)) (= var5 (n (getS (readHeap var10 (nthAddrRange var9 var8)))))) (= var2 var7)) (= var6 var8)) (= var3 var9)) (= var4 var10)) (is-O_S (readHeap var10 (nthAddrRange var9 var8)))) (not (= var5 nullAddr))) (not (<= 0 (+ (+ (* (- 1) (+ var6 1)) 1000000) (* (- 1) 1)))))) (inv_main24 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main18 var9 var8 var7 var6) (= var0 0)) (= var4 (n (getS (readHeap var9 (nthAddrRange var8 var7)))))) (= var1 var6)) (= var5 var7)) (= var2 var8)) (= var3 var9)) (is-O_S (readHeap var9 (nthAddrRange var8 var7)))) (= var4 nullAddr)) (not (<= 0 (+ (+ (* (- 1) (+ var5 1)) 1000000) (* (- 1) 1)))))) (inv_main24 var3 var2 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (inv_main27 var4 var3 var2 var1) (= var0 (+ var2 1))) (is-O_S (readHeap var4 (nthAddrRange var3 var2))))) (inv_main24 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap)) (or (not (and (and (and (inv_main24 var4 var3 var2 var1) (= var0 (+ var2 1))) (<= 0 (+ (+ (* (- 1) var2) 1000000) (* (- 1) 1)))) (not (= var1 0)))) (inv_main24 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (or (not (and (and (inv_main24 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var1) 1000000) (* (- 1) 1)))) (= var0 0))) (inv_main27 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 Int) (var3 Int) (var4 AddrRange) (var5 Heap) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Int) (var11 AddrRange) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main15 var15 var14 var13 var12 var11 var10 var9 var8) (= var0 0)) (= var6 var9)) (= var7 var10)) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 (writeHeap var15 (nthAddrRange var11 var9) (O_S (S var8))))) (is-O_S (readHeap var15 (nthAddrRange var11 var9)))) (is-O_S (readHeap var15 (nthAddrRange var11 var9)))) (not (<= 0 (+ (+ (* (- 1) (+ var6 1)) var7) (* (- 1) 1)))))) (inv_main18 var5 var4 var0 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Heap) (var5 Addr) (var6 Int) (var7 Int) (var8 Int) (var9 AddrRange) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main18 var10 var9 var8 var7) (= var0 1)) (= var1 (+ var6 1))) (= var5 (n (getS (readHeap var10 (nthAddrRange var9 var8)))))) (= var2 var7)) (= var6 var8)) (= var3 var9)) (= var4 var10)) (is-O_S (readHeap var10 (nthAddrRange var9 var8)))) (not (= var5 nullAddr))) (<= 0 (+ (+ (* (- 1) (+ var6 1)) 1000000) (* (- 1) 1))))) (inv_main18 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main18 var9 var8 var7 var6) (= var0 (+ var5 1))) (= var4 (n (getS (readHeap var9 (nthAddrRange var8 var7)))))) (= var1 var6)) (= var5 var7)) (= var2 var8)) (= var3 var9)) (is-O_S (readHeap var9 (nthAddrRange var8 var7)))) (= var4 nullAddr)) (<= 0 (+ (+ (* (- 1) (+ var5 1)) 1000000) (* (- 1) 1))))) (inv_main18 var3 var2 var0 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap) (var4 AddrRange) (var5 Int) (var6 Int) (var7 AddrRange) (var8 Heap) (var9 Int) (var10 Int) (var11 Addr) (var12 Int) (var13 Int) (var14 AddrRange) (var15 Int) (var16 Int) (var17 AddrRange) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main15 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 (newAddr (allocHeap var8 (O_Int var2))))) (= var1 (+ var9 1))) (= var3 (newHeap (allocHeap var8 (O_Int var2))))) (= var9 var12)) (= var10 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 (writeHeap var18 (nthAddrRange var14 var12) (O_S (S var11))))) (is-O_S (readHeap var18 (nthAddrRange var14 var12)))) (is-O_S (readHeap var18 (nthAddrRange var14 var12)))) (<= 0 (+ (+ (* (- 1) (+ var9 1)) var10) (* (- 1) 1))))) (inv_main15 var3 var7 var6 var5 var4 var10 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 AddrRange) (var9 Heap)) (or (not (and (and (and (and (and (inv_main5 var9 var8 var7 var6) (= var0 (newAddr (allocHeap var9 (O_Int var4))))) (= var1 0)) (= var2 1000000)) (= var3 0)) (= var5 (newHeap (allocHeap var9 (O_Int var4)))))) (inv_main15 var5 var8 var7 var3 var8 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_S (readHeap var7 (nthAddrRange var3 var1))))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (and (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0) (not (withinHeap var3 (nthAddrRange var3 var1)))) (is-O_S (readHeap var7 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 AddrRange) (var4 Int) (var5 Int) (var6 AddrRange) (var7 Heap)) (not (and (and (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_S (readHeap var7 (nthAddrRange var3 var1))))) (is-O_S (readHeap var7 (nthAddrRange var3 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main18 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))) (is-O_S (readHeap var3 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (not (is-O_S (readHeap var3 (nthAddrRange var2 var1))))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main27 var3 var2 var1 var0) (not (withinHeap var2 (nthAddrRange var2 var1)))) (is-O_S (readHeap var3 (nthAddrRange var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 AddrRange) (var3 Heap)) (not (and (and (inv_main27 var3 var2 var1 var0) (not (= (n (getS (readHeap var3 (nthAddrRange var2 var1)))) nullAddr))) (is-O_S (readHeap var3 (nthAddrRange var2 var1)))))))
(check-sat)
