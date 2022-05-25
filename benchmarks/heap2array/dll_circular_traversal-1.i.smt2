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
                   ((node (data Int) (next Addr) (prev Addr)))))
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
(declare-fun inv_main12 (Heap Int Int Int Int Addr Int) Bool)
(declare-fun inv_main15 (Heap Int Int Int Int Addr) Bool)
(declare-fun inv_main16 (Heap Int Int Int Int Addr) Bool)
(declare-fun inv_main18 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main19 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main22 (Heap Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main25 (Heap Int Int Int Int Addr Addr Addr Int) Bool)
(declare-fun inv_main28 (Heap Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main29 (Heap Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main32 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main36 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main37 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main39 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main4 (Heap Int Int) Bool)
(declare-fun inv_main42 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main50 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main51 (Heap Int Int Addr Addr Int) Bool)
(declare-fun inv_main9 (Heap Int Int Int Int Addr) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var1 5) (= var2 emptyHeap)) (= var0 1))) (inv_main4 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main18 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ (* (- 1) 1) var3) (* (- 1) 1)))))) (inv_main19 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Int) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap) (var14 Int) (var15 Addr) (var16 Addr) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main37 var19 var18 var17 var16 var15 var14) (= var0 (+ var1 (* (- 1) 1)))) (= var1 var8)) (= var2 var7)) (= var3 nullAddr)) (= var4 var11)) (= var5 var12)) (= var6 var13)) (= var7 (prev (getnode (readHeap var19 var15))))) (= var8 var14)) (= var9 var15)) (= var10 var16)) (= var11 var17)) (= var12 var18)) (= var13 var19)) (is-O_node (readHeap var19 var15)))) (inv_main50 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Int) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap) (var14 Addr) (var15 Int) (var16 Addr) (var17 Addr) (var18 Int) (var19 Int) (var20 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main51 var20 var19 var18 var17 var16 var15) (= var0 (+ var1 (* (- 1) 1)))) (= var14 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 (writeHeap var13 var9 defObj))) (= var7 (prev (getnode (readHeap var20 var16))))) (= var8 var15)) (= var9 var16)) (= var10 var17)) (= var11 var18)) (= var12 var19)) (= var13 var20)) (is-O_node (readHeap var20 var16))) (not (= var14 nullAddr)))) (inv_main50 var6 var5 var4 var3 var14 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Int) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main42 var13 var12 var11 var10 var9 var8) (= var0 (+ var1 1))) (= var7 (next (getnode (readHeap var13 var9))))) (= var1 var8)) (= var2 var9)) (= var6 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (is-O_node (readHeap var13 var9))) (= var7 var6))) (inv_main37 var5 var4 var3 var6 var7 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (and (inv_main36 var5 var4 var3 var2 var1 var0) (= var3 (data (getnode (readHeap var5 var1))))) (is-O_node (readHeap var5 var1)))) (inv_main39 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 node) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main4 var9 var8 var7) (= var6 (newAddr (allocHeap var9 (O_node var4))))) (= var0 var7)) (= var1 var8)) (= var2 var7)) (= var3 var8)) (= var5 (newHeap (allocHeap var9 (O_node var4))))) (not (= nullAddr var6)))) (inv_main9 var5 var3 var2 var1 var0 var6))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main19 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var7 var2 (O_node (node (data (getnode (readHeap var7 var2))) var1 (prev (getnode (readHeap var7 var2)))))))) (is-O_node (readHeap var7 var2))) (is-O_node (readHeap var7 var2)))) (inv_main32 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (and (and (inv_main28 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var8 var1 (O_node (node var4 (next (getnode (readHeap var8 var1))) (prev (getnode (readHeap var8 var1)))))))) (is-O_node (readHeap var8 var1))) (is-O_node (readHeap var8 var1)))) (inv_main29 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (and (inv_main9 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 var1 (O_node (node (data (getnode (readHeap var6 var1))) var1 (prev (getnode (readHeap var6 var1)))))))) (is-O_node (readHeap var6 var1))) (is-O_node (readHeap var6 var1)))) (inv_main15 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 node) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main18 var15 var14 var13 var12 var11 var10 var9) (<= 0 (+ (+ (* (- 1) 1) var12) (* (- 1) 1)))) (= var8 (newAddr (allocHeap var15 (O_node var6))))) (= var0 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var7 (newHeap (allocHeap var15 (O_node var6))))) (not (= nullAddr var8)))) (inv_main22 var7 var5 var4 var3 var2 var1 var0 var8))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (and (inv_main15 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 var1 (O_node (node (data (getnode (readHeap var6 var1))) (next (getnode (readHeap var6 var1))) var1))))) (is-O_node (readHeap var6 var1))) (is-O_node (readHeap var6 var1)))) (inv_main16 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Int) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main42 var13 var12 var11 var10 var9 var8) (= var0 (+ var1 1))) (= var7 (next (getnode (readHeap var13 var9))))) (= var1 var8)) (= var2 var9)) (= var6 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (is-O_node (readHeap var13 var9))) (not (= var7 var6)))) (inv_main36 var5 var4 var3 var6 var7 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main32 var14 var13 var12 var11 var10 var9 var8) (= var0 1)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 var13)) (= var7 (writeHeap var14 var8 (O_node (node (data (getnode (readHeap var14 var8))) (next (getnode (readHeap var14 var8))) var9))))) (is-O_node (readHeap var14 var8))) (is-O_node (readHeap var14 var8)))) (inv_main36 var7 var6 var5 var1 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (and (inv_main50 var5 var4 var3 var2 var1 var0) (= var0 (data (getnode (readHeap var5 var1))))) (is-O_node (readHeap var5 var1)))) (inv_main51 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (inv_main12 var6 var5 var4 var3 var2 var1 var0)) (inv_main12 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 node) (var6 Heap) (var7 Addr) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main4 var10 var9 var8) (= var0 1)) (= var7 (newAddr (allocHeap var10 (O_node var5))))) (= var1 var8)) (= var2 var9)) (= var3 var8)) (= var4 var9)) (= var6 (newHeap (allocHeap var10 (O_node var5))))) (= nullAddr var7))) (inv_main12 var6 var4 var3 var2 var1 var7 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main29 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var5 (* (- 1) 1)))) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 var15)) (= var8 (writeHeap var16 var10 (O_node (node (data (getnode (readHeap var16 var10))) (next (getnode (readHeap var16 var10))) var9))))) (is-O_node (readHeap var16 var10))) (is-O_node (readHeap var16 var10)))) (inv_main18 var8 var7 var6 var0 var4 var3 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main16 var11 var10 var9 var8 var7 var6) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (= var5 (writeHeap var11 var6 (O_node (node var7 (next (getnode (readHeap var11 var6))) (prev (getnode (readHeap var11 var6)))))))) (is-O_node (readHeap var11 var6))) (is-O_node (readHeap var11 var6)))) (inv_main18 var5 var4 var3 var2 var1 var0 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (and (and (and (inv_main22 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var8 var1 (O_node (node (data (getnode (readHeap var8 var1))) var2 (prev (getnode (readHeap var8 var1)))))))) (is-O_node (readHeap var8 var1))) (is-O_node (readHeap var8 var1)))) (inv_main28 var0 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (or (not (inv_main25 var8 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main25 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 node) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main18 var16 var15 var14 var13 var12 var11 var10) (= var0 1)) (<= 0 (+ (+ (* (- 1) 1) var13) (* (- 1) 1)))) (= var9 (newAddr (allocHeap var16 (O_node var7))))) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (= var8 (newHeap (allocHeap var16 (O_node var7))))) (= nullAddr var9))) (inv_main25 var8 var6 var5 var4 var3 var2 var1 var9 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (and (inv_main39 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var6 var2 (O_node (node var1 (next (getnode (readHeap var6 var2))) (prev (getnode (readHeap var6 var2)))))))) (is-O_node (readHeap var6 var2))) (is-O_node (readHeap var6 var2)))) (inv_main42 var0 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main9 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main9 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))) (is-O_node (readHeap var5 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main15 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main15 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))) (is-O_node (readHeap var5 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main16 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main16 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))) (is-O_node (readHeap var5 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main22 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var0)))) (is-O_node (readHeap var7 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main28 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var0)))) (is-O_node (readHeap var7 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main29 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main29 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var1)))) (is-O_node (readHeap var7 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var1)))) (is-O_node (readHeap var6 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main32 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))) (is-O_node (readHeap var6 var0))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main36 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main39 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (and (inv_main39 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))) (is-O_node (readHeap var5 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main42 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main37 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main50 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main51 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var1)))))))
(check-sat)
