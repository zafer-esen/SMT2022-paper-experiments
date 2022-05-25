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
(declare-fun inv_main11 (Heap Int Int Addr) Bool)
(declare-fun inv_main15 (Heap Int Int Addr Addr) Bool)
(declare-fun inv_main18 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main3 (Heap Int) Bool)
(declare-fun inv_main33 (Heap Int Addr Int Addr Int) Bool)
(declare-fun inv_main39 (Heap Int Addr Addr) Bool)
(declare-fun inv_main42 (Heap Int Addr) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 2))) (inv_main3 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 node) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main11 var9 var8 var7 var6) (<= 0 (+ var7 (* (- 1) 1)))) (= var5 (newAddr (allocHeap var9 (O_node var3))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var4 (newHeap (allocHeap var9 (O_node var3))))) (not (= nullAddr var5)))) (inv_main15 var4 var2 var1 var0 var5))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main15 var10 var9 var8 var7 var6) (= var0 (+ var3 (* (- 1) 1)))) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 (writeHeap var10 var6 (O_node (node var7))))) (is-O_node (readHeap var10 var6))) (is-O_node (readHeap var10 var6)))) (inv_main11 var5 var4 var0 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (or (not (and (and (and (inv_main3 var3 var2) (= var0 nullAddr)) (= var1 (+ var2 1))) (not (<= 0 (+ (+ (* (- 1) var2) 32) (* (- 1) 1)))))) (inv_main11 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (and (and (and (inv_main3 var4 var3) (= var0 nullAddr)) (= var1 (+ var3 1))) (<= 0 (+ (+ (* (- 1) var3) 32) (* (- 1) 1)))) (= var2 0))) (inv_main11 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Addr) (var5 Int) (var6 Heap) (var7 Addr) (var8 Int) (var9 Addr) (var10 Int) (var11 Addr) (var12 Int) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main33 var13 var12 var11 var10 var9 var8) (= var0 (+ var1 1))) (= var7 (next (getnode (readHeap var13 var9))))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 var13)) (is-O_node (readHeap var13 var9))) (not (= var7 nullAddr)))) (inv_main33 var6 var5 var4 var3 var7 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (and (and (inv_main11 var4 var3 var2 var1) (= var0 1)) (not (<= 0 (+ var2 (* (- 1) 1))))) (not (= var1 nullAddr)))) (inv_main33 var4 var3 var1 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Heap)) (or (not (and (and (and (inv_main3 var3 var2) (= var0 (+ var2 1))) (<= 0 (+ (+ (* (- 1) var2) 32) (* (- 1) 1)))) (not (= var1 0)))) (inv_main3 var3 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (inv_main18 var5 var4 var3 var2 var1 var0)) (inv_main18 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 node) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main11 var10 var9 var8 var7) (= var0 1)) (<= 0 (+ var8 (* (- 1) 1)))) (= var6 (newAddr (allocHeap var10 (O_node var4))))) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var5 (newHeap (allocHeap var10 (O_node var4))))) (= nullAddr var6))) (inv_main18 var5 var3 var2 var1 var6 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Heap) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main33 var12 var11 var10 var9 var8 var7) (= var4 (next (getnode (readHeap var12 var8))))) (= var5 var7)) (= var0 var8)) (= var6 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (is-O_node (readHeap var12 var8))) (= var4 nullAddr)) (not (= var6 var5)))) (inv_main42 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (or (not (and (and (and (inv_main11 var3 var2 var1 var0) (not (<= 0 (+ var1 (* (- 1) 1))))) (= var0 nullAddr)) (not (= var2 0)))) (inv_main42 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Int) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main39 var13 var12 var11 var10) (= var9 var4)) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 (writeHeap var8 var5 defObj))) (= var4 (next (getnode (readHeap var13 var10))))) (= var5 var10)) (= var6 var11)) (= var7 var12)) (= var8 var13)) (is-O_node (readHeap var13 var10))) (not (= var9 nullAddr)))) (inv_main39 var3 var2 var1 var9))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Heap) (var3 Addr) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main33 var12 var11 var10 var9 var8 var7) (= var3 (next (getnode (readHeap var12 var8))))) (= var4 var7)) (= var0 var8)) (= var5 var9)) (= var6 var10)) (= var1 var11)) (= var2 var12)) (is-O_node (readHeap var12 var8))) (= var3 nullAddr)) (= var5 var4)) (not (= var6 nullAddr)))) (inv_main39 var2 var1 var6 var6))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Heap)) (or (not (and (and (and (and (inv_main11 var3 var2 var1 var0) (not (<= 0 (+ var1 (* (- 1) 1))))) (= var0 nullAddr)) (= var2 0)) (not (= var0 nullAddr)))) (inv_main39 var3 var2 var0 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (and (inv_main15 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (and (and (inv_main15 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))) (is-O_node (readHeap var4 var0))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (inv_main33 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Heap)) (not (and (inv_main39 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Heap)) (not (inv_main42 var2 var1 var0))))
(check-sat)
