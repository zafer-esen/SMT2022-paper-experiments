(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status unsat)
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
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main4 (Heap AddrRange) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Heap) (var6 Heap)) (or (not (and (and (batchAllocPostHeap var6 var4 (O_Int var0) 10) (batchWritePostHeap var4 var5 (AddrRangeStart var3) defObj (AddrRangeSize var3))) (and (and (and (and (and (inv_main2 var6) (= var3 (AddrRange (ite (<= 0 9) (+ (HeapSize var6) 1) (HeapSize var6)) 10))) true) (= var1 var3)) (= var2 var3)) true))) (inv_main4 var5 var2))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Heap) (var6 Heap)) (or (not (and (and (and (and (and (inv_main2 var6) (= var3 (AddrRange (ite (<= 0 9) (+ (HeapSize var6) 1) (HeapSize var6)) 10))) true) (= var1 var3)) (= var2 var3)) true)) (batchAllocHeap var6 var6 (O_Int var0) 10 10))))
(assert (forall ((var0 Int) (var1 AddrRange) (var2 AddrRange) (var3 AddrRange) (var4 Heap) (var5 Heap) (var6 Heap)) (or (not (and (and (and (and (and (inv_main2 var6) (= var3 (AddrRange (ite (<= 0 9) (+ (HeapSize var6) 1) (HeapSize var6)) 10))) true) (= var1 var3)) (= var2 var3)) true)) (batchWriteHeap var4 var4 (AddrRangeStart var3) (AddrRangeStart var3) defObj (AddrRangeSize var3) (AddrRangeSize var3)))))
(assert (forall ((var0 AddrRange) (var1 Heap)) (not (and (inv_main4 var1 var0) (not (is-O_Int (readHeap var1 (nthAddrRange var0 0))))))))
(assert (forall ((var0 AddrRange) (var1 Heap)) (not (and (and (inv_main4 var1 var0) (not (withinHeap var0 (nthAddrRange var0 0)))) (is-O_Int (readHeap var1 (nthAddrRange var0 0)))))))
(assert (forall ((var0 AddrRange) (var1 Heap)) (not (and (and (inv_main4 var1 var0) (not (is-O_Int (readHeap var1 (nthAddrRange var0 0))))) (is-O_Int (readHeap var1 (nthAddrRange var0 0)))))))
(check-sat)
