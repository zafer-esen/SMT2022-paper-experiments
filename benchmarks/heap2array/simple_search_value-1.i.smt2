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
(declare-fun inv_main12 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main13 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main14 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main20 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main23 (Heap Addr Addr Addr Int Int) Bool)
(declare-fun inv_main26 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main29 (Heap Addr Addr Addr Int) Bool)
(declare-fun inv_main35 (Heap Addr Addr Addr Int Int Int) Bool)
(declare-fun inv_main36 (Heap Addr Addr Addr Int Int Int) Bool)
(declare-fun inv_main40 (Heap Addr Addr Addr Int Int Int) Bool)
(declare-fun inv_main46 (Heap Addr Addr Addr Int Int Int) Bool)
(declare-fun inv_main7 (Heap Addr Int) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main40 var14 var13 var12 var11 var10 var9 var8) (= var5 (n (getnode (readHeap var14 var11))))) (= var7 var8)) (= var6 var9)) (= var0 var10)) (= var1 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (is-O_node (readHeap var14 var11))) (= var5 nullAddr)) (or (= var7 0) (= var6 0)))) (inv_main46 var4 var3 var2 var5 var0 var6 var7))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main29 var11 var10 var9 var8 var7) (= var0 0)) (= var1 0)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var6 var10)) (= var5 (writeHeap var11 var8 (O_node (node (h (getnode (readHeap var11 var8))) 0))))) (is-O_node (readHeap var11 var8))) (is-O_node (readHeap var11 var8))) (= var6 nullAddr))) (inv_main46 var5 var6 var4 var6 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main26 var11 var10 var9 var8 var7) (= var0 (+ var2 1))) (= var1 (n (getnode (readHeap var11 var8))))) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 var10)) (= var6 var11)) (is-O_node (readHeap var11 var8)))) (inv_main12 var6 var5 var4 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 node) (var3 Heap) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (inv_main2 var5) (= var1 0)) (= var4 (newAddr (allocHeap var5 (O_node var2))))) (= var3 (newHeap (allocHeap var5 (O_node var2))))) (not (= var4 nullAddr)))) (inv_main12 var3 var4 var0 var4 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (inv_main12 var4 var3 var2 var1 var0) (<= 0 (+ (+ (* (- 1) var0) 10) (* (- 1) 1))))) (inv_main14 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (inv_main12 var5 var4 var3 var2 var1) (not (<= 0 (+ (+ (* (- 1) var1) 10) (* (- 1) 1))))) (not (= var0 0)))) (inv_main14 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 node) (var9 Heap) (var10 Heap) (var11 Addr) (var12 Int) (var13 Addr) (var14 Addr) (var15 Addr) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main14 var16 var15 var14 var13 var12) (= var0 var12)) (= var2 var13)) (= var4 var14)) (= var6 var15)) (= var9 (writeHeap var16 var13 (O_node (node var12 (n (getnode (readHeap var16 var13)))))))) (is-O_node (readHeap var16 var13))) (is-O_node (readHeap var16 var13))) (= var11 (newAddr (allocHeap var9 (O_node var8))))) (= var1 var0)) (= var3 var2)) (= var5 var4)) (= var7 var6)) (= var10 (newHeap (allocHeap var9 (O_node var8))))) (not (= var11 nullAddr)))) (inv_main20 var10 var7 var11 var3 var1))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (inv_main13 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 var2 (O_node (node var1 (n (getnode (readHeap var5 var2)))))))) (is-O_node (readHeap var5 var2))) (is-O_node (readHeap var5 var2)))) (inv_main29 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (or (not (inv_main7 var2 var1 var0)) (inv_main7 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 node) (var2 Heap) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (inv_main2 var4) (= var0 1)) (= var3 (newAddr (allocHeap var4 (O_node var1))))) (= var2 (newHeap (allocHeap var4 (O_node var1))))) (= var3 nullAddr))) (inv_main7 var2 var3 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (inv_main20 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 var2 (O_node (node (h (getnode (readHeap var5 var2))) var3))))) (is-O_node (readHeap var5 var2))) (is-O_node (readHeap var5 var2)))) (inv_main26 var0 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Addr) (var8 Int) (var9 Int) (var10 Int) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main40 var14 var13 var12 var11 var10 var9 var8) (= var7 (n (getnode (readHeap var14 var11))))) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (is-O_node (readHeap var14 var11))) (not (= var7 nullAddr)))) (inv_main35 var6 var5 var4 var7 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main29 var11 var10 var9 var8 var7) (= var0 0)) (= var1 0)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var6 var10)) (= var5 (writeHeap var11 var8 (O_node (node (h (getnode (readHeap var11 var8))) 0))))) (is-O_node (readHeap var11 var8))) (is-O_node (readHeap var11 var8))) (not (= var6 nullAddr)))) (inv_main35 var5 var6 var4 var6 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main35 var15 var14 var13 var12 var11 var10 var9) (= var0 1)) (= var8 (h (getnode (readHeap var15 var12))))) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 var15)) (is-O_node (readHeap var15 var12))) (= var8 2))) (inv_main36 var7 var6 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main35 var14 var13 var12 var11 var10 var9 var8) (= var7 (h (getnode (readHeap var14 var11))))) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (is-O_node (readHeap var14 var11))) (not (= var7 2)))) (inv_main36 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Addr) (var13 Addr) (var14 Addr) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main36 var15 var14 var13 var12 var11 var10 var9) (= var0 1)) (= var8 (h (getnode (readHeap var15 var12))))) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 var15)) (is-O_node (readHeap var15 var12))) (= var8 6))) (inv_main40 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Int) (var11 Addr) (var12 Addr) (var13 Addr) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main36 var14 var13 var12 var11 var10 var9 var8) (= var7 (h (getnode (readHeap var14 var11))))) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (is-O_node (readHeap var14 var11))) (not (= var7 6)))) (inv_main40 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (inv_main23 var5 var4 var3 var2 var1 var0)) (inv_main23 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Addr) (var9 node) (var10 Heap) (var11 Heap) (var12 Addr) (var13 Int) (var14 Addr) (var15 Addr) (var16 Addr) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main14 var17 var16 var15 var14 var13) (= var0 1)) (= var1 var13)) (= var3 var14)) (= var5 var15)) (= var7 var16)) (= var10 (writeHeap var17 var14 (O_node (node var13 (n (getnode (readHeap var17 var14)))))))) (is-O_node (readHeap var17 var14))) (is-O_node (readHeap var17 var14))) (= var12 (newAddr (allocHeap var10 (O_node var9))))) (= var2 var1)) (= var4 var3)) (= var6 var5)) (= var8 var7)) (= var11 (newHeap (allocHeap var10 (O_node var9))))) (= var12 nullAddr))) (inv_main23 var11 var8 var12 var4 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (inv_main12 var5 var4 var3 var2 var1) (not (<= 0 (+ (+ (* (- 1) var1) 10) (* (- 1) 1))))) (= var0 0))) (inv_main13 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main14 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main14 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))) (is-O_node (readHeap var4 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main20 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main20 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))) (is-O_node (readHeap var4 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main26 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))) (is-O_node (readHeap var4 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main29 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var4 var1)))) (is-O_node (readHeap var4 var1))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main35 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main36 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (and (inv_main40 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var3)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (not (inv_main46 var6 var5 var4 var3 var2 var1 var0))))
(check-sat)
