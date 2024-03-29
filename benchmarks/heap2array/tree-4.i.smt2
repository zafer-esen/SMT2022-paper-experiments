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
                   ((node (left Addr) (right Addr) (parent Addr) (value Int)))))
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
(declare-fun inv_main13 (Heap Addr Addr) Bool)
(declare-fun inv_main16 (Heap Addr Addr) Bool)
(declare-fun inv_main19 (Heap Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Addr Addr Int) Bool)
(declare-fun inv_main24 (Heap Addr Addr) Bool)
(declare-fun inv_main25 (Heap Addr Addr) Bool)
(declare-fun inv_main30 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main31 (Heap Addr Addr) Bool)
(declare-fun inv_main34 (Heap Addr Addr) Bool)
(declare-fun inv_main35 (Heap Addr Addr) Bool)
(declare-fun inv_main36 (Heap Addr Addr) Bool)
(declare-fun inv_main37 (Heap Addr Addr) Bool)
(declare-fun inv_main51 (Heap Addr Addr) Bool)
(declare-fun inv_main55 (Heap Addr Addr) Bool)
(declare-fun inv_main56 (Heap Addr Addr) Bool)
(declare-fun inv_main57 (Heap Addr Addr) Bool)
(declare-fun inv_main63 (Heap Addr Addr) Bool)
(declare-fun inv_main67 (Heap Addr Addr) Bool)
(declare-fun inv_main7 (Heap Addr Addr) Bool)
(declare-fun inv_main71 (Heap Addr Addr) Bool)
(declare-fun inv_main82 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main83 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main89 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main90 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main91 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main94 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main96 (Heap Addr Addr Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main36 var3 var2 var1) (= var0 (writeHeap var3 (left (getnode (readHeap var3 var1))) (O_node (node (left (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) (right (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) var1 (value (getnode (readHeap var3 (left (getnode (readHeap var3 var1))))))))))) (is-O_node (readHeap var3 (left (getnode (readHeap var3 var1)))))) (is-O_node (readHeap var3 (left (getnode (readHeap var3 var1)))))) (is-O_node (readHeap var3 var1)))) (inv_main37 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main7 var3 var2 var1) (= var0 0)) (not (= var1 nullAddr)))) (inv_main25 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main56 var2 var1 var0) (= (value (getnode (readHeap var2 var0))) 0)) (is-O_node (readHeap var2 var0)))) (inv_main71 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (inv_main22 var7 var6 var5 var4) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (writeHeap var7 var5 (O_node (node (left (getnode (readHeap var7 var5))) (right (getnode (readHeap var7 var5))) (parent (getnode (readHeap var7 var5))) var4))))) (is-O_node (readHeap var7 var5))) (is-O_node (readHeap var7 var5)))) (inv_main7 var3 var1 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Heap)) (or (not (and (and (and (inv_main2 var3) (= var0 nullAddr)) (= var1 nullAddr)) (= var2 var3))) (inv_main7 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main67 var6 var5 var4) (= var3 (parent (getnode (readHeap var6 var4))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_node (readHeap var6 var4))) (not (= var3 nullAddr)))) (inv_main55 var2 var1 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (and (and (inv_main24 var2 var1 var0) (= var0 nullAddr)) (not (= var1 nullAddr))) (not (= var1 nullAddr))) (not (= var1 nullAddr)))) (inv_main55 var2 var1 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main13 var3 var2 var1) (= var0 (writeHeap var3 var1 (O_node (node nullAddr (right (getnode (readHeap var3 var1))) (parent (getnode (readHeap var3 var1))) (value (getnode (readHeap var3 var1)))))))) (is-O_node (readHeap var3 var1))) (is-O_node (readHeap var3 var1)))) (inv_main16 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main82 var8 var7 var6 var5) (= var4 (right (getnode (readHeap var8 var6))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_node (readHeap var8 var6))) (not (= var4 nullAddr)))) (inv_main83 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main25 var3 var2 var1) (= var0 (writeHeap var3 var1 (O_node (node (left (getnode (readHeap var3 var1))) (right (getnode (readHeap var3 var1))) nullAddr (value (getnode (readHeap var3 var1)))))))) (is-O_node (readHeap var3 var1))) (is-O_node (readHeap var3 var1)))) (inv_main24 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (inv_main37 var6 var5 var4) (= var0 (right (getnode (readHeap var6 var4))))) (= var1 var4)) (= var2 var5)) (= var3 var6)) (is-O_node (readHeap var6 var4)))) (inv_main24 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main7 var3 var2 var1) (= var0 0)) (= var1 nullAddr))) (inv_main24 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main30 var6 var5 var4 var3) (= var2 var4)) (= var0 var5)) (= var1 (writeHeap var6 var4 (O_node (node var3 (right (getnode (readHeap var6 var4))) (parent (getnode (readHeap var6 var4))) (value (getnode (readHeap var6 var4)))))))) (is-O_node (readHeap var6 var4))) (is-O_node (readHeap var6 var4))) (not (= var2 nullAddr)))) (inv_main31 var1 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main56 var2 var1 var0) (not (= (value (getnode (readHeap var2 var0))) 0))) (is-O_node (readHeap var2 var0)))) (inv_main67 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (inv_main19 var6 var5 var4) (= var1 var4)) (= var2 var5)) (= var3 (writeHeap var6 var5 (O_node (node (left (getnode (readHeap var6 var5))) (right (getnode (readHeap var6 var5))) var4 (value (getnode (readHeap var6 var5)))))))) (is-O_node (readHeap var6 var5))) (is-O_node (readHeap var6 var5)))) (inv_main22 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main16 var6 var5 var4) (= var1 var4)) (= var3 var5)) (= var2 (writeHeap var6 var4 (O_node (node (left (getnode (readHeap var6 var4))) var5 (parent (getnode (readHeap var6 var4))) (value (getnode (readHeap var6 var4)))))))) (is-O_node (readHeap var6 var4))) (is-O_node (readHeap var6 var4))) (= var3 nullAddr))) (inv_main22 var2 var3 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (and (inv_main57 var6 var5 var4) (= var3 (value (getnode (readHeap var6 (left (getnode (readHeap var6 var4)))))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_node (readHeap var6 (left (getnode (readHeap var6 var4)))))) (is-O_node (readHeap var6 var4))) (not (= var3 42)))) (inv_main63 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (and (inv_main24 var2 var1 var0) (= var0 nullAddr)) (not (= var1 nullAddr))) (= var1 nullAddr))) (inv_main51 var2 var1 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main31 var3 var2 var1) (= var0 (writeHeap var3 (left (getnode (readHeap var3 var1))) (O_node (node nullAddr (right (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) (parent (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) (value (getnode (readHeap var3 (left (getnode (readHeap var3 var1))))))))))) (is-O_node (readHeap var3 (left (getnode (readHeap var3 var1)))))) (is-O_node (readHeap var3 (left (getnode (readHeap var3 var1)))))) (is-O_node (readHeap var3 var1)))) (inv_main34 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main55 var2 var1 var0) (= (left (getnode (readHeap var2 var0))) nullAddr)) (is-O_node (readHeap var2 var0)))) (inv_main56 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (and (inv_main57 var6 var5 var4) (= var3 (value (getnode (readHeap var6 (left (getnode (readHeap var6 var4)))))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_node (readHeap var6 (left (getnode (readHeap var6 var4)))))) (is-O_node (readHeap var6 var4))) (= var3 42))) (inv_main56 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main91 var4 var3 var2 var1) (= var0 (writeHeap var4 (left (getnode (readHeap var4 var2))) defObj))) (is-O_node (readHeap var4 var2)))) (inv_main90 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main89 var3 var2 var1 var0) (= (left (getnode (readHeap var3 var1))) nullAddr)) (is-O_node (readHeap var3 var1)))) (inv_main90 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main89 var3 var2 var1 var0) (not (= (left (getnode (readHeap var3 var1))) nullAddr))) (is-O_node (readHeap var3 var1)))) (inv_main91 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main90 var3 var2 var1 var0) (not (= (right (getnode (readHeap var3 var1))) nullAddr))) (is-O_node (readHeap var3 var1)))) (inv_main94 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 node) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (inv_main7 var8 var7 var6) (not (= var0 0))) (= var5 (newAddr (allocHeap var8 (O_node var3))))) (= var1 var6)) (= var2 var7)) (= var4 (newHeap (allocHeap var8 (O_node var3))))) (not (= var5 nullAddr)))) (inv_main13 var4 var2 var5))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (inv_main83 var8 var7 var6 var5) (= var0 (right (getnode (readHeap var8 var6))))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_node (readHeap var8 var6)))) (inv_main82 var4 var3 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main67 var10 var9 var8) (= var1 (parent (getnode (readHeap var10 var8))))) (= var0 var8)) (= var4 var9)) (= var6 var10)) (is-O_node (readHeap var10 var8))) (= var1 nullAddr)) (= var2 nullAddr)) (= var3 var4)) (= var5 var4)) (= var7 var6))) (inv_main82 var7 var5 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main24 var6 var5 var4) (= var4 nullAddr)) (not (= var5 nullAddr))) (not (= var5 nullAddr))) (= var5 nullAddr)) (= var0 nullAddr)) (= var1 var5)) (= var2 var5)) (= var3 var6))) (inv_main82 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (inv_main94 var7 var6 var5 var4) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (writeHeap var7 (right (getnode (readHeap var7 var5))) defObj))) (is-O_node (readHeap var7 var5)))) (inv_main96 var3 var2 var1 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main90 var3 var2 var1 var0) (= (right (getnode (readHeap var3 var1))) nullAddr)) (is-O_node (readHeap var3 var1)))) (inv_main96 var3 var2 var1 var1))))
(assert (forall ((var0 Addr) (var1 node) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (inv_main24 var5 var4 var3) (= var0 (newAddr (allocHeap var5 (O_node var1))))) (= var2 (newHeap (allocHeap var5 (O_node var1))))) (not (= var3 nullAddr)))) (inv_main30 var2 var4 var3 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (and (and (inv_main16 var5 var4 var3) (= var0 var3)) (= var2 var4)) (= var1 (writeHeap var5 var3 (O_node (node (left (getnode (readHeap var5 var3))) var4 (parent (getnode (readHeap var5 var3))) (value (getnode (readHeap var5 var3)))))))) (is-O_node (readHeap var5 var3))) (is-O_node (readHeap var5 var3))) (not (= var2 nullAddr)))) (inv_main19 var1 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main35 var3 var2 var1) (= var0 (writeHeap var3 (left (getnode (readHeap var3 var1))) (O_node (node (left (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) (right (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) (parent (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) 42))))) (is-O_node (readHeap var3 (left (getnode (readHeap var3 var1)))))) (is-O_node (readHeap var3 (left (getnode (readHeap var3 var1)))))) (is-O_node (readHeap var3 var1)))) (inv_main36 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main34 var3 var2 var1) (= var0 (writeHeap var3 (left (getnode (readHeap var3 var1))) (O_node (node (left (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) nullAddr (parent (getnode (readHeap var3 (left (getnode (readHeap var3 var1)))))) (value (getnode (readHeap var3 (left (getnode (readHeap var3 var1))))))))))) (is-O_node (readHeap var3 (left (getnode (readHeap var3 var1)))))) (is-O_node (readHeap var3 (left (getnode (readHeap var3 var1)))))) (is-O_node (readHeap var3 var1)))) (inv_main35 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main96 var8 var7 var6 var5) (= var4 (parent (getnode (readHeap var8 var6))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_node (readHeap var8 var6))) (not (= var4 nullAddr)))) (inv_main89 var3 var2 var4 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main82 var8 var7 var6 var5) (= var3 (right (getnode (readHeap var8 var6))))) (= var0 var5)) (= var4 var6)) (= var1 var7)) (= var2 var8)) (is-O_node (readHeap var8 var6))) (= var3 nullAddr)) (not (= var4 nullAddr)))) (inv_main89 var2 var1 var4 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main55 var2 var1 var0) (not (= (left (getnode (readHeap var2 var0))) nullAddr))) (is-O_node (readHeap var2 var0)))) (inv_main57 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main13 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main13 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main16 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main16 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main19 var2 var1 var0) (not (is-O_node (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main19 var2 var1 var0) (not (is-O_node (readHeap var2 var1)))) (is-O_node (readHeap var2 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main22 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))) (is-O_node (readHeap var3 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main25 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main25 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main30 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main30 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))) (is-O_node (readHeap var3 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main31 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main31 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main31 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0)))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main34 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main34 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main34 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0)))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main35 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main35 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main35 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0)))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main36 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main36 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main36 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0)))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main37 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main51 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main55 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main57 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main57 var2 var1 var0) (not (is-O_node (readHeap var2 (left (getnode (readHeap var2 var0))))))) (is-O_node (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main63 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main56 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main71 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main67 var2 var1 var0) (not (is-O_node (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main82 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main83 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main89 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main91 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main90 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main94 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main96 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(check-sat)
