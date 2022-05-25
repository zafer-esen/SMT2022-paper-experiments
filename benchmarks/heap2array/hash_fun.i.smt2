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
                   ((node (hash Int) (next Addr)))))
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
(declare-fun inv_main22 (Heap Addr Int Int Int Int Addr) Bool)
(declare-fun inv_main23 (Heap Addr Int Int Int Int Addr) Bool)
(declare-fun inv_main25 (Heap Addr Int) Bool)
(declare-fun inv_main26 (Heap Addr Int) Bool)
(declare-fun inv_main27 (Heap Addr Int) Bool)
(declare-fun inv_main29 (Heap Addr Int Int) Bool)
(declare-fun inv_main5 (Heap Addr Int) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Heap) (var7 Addr) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Addr) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main23 var13 var12 var11 var10 var9 var8 var7) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 (writeHeap var13 var7 (O_node (node var8 (next (getnode (readHeap var13 var7)))))))) (is-O_node (readHeap var13 var7))) (is-O_node (readHeap var13 var7)))) (inv_main5 var6 var0 var4))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main5 var3 var2 var1) (not (= var0 0))) (or (not (<= 0 var1)) (not (<= 0 (+ 1000000 (* (- 1) var1))))))) (inv_main5 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (inv_main5 var4 var3 var2) (not (= var0 0))) (<= 0 (+ 1000000 (* (- 1) var2)))) (<= 0 var2)) (or (not (<= 0 (+ (+ (* (- 1) var2) var1) (* (- 1) 1)))) (not (<= 0 (+ (+ (+ (* (- 1) var1) 100) var2) (* (- 1) 1))))))) (inv_main5 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Heap)) (or (not (and (and (inv_main2 var3) (= var1 nullAddr)) (= var2 var3))) (inv_main5 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Int) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main26 var6 var5 var4) (= var3 (next (getnode (readHeap var6 var5))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_node (readHeap var6 var5))) (not (= var3 nullAddr)))) (inv_main25 var2 var3 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main5 var3 var2 var1) (= var0 0)) (not (= var2 nullAddr)))) (inv_main25 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main25 var3 var2 var1) (= var0 (hash (getnode (readHeap var3 var2))))) (is-O_node (readHeap var3 var2)))) (inv_main29 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 node) (var3 Heap) (var4 Int) (var5 Int) (var6 Int) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main5 var8 var7 var6) (= var0 (newAddr (allocHeap var8 (O_node var2))))) (= var1 1)) (= var3 (newHeap (allocHeap var8 (O_node var2))))) (not (= var4 0))) (<= 0 (+ 1000000 (* (- 1) var6)))) (<= 0 var6)) (<= 0 (+ (+ (+ (* (- 1) var5) 100) var6) (* (- 1) 1)))) (<= 0 (+ (+ (* (- 1) var6) var5) (* (- 1) 1))))) (inv_main22 var3 var7 var6 var5 var1 var5 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (or (not (inv_main27 var2 var1 var0)) (inv_main26 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main29 var11 var10 var9 var8) (or (and (<= 0 (+ (+ (+ (* (- 1) var3) 100) var4) (* (- 1) 1))) (= var7 1)) (and (not (<= 0 (+ (+ (+ (* (- 1) var3) 100) var4) (* (- 1) 1)))) (= var7 0)))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (hash (getnode (readHeap var11 var10))))) (= var4 var9)) (= var5 var10)) (= var6 var11)) (is-O_node (readHeap var11 var10))) (<= 0 (+ var8 (* (- 1) var9)))) (not (= var7 0)))) (inv_main26 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Heap)) (or (not (and (and (and (inv_main22 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var7 var1 (O_node (node (hash (getnode (readHeap var7 var1))) var6))))) (is-O_node (readHeap var7 var1))) (is-O_node (readHeap var7 var1)))) (inv_main23 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Heap)) (or (not (and (inv_main29 var3 var2 var1 var0) (not (<= 0 (+ var0 (* (- 1) var1)))))) (inv_main27 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main29 var11 var10 var9 var8) (or (and (<= 0 (+ (+ (+ (* (- 1) var3) 100) var4) (* (- 1) 1))) (= var7 1)) (and (not (<= 0 (+ (+ (+ (* (- 1) var3) 100) var4) (* (- 1) 1)))) (= var7 0)))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (hash (getnode (readHeap var11 var10))))) (= var4 var9)) (= var5 var10)) (= var6 var11)) (is-O_node (readHeap var11 var10))) (<= 0 (+ var8 (* (- 1) var9)))) (= var7 0))) (inv_main27 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Heap)) (not (and (inv_main22 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Heap)) (not (and (and (inv_main22 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))) (is-O_node (readHeap var6 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Heap)) (not (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Heap)) (not (and (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))) (is-O_node (readHeap var6 var0))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (not (and (inv_main25 var2 var1 var0) (not (is-O_node (readHeap var2 var1)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Heap)) (not (and (and (inv_main29 var3 var2 var1 var0) (not (is-O_node (readHeap var3 var2)))) (<= 0 (+ var0 (* (- 1) var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (not (inv_main27 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (not (and (inv_main26 var2 var1 var0) (not (is-O_node (readHeap var2 var1)))))))
(check-sat)
