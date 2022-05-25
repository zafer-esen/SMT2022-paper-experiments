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

(declare-datatypes ((HeapObject 0) (TData 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_TData (getTData TData)) (defObj))
                   ((TData (lo Addr) (hi Addr)))))
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
(declare-fun inv_main10 (Heap TData Int) Bool)
(declare-fun inv_main12 (Heap TData Int) Bool)
(declare-fun inv_main18 (Heap TData TData Addr Addr) Bool)
(declare-fun inv_main22 (Heap TData TData Addr Addr Int) Bool)
(declare-fun inv_main3 (Heap TData) Bool)
(assert (forall ((var0 TData) (var1 Heap)) (or (not (= var1 emptyHeap)) (inv_main3 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 TData) (var4 TData) (var5 TData) (var6 Heap) (var7 Heap) (var8 Int) (var9 TData) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main12 var10 var9 var8) (= var0 (hi var3))) (= var1 var8)) (= var4 var9)) (= var6 (writeHeap var10 (hi var9) (O_Int 8)))) (is-O_Int (readHeap var10 (hi var9)))) (is-O_Int (readHeap var10 (hi var9)))) (= var2 (lo var4))) (= var3 var4)) (= var5 var4)) (= var7 var6))) (inv_main18 var7 var5 var3 var2 var0))))
(assert (forall ((var0 TData) (var1 Addr) (var2 Int) (var3 TData) (var4 Int) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 TData) (var10 TData) (var11 Int) (var12 Heap) (var13 Heap) (var14 TData) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main3 var15 var14) (= var0 (TData (lo var10) var6))) (= var7 var2)) (= var9 (TData var1 (hi var3)))) (= var12 var5)) (= var1 (newAddr (allocHeap var15 (O_Int var4))))) (= var2 1)) (= var3 var14)) (= var5 (newHeap (allocHeap var15 (O_Int var4))))) (= var6 (newAddr (allocHeap var12 (O_Int var11))))) (= var8 var7)) (= var10 var9)) (= var13 (newHeap (allocHeap var12 (O_Int var11)))))) (inv_main10 var13 var0 var8))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 TData) (var4 TData) (var5 Heap)) (or (not (and (and (inv_main18 var5 var4 var3 var2 var1) (= var0 (getInt (readHeap var5 var2)))) (is-O_Int (readHeap var5 var2)))) (inv_main22 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 TData) (var3 Heap)) (or (not (and (and (and (inv_main10 var3 var2 var1) (= var0 (writeHeap var3 (lo var2) (O_Int 4)))) (is-O_Int (readHeap var3 (lo var2)))) (is-O_Int (readHeap var3 (lo var2))))) (inv_main12 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 TData) (var2 Heap)) (not (and (inv_main10 var2 var1 var0) (not (is-O_Int (readHeap var2 (lo var1))))))))
(assert (forall ((var0 Int) (var1 TData) (var2 Heap)) (not (and (and (inv_main10 var2 var1 var0) (not (is-O_Int (readHeap var2 (lo var1))))) (is-O_Int (readHeap var2 (lo var1)))))))
(assert (forall ((var0 Int) (var1 TData) (var2 Heap)) (not (and (inv_main12 var2 var1 var0) (not (is-O_Int (readHeap var2 (hi var1))))))))
(assert (forall ((var0 Int) (var1 TData) (var2 Heap)) (not (and (and (inv_main12 var2 var1 var0) (not (is-O_Int (readHeap var2 (hi var1))))) (is-O_Int (readHeap var2 (hi var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 TData) (var3 TData) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 TData) (var4 TData) (var5 Heap)) (not (and (inv_main22 var5 var4 var3 var2 var1 var0) (not (is-O_Int (readHeap var5 var1)))))))
(check-sat)
