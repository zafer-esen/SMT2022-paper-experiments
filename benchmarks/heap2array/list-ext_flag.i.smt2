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
                   ((node (h Int) (flag Int) (n Addr)))))
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
(declare-fun inv_main14 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main15 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main20 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main21 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main23 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main24 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main27 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main3 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main30 (Heap Addr Addr Addr Int Int) Bool)
(declare-fun inv_main33 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main36 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main37 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main38 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main40 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main41 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main42 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main58 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main59 (Heap Addr Addr Addr Int Int) Bool)
(declare-fun inv_main6 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main63 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main67 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main72 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main9 (Heap Addr Addr Addr Int) Bool)
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (= var3 emptyHeap)) (inv_main3 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (inv_main30 var5 var4 var3 var2 var1 var0)) (inv_main30 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 node) (var10 Heap) (var11 Heap) (var12 Addr) (var13 Int) (var14 Addr) (var15 Addr) (var16 Addr) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main23 var17 var16 var15 var14 var13) (= var0 1)) (= var1 var13)) (= var3 var14)) (= var5 var15)) (= var7 var16)) (= var10 (writeHeap var17 var16 (O_node (node 1 (flag (getnode (readHeap var17 var16))) (n (getnode (readHeap var17 var16)))))))) (is-O_node (readHeap var17 var16))) (is-O_node (readHeap var17 var16))) (= var12 (newAddr (allocHeap var10 (O_node var9))))) (= var2 var1)) (= var4 var3)) (= var6 var5)) (= var8 var7)) (= var11 (newHeap (allocHeap var10 (O_node var9))))) (= var12 nullAddr))) (inv_main30 var11 var8 var6 var12 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 node) (var10 Heap) (var11 Heap) (var12 Addr) (var13 Int) (var14 Addr) (var15 Addr) (var16 Addr) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main24 var17 var16 var15 var14 var13) (= var0 1)) (= var1 var13)) (= var3 var14)) (= var5 var15)) (= var7 var16)) (= var10 (writeHeap var17 var16 (O_node (node 2 (flag (getnode (readHeap var17 var16))) (n (getnode (readHeap var17 var16)))))))) (is-O_node (readHeap var17 var16))) (is-O_node (readHeap var17 var16))) (= var12 (newAddr (allocHeap var10 (O_node var9))))) (= var2 var1)) (= var4 var3)) (= var6 var5)) (= var8 var7)) (= var11 (newHeap (allocHeap var10 (O_node var9))))) (= var12 nullAddr))) (inv_main30 var11 var8 var6 var12 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main63 var10 var9 var8 var7 var6) (= var5 (n (getnode (readHeap var10 var9))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var9))) (not (= var5 nullAddr)))) (inv_main67 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main15 var9 var8 var7 var6 var5) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 (writeHeap var9 var8 (O_node (node 3 (flag (getnode (readHeap var9 var8))) (n (getnode (readHeap var9 var8)))))))) (is-O_node (readHeap var9 var8))) (is-O_node (readHeap var9 var8)))) (inv_main36 var4 var2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main40 var11 var10 var9 var8 var7) (= var0 (+ var2 1))) (= var1 (n (getnode (readHeap var11 var10))))) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 var10)) (= var6 var11)) (is-O_node (readHeap var11 var10)))) (inv_main36 var6 var1 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 node) (var9 Heap) (var10 Heap) (var11 Addr) (var12 Int) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main23 var16 var15 var14 var13 var12) (= var0 var12)) (= var2 var13)) (= var4 var14)) (= var6 var15)) (= var9 (writeHeap var16 var15 (O_node (node 1 (flag (getnode (readHeap var16 var15))) (n (getnode (readHeap var16 var15)))))))) (is-O_node (readHeap var16 var15))) (is-O_node (readHeap var16 var15))) (= var11 (newAddr (allocHeap var9 (O_node var8))))) (= var1 var0)) (= var3 var2)) (= var5 var4)) (= var7 var6)) (= var10 (newHeap (allocHeap var9 (O_node var8))))) (not (= var11 nullAddr)))) (inv_main27 var10 var7 var5 var11 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 node) (var9 Heap) (var10 Heap) (var11 Addr) (var12 Int) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main24 var16 var15 var14 var13 var12) (= var0 var12)) (= var2 var13)) (= var4 var14)) (= var6 var15)) (= var9 (writeHeap var16 var15 (O_node (node 2 (flag (getnode (readHeap var16 var15))) (n (getnode (readHeap var16 var15)))))))) (is-O_node (readHeap var16 var15))) (is-O_node (readHeap var16 var15))) (= var11 (newAddr (allocHeap var9 (O_node var8))))) (= var1 var0)) (= var3 var2)) (= var5 var4)) (= var7 var6)) (= var10 (newHeap (allocHeap var9 (O_node var8))))) (not (= var11 nullAddr)))) (inv_main27 var10 var7 var5 var11 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (inv_main27 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 var4 (O_node (node (h (getnode (readHeap var5 var4))) (flag (getnode (readHeap var5 var4))) var2))))) (is-O_node (readHeap var5 var4))) (is-O_node (readHeap var5 var4)))) (inv_main33 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main36 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var9))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var9))) (= var5 3))) (inv_main37 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main41 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var9))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var9))) (not (= var5 1)))) (inv_main72 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main42 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var9))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var9))) (not (= var5 2)))) (inv_main72 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main37 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var9))))) (= var4 var6)) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (is-O_node (readHeap var10 var9))) (or (not (= var5 3)) (<= 0 (+ (+ (* (- 1) 20) var4) (* (- 1) 1)))))) (inv_main72 var3 var2 var1 var0 var4))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (inv_main9 var4 var3 var2 var1 var0)) (inv_main9 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 node) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (inv_main3 var10 var9 var8 var7) (= var0 1)) (= var6 (newAddr (allocHeap var10 (O_node var4))))) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var5 (newHeap (allocHeap var10 (O_node var4))))) (= var6 nullAddr))) (inv_main9 var5 var3 var6 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main20 var4 var3 var2 var1 var0) (not (= (flag (getnode (readHeap var4 var3))) 0))) (is-O_node (readHeap var4 var3)))) (inv_main23 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main38 var4 var3 var2 var1 var0) (= (flag (getnode (readHeap var4 var3))) 0)) (is-O_node (readHeap var4 var3)))) (inv_main42 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main38 var4 var3 var2 var1 var0) (not (= (flag (getnode (readHeap var4 var3))) 0))) (is-O_node (readHeap var4 var3)))) (inv_main41 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (inv_main59 var5 var4 var3 var2 var1 var0)) (inv_main59 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main37 var11 var10 var9 var8 var7) (= var0 1)) (= var5 (h (getnode (readHeap var11 var10))))) (= var4 var7)) (= var1 var8)) (= var6 var9)) (= var2 var10)) (= var3 var11)) (is-O_node (readHeap var11 var10))) (not (<= 0 (+ (+ (* (- 1) 20) var4) (* (- 1) 1))))) (= var5 3)) (= var6 nullAddr))) (inv_main59 var3 var6 var6 var1 var4 var0))))
(assert (forall ((var0 Int) (var1 Heap) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (inv_main21 var6 var5 var4 var3 var2) (= var1 (writeHeap var6 var5 (O_node (node (h (getnode (readHeap var6 var5))) var0 (n (getnode (readHeap var6 var5)))))))) (is-O_node (readHeap var6 var5))) (is-O_node (readHeap var6 var5)))) (inv_main20 var1 var5 var4 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main37 var10 var9 var8 var7 var6) (= var4 (h (getnode (readHeap var10 var9))))) (= var3 var6)) (= var0 var7)) (= var5 var8)) (= var1 var9)) (= var2 var10)) (is-O_node (readHeap var10 var9))) (not (<= 0 (+ (+ (* (- 1) 20) var3) (* (- 1) 1))))) (= var4 3)) (not (= var5 nullAddr)))) (inv_main58 var2 var5 var5 var0 var3))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main14 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ (* (- 1) var0) 20) (* (- 1) 1)))))) (inv_main15 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (inv_main14 var5 var4 var3 var2 var1) (<= 0 (+ (+ (* (- 1) var1) 20) (* (- 1) 1)))) (= var0 0))) (inv_main15 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (inv_main14 var6 var5 var4 var3 var2) (= var0 (+ var2 1))) (<= 0 (+ (+ (* (- 1) var2) 20) (* (- 1) 1)))) (not (= var1 0)))) (inv_main21 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (inv_main33 var10 var9 var8 var7 var6) (= var0 (n (getnode (readHeap var10 var9))))) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 var10)) (is-O_node (readHeap var10 var9)))) (inv_main14 var5 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main6 var8 var7 var6 var5) (= var0 0)) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 (writeHeap var8 var6 (O_node (node (h (getnode (readHeap var8 var6))) (flag (getnode (readHeap var8 var6))) 0))))) (is-O_node (readHeap var8 var6))) (is-O_node (readHeap var8 var6)))) (inv_main14 var4 var2 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main58 var10 var9 var8 var7 var6) (= var5 (n (getnode (readHeap var10 var9))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var9))) (not (= var5 nullAddr)))) (inv_main63 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap) (var11 Int) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main67 var15 var14 var13 var12 var11) (= var0 var6)) (= var1 var5)) (= var2 var8)) (= var3 var9)) (= var4 (writeHeap var10 var9 defObj))) (= var5 (n (getnode (readHeap var15 var14))))) (= var6 var11)) (= var7 var12)) (= var8 var13)) (= var9 var14)) (= var10 var15)) (is-O_node (readHeap var15 var14)))) (inv_main63 var4 var1 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main36 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var9))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var9))) (not (= var5 3)))) (inv_main38 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 node) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (inv_main3 var9 var8 var7 var6) (= var5 (newAddr (allocHeap var9 (O_node var3))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var4 (newHeap (allocHeap var9 (O_node var3))))) (not (= var5 nullAddr)))) (inv_main6 var4 var2 var5 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main20 var4 var3 var2 var1 var0) (= (flag (getnode (readHeap var4 var3))) 0)) (is-O_node (readHeap var4 var3)))) (inv_main24 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main41 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var9))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var9))) (= var5 1))) (inv_main40 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Int) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main42 var10 var9 var8 var7 var6) (= var5 (h (getnode (readHeap var10 var9))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_node (readHeap var10 var9))) (= var5 2))) (inv_main40 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main6 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main6 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var1)))) (is-O_node (readHeap var3 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main21 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main21 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))) (is-O_node (readHeap var4 var3))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main20 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main23 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main23 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))) (is-O_node (readHeap var4 var3))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main24 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main24 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))) (is-O_node (readHeap var4 var3))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main27 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main27 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))) (is-O_node (readHeap var4 var3))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main33 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main15 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main15 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))) (is-O_node (readHeap var4 var3))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main36 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main38 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main41 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main42 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main40 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main37 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main58 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main63 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main67 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var3)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (inv_main72 var4 var3 var2 var1 var0))))
(check-sat)
