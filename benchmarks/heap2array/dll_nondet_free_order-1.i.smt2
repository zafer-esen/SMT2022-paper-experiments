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
                   ((node (next Addr) (prev Addr)))))
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
(declare-fun inv_main11 (Heap Int Int Addr Int) Bool)
(declare-fun inv_main14 (Heap Int Int Addr) Bool)
(declare-fun inv_main16 (Heap Int Int Addr Addr) Bool)
(declare-fun inv_main17 (Heap Int Int Addr Addr) Bool)
(declare-fun inv_main20 (Heap Int Int Addr Addr Addr) Bool)
(declare-fun inv_main23 (Heap Int Int Addr Addr Addr Int) Bool)
(declare-fun inv_main26 (Heap Int Int Addr Addr Addr) Bool)
(declare-fun inv_main29 (Heap Int Int Addr Addr) Bool)
(declare-fun inv_main3 (Heap Int) Bool)
(declare-fun inv_main33 (Heap Int Addr Addr) Bool)
(declare-fun inv_main36 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main8 (Heap Int Int Addr) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 3))) (inv_main3 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (inv_main23 var6 var5 var4 var3 var2 var1 var0)) (inv_main23 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 node) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main16 var12 var11 var10 var9 var8) (= var0 1)) (<= 0 (+ (+ (* (- 1) 1) var10) (* (- 1) 1)))) (= var7 (newAddr (allocHeap var12 (O_node var5))))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var6 (newHeap (allocHeap var12 (O_node var5))))) (= nullAddr var7))) (inv_main23 var6 var4 var3 var2 var1 var7 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (and (and (inv_main8 var4 var3 var2 var1) (= var0 (writeHeap var4 var1 (O_node (node var1 (prev (getnode (readHeap var4 var1)))))))) (is-O_node (readHeap var4 var1))) (is-O_node (readHeap var4 var1)))) (inv_main14 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (inv_main16 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ (* (- 1) 1) var2) (* (- 1) 1)))))) (inv_main17 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 node) (var3 Heap) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (and (inv_main3 var6 var5) (= var4 (newAddr (allocHeap var6 (O_node var2))))) (= var0 var5)) (= var1 var5)) (= var3 (newHeap (allocHeap var6 (O_node var2))))) (not (= nullAddr var4)))) (inv_main8 var3 var1 var0 var4))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (or (not (and (and (inv_main33 var4 var3 var2 var1) (= var0 (prev (getnode (readHeap var4 var1))))) (is-O_node (readHeap var4 var1)))) (inv_main36 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (and (and (inv_main17 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 var2 (O_node (node var1 (prev (getnode (readHeap var5 var2)))))))) (is-O_node (readHeap var5 var2))) (is-O_node (readHeap var5 var2)))) (inv_main29 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (or (not (inv_main11 var4 var3 var2 var1 var0)) (inv_main11 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 node) (var4 Heap) (var5 Addr) (var6 Int) (var7 Heap)) (or (not (and (and (and (and (and (and (inv_main3 var7 var6) (= var0 1)) (= var5 (newAddr (allocHeap var7 (O_node var3))))) (= var1 var6)) (= var2 var6)) (= var4 (newHeap (allocHeap var7 (O_node var3))))) (= nullAddr var5))) (inv_main11 var4 var2 var1 var5 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main29 var9 var8 var7 var6 var5) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 (writeHeap var9 var5 (O_node (node (next (getnode (readHeap var9 var5))) var6))))) (is-O_node (readHeap var9 var5))) (is-O_node (readHeap var9 var5)))) (inv_main33 var4 var3 var0 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (and (inv_main20 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 var1 (O_node (node var2 (prev (getnode (readHeap var6 var1)))))))) (is-O_node (readHeap var6 var1))) (is-O_node (readHeap var6 var1)))) (inv_main26 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main26 var12 var11 var10 var9 var8 var7) (= var0 (+ var4 (* (- 1) 1)))) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (= var5 var11)) (= var6 (writeHeap var12 var8 (O_node (node (next (getnode (readHeap var12 var8))) var7))))) (is-O_node (readHeap var12 var8))) (is-O_node (readHeap var12 var8)))) (inv_main16 var6 var5 var0 var3 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap) (var4 Addr) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (and (and (and (inv_main14 var7 var6 var5 var4) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (writeHeap var7 var4 (O_node (node (next (getnode (readHeap var7 var4))) var4))))) (is-O_node (readHeap var7 var4))) (is-O_node (readHeap var7 var4)))) (inv_main16 var3 var2 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 node) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main16 var11 var10 var9 var8 var7) (<= 0 (+ (+ (* (- 1) 1) var9) (* (- 1) 1)))) (= var6 (newAddr (allocHeap var11 (O_node var4))))) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var5 (newHeap (allocHeap var11 (O_node var4))))) (not (= nullAddr var6)))) (inv_main20 var5 var3 var2 var1 var0 var6))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (not (and (inv_main8 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (not (and (and (inv_main8 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))) (is-O_node (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (not (and (inv_main14 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (not (and (and (inv_main14 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))) (is-O_node (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main20 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main20 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))) (is-O_node (readHeap var5 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main26 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main26 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))) (is-O_node (readHeap var5 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))) (is-O_node (readHeap var4 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))) (is-O_node (readHeap var4 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Heap)) (not (and (inv_main33 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main36 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))))))
(check-sat)
