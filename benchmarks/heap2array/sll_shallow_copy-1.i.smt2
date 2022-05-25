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

(declare-datatypes ((HeapObject 0) (node 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_node (getnode node)) (defObj))
                   ((node (next Addr)))))
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
(declare-fun inv_main10 (Heap Addr Int) Bool)
(declare-fun inv_main14 (Heap Addr) Bool)
(declare-fun inv_main16 (Heap Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Addr Addr Int) Bool)
(declare-fun inv_main25 (Heap Addr) Bool)
(declare-fun inv_main26 (Heap Addr node) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (inv_main22 var3 var2 var1 var0)) (inv_main22 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 node) (var2 Addr) (var3 Addr) (var4 node) (var5 Heap) (var6 Heap) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main2 var8) (= var0 1)) (= var2 (newAddr (allocHeap var8 (O_node var1))))) (= var5 (newHeap (allocHeap var8 (O_node var1))))) (not (= nullAddr var2))) (= var7 (newAddr (allocHeap var5 (O_node var4))))) (= var3 var2)) (= var6 (newHeap (allocHeap var5 (O_node var4))))) (= nullAddr var7))) (inv_main22 var6 var3 var7 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main16 var3 var2 var1) (= var0 (writeHeap var3 var2 (O_node (node var1))))) (is-O_node (readHeap var3 var2))) (is-O_node (readHeap var3 var2)))) (inv_main14 var0 var2))))
(assert (forall ((var0 node) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main14 var2 var1) (= var0 (getnode (readHeap var2 var1)))) (is-O_node (readHeap var2 var1)))) (inv_main26 var2 var1 var0))))
(assert (forall ((var0 node) (var1 Addr) (var2 Addr) (var3 node) (var4 Heap) (var5 Heap) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (inv_main2 var7) (= var1 (newAddr (allocHeap var7 (O_node var0))))) (= var4 (newHeap (allocHeap var7 (O_node var0))))) (not (= nullAddr var1))) (= var6 (newAddr (allocHeap var4 (O_node var3))))) (= var2 var1)) (= var5 (newHeap (allocHeap var4 (O_node var3))))) (not (= nullAddr var6)))) (inv_main16 var5 var2 var6))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (or (not (inv_main10 var2 var1 var0)) (inv_main10 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 node) (var2 Heap) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (inv_main2 var4) (= var0 1)) (= var3 (newAddr (allocHeap var4 (O_node var1))))) (= var2 (newHeap (allocHeap var4 (O_node var1))))) (= nullAddr var3))) (inv_main10 var2 var3 var0))))
(assert (forall ((var0 Heap) (var1 node) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main26 var3 var2 var1) (= var0 (writeHeap var3 var2 (O_node var1)))) (is-O_node (readHeap var3 var2))) (is-O_node (readHeap var3 var2)))) (inv_main25 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (not (is-O_node (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main16 var2 var1 var0) (not (is-O_node (readHeap var2 var1)))) (is-O_node (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main14 var1 var0) (not (is-O_node (readHeap var1 var0)))))))
(assert (forall ((var0 node) (var1 Addr) (var2 Heap)) (not (and (inv_main26 var2 var1 var0) (not (is-O_node (readHeap var2 var1)))))))
(assert (forall ((var0 node) (var1 Addr) (var2 Heap)) (not (and (and (inv_main26 var2 var1 var0) (not (is-O_node (readHeap var2 var1)))) (is-O_node (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main25 var1 var0) (not (is-O_node (readHeap var1 var0)))))))
(check-sat)
