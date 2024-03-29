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
                   ((node (h Int) (n Addr)))))
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
(declare-fun inv_main11 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main13 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main14 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main19 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main25 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main27 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main31 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main32 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main33 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main7 (Heap Addr Int) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 node) (var2 Heap) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main2 var4) (= var3 (newAddr (allocHeap var4 (O_node var1))))) (= var2 (newHeap (allocHeap var4 (O_node var1))))) (not (= var3 nullAddr)))) (inv_main11 var2 var3 var0 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main11 var8 var7 var6 var5) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 (writeHeap var8 var7 (O_node (node 2 (n (getnode (readHeap var8 var7)))))))) (is-O_node (readHeap var8 var7))) (is-O_node (readHeap var8 var7))) (= var4 0))) (inv_main13 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main25 var9 var8 var7 var6) (= var0 (n (getnode (readHeap var9 var6))))) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (is-O_node (readHeap var9 var6))) (= var5 0))) (inv_main13 var4 var3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main13 var4 var3 var2 var1) (= var0 (writeHeap var4 var1 (O_node (node 2 (n (getnode (readHeap var4 var1)))))))) (is-O_node (readHeap var4 var1))) (is-O_node (readHeap var4 var1)))) (inv_main27 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (inv_main22 var4 var3 var2 var1 var0)) (inv_main22 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 node) (var8 Heap) (var9 Heap) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main14 var14 var13 var12 var11) (= var0 1)) (= var1 var11)) (= var3 var12)) (= var5 var13)) (= var8 (writeHeap var14 var11 (O_node (node 1 (n (getnode (readHeap var14 var11)))))))) (is-O_node (readHeap var14 var11))) (is-O_node (readHeap var14 var11))) (= var10 (newAddr (allocHeap var8 (O_node var7))))) (= var2 var1)) (= var4 var3)) (= var6 var5)) (= var9 (newHeap (allocHeap var8 (O_node var7))))) (= var10 nullAddr))) (inv_main22 var9 var6 var10 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main11 var8 var7 var6 var5) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 (writeHeap var8 var7 (O_node (node 2 (n (getnode (readHeap var8 var7)))))))) (is-O_node (readHeap var8 var7))) (is-O_node (readHeap var8 var7))) (not (= var4 0)))) (inv_main14 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main25 var9 var8 var7 var6) (= var0 (n (getnode (readHeap var9 var6))))) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (is-O_node (readHeap var9 var6))) (not (= var5 0)))) (inv_main14 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main32 var8 var7 var6 var5) (= var4 (n (getnode (readHeap var8 var5))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_node (readHeap var8 var5))) (not (= var4 nullAddr)))) (inv_main31 var3 var2 var1 var4))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (inv_main27 var7 var6 var5 var4) (= var0 var4)) (= var1 var5)) (= var3 var6)) (= var2 (writeHeap var7 var4 (O_node (node (h (getnode (readHeap var7 var4))) 0))))) (is-O_node (readHeap var7 var4))) (is-O_node (readHeap var7 var4))) (not (= var3 nullAddr)))) (inv_main31 var2 var3 var1 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 node) (var7 Heap) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main14 var13 var12 var11 var10) (= var0 var10)) (= var2 var11)) (= var4 var12)) (= var7 (writeHeap var13 var10 (O_node (node 1 (n (getnode (readHeap var13 var10)))))))) (is-O_node (readHeap var13 var10))) (is-O_node (readHeap var13 var10))) (= var9 (newAddr (allocHeap var7 (O_node var6))))) (= var1 var0)) (= var3 var2)) (= var5 var4)) (= var8 (newHeap (allocHeap var7 (O_node var6))))) (not (= var9 nullAddr)))) (inv_main19 var8 var5 var9 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main31 var8 var7 var6 var5) (= var4 (h (getnode (readHeap var8 var5))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_node (readHeap var8 var5))) (not (= var4 2)))) (inv_main33 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (or (not (inv_main7 var2 var1 var0)) (inv_main7 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 node) (var2 Heap) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (inv_main2 var4) (= var0 1)) (= var3 (newAddr (allocHeap var4 (O_node var1))))) (= var2 (newHeap (allocHeap var4 (O_node var1))))) (= var3 nullAddr))) (inv_main7 var2 var3 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main31 var8 var7 var6 var5) (= var4 (h (getnode (readHeap var8 var5))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_node (readHeap var8 var5))) (= var4 2))) (inv_main32 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main19 var4 var3 var2 var1) (= var0 (writeHeap var4 var1 (O_node (node (h (getnode (readHeap var4 var1))) var2))))) (is-O_node (readHeap var4 var1))) (is-O_node (readHeap var4 var1)))) (inv_main25 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main11 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main11 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var2)))) (is-O_node (readHeap var3 var2))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main14 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main14 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))) (is-O_node (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main19 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main19 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))) (is-O_node (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main25 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main13 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main13 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))) (is-O_node (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main27 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main27 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))) (is-O_node (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main31 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main33 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main32 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var0)))))))
(check-sat)
