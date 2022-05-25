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
(declare-fun inv_main12 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main13 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main17 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main18 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main23 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main26 (Heap Int Addr Addr Addr Int) Bool)
(declare-fun inv_main29 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main3 (Heap Int) Bool)
(declare-fun inv_main33 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main37 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main40 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main44 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main49 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main53 (Heap Int Addr Addr Addr Addr) Bool)
(declare-fun inv_main57 (Heap Int Addr Addr Addr) Bool)
(declare-fun inv_main8 (Heap Int Addr Int) Bool)
(assert (forall ((var0 Int) (var1 Heap)) (or (not (and (= var1 emptyHeap) (= var0 1))) (inv_main3 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Heap)) (or (not (inv_main8 var3 var2 var1 var0)) (inv_main8 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 node) (var3 Heap) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (and (inv_main3 var6 var5) (= var0 1)) (= var4 (newAddr (allocHeap var6 (O_node var2))))) (= var1 var5)) (= var3 (newHeap (allocHeap var6 (O_node var2))))) (= var4 nullAddr))) (inv_main8 var3 var1 var4 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main33 var11 var10 var9 var8 var7) (= var0 0)) (= var5 (h (getnode (readHeap var11 var7))))) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var6 var10)) (= var4 var11)) (is-O_node (readHeap var11 var7))) (not (= var5 3))) (not (= var6 0)))) (inv_main40 var4 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (inv_main29 var10 var9 var8 var7 var6) (= var0 (n (getnode (readHeap var10 var6))))) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 var10)) (is-O_node (readHeap var10 var6)))) (inv_main12 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 node) (var3 Heap) (var4 Addr) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (inv_main3 var6 var5) (= var4 (newAddr (allocHeap var6 (O_node var2))))) (= var1 var5)) (= var3 (newHeap (allocHeap var6 (O_node var2))))) (not (= var4 nullAddr)))) (inv_main12 var3 var1 var4 var0 var4))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (and (and (inv_main12 var5 var4 var3 var2 var1) (not (= var0 0))) (not (= var4 0)))) (inv_main17 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main33 var11 var10 var9 var8 var7) (= var0 1)) (= var5 (h (getnode (readHeap var11 var7))))) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var6 var10)) (= var4 var11)) (is-O_node (readHeap var11 var7))) (not (= var5 3))) (= var6 0))) (inv_main44 var4 var0 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (and (and (and (inv_main23 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 var1 (O_node (node (h (getnode (readHeap var5 var1))) var2))))) (is-O_node (readHeap var5 var1))) (is-O_node (readHeap var5 var1)))) (inv_main29 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main40 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var6))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var6))) (= var5 1))) (inv_main37 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main44 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var6))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var6))) (= var5 2))) (inv_main37 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main53 var13 var12 var11 var10 var9 var8) (= var0 (writeHeap var7 var2 defObj))) (= var1 (n (getnode (readHeap var13 var9))))) (= var2 var8)) (= var3 var9)) (= var4 var10)) (= var5 var11)) (= var6 var12)) (= var7 var13)) (is-O_node (readHeap var13 var9)))) (inv_main49 var0 var6 var5 var4 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main33 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var6))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var6))) (= var5 3))) (inv_main49 var4 var3 var2 var1 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (and (and (inv_main12 var5 var4 var3 var2 var1) (not (= var0 0))) (= var4 0))) (inv_main18 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (inv_main26 var5 var4 var3 var2 var1 var0)) (inv_main26 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Int) (var9 node) (var10 Heap) (var11 Heap) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Int) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main17 var17 var16 var15 var14 var13) (= var0 1)) (= var2 var13)) (= var4 var14)) (= var6 var15)) (= var1 var16)) (= var10 (writeHeap var17 var13 (O_node (node 2 (n (getnode (readHeap var17 var13)))))))) (is-O_node (readHeap var17 var13))) (is-O_node (readHeap var17 var13))) (= var12 (newAddr (allocHeap var10 (O_node var9))))) (= var3 var2)) (= var5 var4)) (= var7 var6)) (= var8 0)) (= var11 (newHeap (allocHeap var10 (O_node var9))))) (= var12 nullAddr))) (inv_main26 var11 var8 var7 var12 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Int) (var9 node) (var10 Heap) (var11 Heap) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Int) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main18 var17 var16 var15 var14 var13) (= var0 1)) (= var2 var13)) (= var4 var14)) (= var6 var15)) (= var1 var16)) (= var10 (writeHeap var17 var13 (O_node (node 1 (n (getnode (readHeap var17 var13)))))))) (is-O_node (readHeap var17 var13))) (is-O_node (readHeap var17 var13))) (= var12 (newAddr (allocHeap var10 (O_node var9))))) (= var3 var2)) (= var5 var4)) (= var7 var6)) (= var8 1)) (= var11 (newHeap (allocHeap var10 (O_node var9))))) (= var12 nullAddr))) (inv_main26 var11 var8 var7 var12 var3 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (or (not (and (inv_main12 var5 var4 var3 var2 var1) (= var0 0))) (inv_main13 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Int) (var8 node) (var9 Heap) (var10 Heap) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main17 var16 var15 var14 var13 var12) (= var1 var12)) (= var3 var13)) (= var5 var14)) (= var0 var15)) (= var9 (writeHeap var16 var12 (O_node (node 2 (n (getnode (readHeap var16 var12)))))))) (is-O_node (readHeap var16 var12))) (is-O_node (readHeap var16 var12))) (= var11 (newAddr (allocHeap var9 (O_node var8))))) (= var2 var1)) (= var4 var3)) (= var6 var5)) (= var7 0)) (= var10 (newHeap (allocHeap var9 (O_node var8))))) (not (= var11 nullAddr)))) (inv_main23 var10 var7 var6 var11 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Int) (var8 node) (var9 Heap) (var10 Heap) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main18 var16 var15 var14 var13 var12) (= var1 var12)) (= var3 var13)) (= var5 var14)) (= var0 var15)) (= var9 (writeHeap var16 var12 (O_node (node 1 (n (getnode (readHeap var16 var12)))))))) (is-O_node (readHeap var16 var12))) (is-O_node (readHeap var16 var12))) (= var11 (newAddr (allocHeap var9 (O_node var8))))) (= var2 var1)) (= var4 var3)) (= var6 var5)) (= var7 1)) (= var10 (newHeap (allocHeap var9 (O_node var8))))) (not (= var11 nullAddr)))) (inv_main23 var10 var7 var6 var11 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main49 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var6))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var6))) (not (= var5 3)))) (inv_main53 var4 var3 var2 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (inv_main37 var10 var9 var8 var7 var6) (= var0 (n (getnode (readHeap var10 var6))))) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 var10)) (is-O_node (readHeap var10 var6)))) (inv_main33 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main13 var10 var9 var8 var7 var6) (= var0 1)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 (writeHeap var10 var6 (O_node (node 3 (n (getnode (readHeap var10 var6)))))))) (is-O_node (readHeap var10 var6))) (is-O_node (readHeap var10 var6)))) (inv_main33 var5 var0 var3 var2 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main40 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var6))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var6))) (not (= var5 1)))) (inv_main57 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main44 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var6))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var6))) (not (= var5 2)))) (inv_main57 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (and (inv_main17 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))) (is-O_node (readHeap var4 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main18 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (and (inv_main18 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))) (is-O_node (readHeap var4 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main23 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (and (inv_main23 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))) (is-O_node (readHeap var4 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))) (is-O_node (readHeap var4 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main33 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main40 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main44 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main37 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (and (inv_main49 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Heap)) (not (and (inv_main53 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Heap)) (not (inv_main57 var4 var3 var2 var1 var0))))
(check-sat)
