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
                   ((node (next Addr) (prev Addr) (data Int)))))
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
(declare-fun inv_main12 (Heap Int Int Int Int Int Addr) Bool)
(declare-fun inv_main15 (Heap Int Int Int Int Int Addr Int) Bool)
(declare-fun inv_main18 (Heap Int Int Int Int Int Addr) Bool)
(declare-fun inv_main19 (Heap Int Int Int Int Int Addr) Bool)
(declare-fun inv_main22 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main23 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main29 (Heap Int Int Int Int Addr Addr Int Addr) Bool)
(declare-fun inv_main32 (Heap Int Int Int Int Addr Addr Int Addr Int) Bool)
(declare-fun inv_main35 (Heap Int Int Int Int Addr Addr Int Addr) Bool)
(declare-fun inv_main36 (Heap Int Int Int Int Addr Addr Int Addr) Bool)
(declare-fun inv_main38 (Heap Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main4 (Heap Int Int) Bool)
(declare-fun inv_main41 (Heap Int Int Int Int Addr Addr Addr) Bool)
(declare-fun inv_main44 (Heap Int Int Int Int Addr Addr) Bool)
(declare-fun inv_main49 (Heap Int Int Addr Int) Bool)
(declare-fun inv_main56 (Heap Int Int Addr Int Int Addr Int Int) Bool)
(declare-fun inv_main57 (Heap Int Int Addr Int Int Addr Int Int) Bool)
(declare-fun inv_main61 (Heap Int Int Addr Int) Bool)
(declare-fun inv_main70 (Heap Int Int Addr Int Int Int Addr Int) Bool)
(declare-fun inv_main71 (Heap Int Int Addr Int Int Int Addr Int) Bool)
(declare-fun inv_main78 (Heap Int Int Addr Int Addr) Bool)
(declare-fun inv_main82 (Heap Int Int Addr Int Addr Addr) Bool)
(declare-fun inv_main85 (Heap Int Int Addr Int) Bool)
(assert (forall ((var0 Int) (var1 Int) (var2 Heap)) (or (not (and (and (= var1 2) (= var2 emptyHeap)) (= var0 1))) (inv_main4 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (and (and (inv_main29 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var9 var1 (O_node (node nullAddr (prev (getnode (readHeap var9 var1))) (data (getnode (readHeap var9 var1)))))))) (is-O_node (readHeap var9 var1))) (is-O_node (readHeap var9 var1)))) (inv_main35 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (inv_main22 var6 var5 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ (* (- 1) 1) var3) (* (- 1) 1)))))) (inv_main23 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 Addr) (var14 Int) (var15 Int) (var16 Addr) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main57 var19 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 (+ var10 (* (- 1) 1)))) (= var1 (next (getnode (readHeap var19 var13))))) (= var10 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 var18)) (= var9 var19)) (is-O_node (readHeap var19 var13))) (<= 0 (+ (+ (* (- 1) 1) var10) (* (- 1) 1))))) (inv_main57 var9 var8 var7 var6 var5 var4 var1 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (inv_main49 var6 var5 var4 var3 var2) (= var0 (+ var2 var5))) (= var1 (+ var2 var5))) (<= 0 (+ (+ 1 var2) (* (- 1) 1)))) (<= 0 (+ var2 (* (- 1) 1))))) (inv_main57 var6 var5 var4 var3 var2 var1 var3 var0 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 node) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main22 var16 var15 var14 var13 var12 var11 var10) (<= 0 (+ (+ (* (- 1) 1) var13) (* (- 1) 1)))) (= var9 (newAddr (allocHeap var16 (O_node var7))))) (= var0 var12)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (= var8 (newHeap (allocHeap var16 (O_node var7))))) (not (= nullAddr var9)))) (inv_main29 var8 var6 var5 var4 var3 var2 var1 var0 var9))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 node) (var6 Heap) (var7 Addr) (var8 Int) (var9 Int) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main4 var10 var9 var8) (= var7 (newAddr (allocHeap var10 (O_node var5))))) (= var0 var8)) (= var1 var8)) (= var2 var9)) (= var3 var8)) (= var4 var9)) (= var6 (newHeap (allocHeap var10 (O_node var5))))) (not (= nullAddr var7)))) (inv_main12 var6 var4 var3 var2 var1 var0 var7))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Int) (var9 Addr) (var10 Int) (var11 Int) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main78 var12 var11 var10 var9 var8 var7) (= var6 (next (getnode (readHeap var12 var7))))) (= var5 var7)) (= var0 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (is-O_node (readHeap var12 var7))) (not (= var6 var5)))) (inv_main82 var4 var3 var2 var1 var0 var5 var6))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Heap) (var14 Addr) (var15 Addr) (var16 Addr) (var17 Addr) (var18 Int) (var19 Addr) (var20 Int) (var21 Int) (var22 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main82 var22 var21 var20 var19 var18 var17 var16) (= var15 var6)) (= var0 var7)) (= var14 var8)) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 (writeHeap var13 var7 defObj))) (= var6 (next (getnode (readHeap var22 var16))))) (= var7 var16)) (= var8 var17)) (= var9 var18)) (= var10 var19)) (= var11 var20)) (= var12 var21)) (= var13 var22)) (is-O_node (readHeap var22 var16))) (not (= var15 var14)))) (inv_main82 var5 var4 var3 var2 var1 var14 var15))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (inv_main32 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main32 var9 var8 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 node) (var9 Heap) (var10 Addr) (var11 Addr) (var12 Addr) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main22 var17 var16 var15 var14 var13 var12 var11) (= var0 1)) (<= 0 (+ (+ (* (- 1) 1) var14) (* (- 1) 1)))) (= var10 (newAddr (allocHeap var17 (O_node var8))))) (= var1 var13)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (= var7 var16)) (= var9 (newHeap (allocHeap var17 (O_node var8))))) (= nullAddr var10))) (inv_main32 var9 var7 var6 var5 var4 var3 var2 var1 var10 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main12 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var7 var1 (O_node (node nullAddr (prev (getnode (readHeap var7 var1))) (data (getnode (readHeap var7 var1)))))))) (is-O_node (readHeap var7 var1))) (is-O_node (readHeap var7 var1)))) (inv_main18 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Int) (var13 Addr) (var14 Int) (var15 Int) (var16 Addr) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main57 var19 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 (+ var10 (* (- 1) 1)))) (= var1 (next (getnode (readHeap var19 var13))))) (= var10 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 var18)) (= var9 var19)) (is-O_node (readHeap var19 var13))) (not (<= 0 (+ (+ (* (- 1) 1) var10) (* (- 1) 1)))))) (inv_main56 var9 var8 var7 var6 var5 var4 var1 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (inv_main49 var6 var5 var4 var3 var2) (= var0 (+ var2 var5))) (= var1 (+ var2 var5))) (<= 0 (+ (+ 1 var2) (* (- 1) 1)))) (not (<= 0 (+ var2 (* (- 1) 1)))))) (inv_main56 var6 var5 var4 var3 var2 var1 var3 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Int) (var15 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main38 var15 var14 var13 var12 var11 var10 var9 var8) (= var0 var8)) (= var1 var9)) (= var7 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 (writeHeap var15 var8 (O_node (node var10 (prev (getnode (readHeap var15 var8))) (data (getnode (readHeap var15 var8)))))))) (is-O_node (readHeap var15 var8))) (is-O_node (readHeap var15 var8))) (not (= var7 nullAddr)))) (inv_main41 var6 var5 var4 var3 var2 var7 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Addr) (var13 Int) (var14 Int) (var15 Int) (var16 Addr) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main71 var19 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 (+ var10 (* (- 1) 1)))) (= var1 (next (getnode (readHeap var19 var12))))) (= var10 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 var18)) (= var9 var19)) (is-O_node (readHeap var19 var12))) (not (<= 0 (+ (+ (* (- 1) 1) var10) (* (- 1) 1)))))) (inv_main70 var9 var8 var7 var6 var5 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (inv_main61 var6 var5 var4 var3 var2) (= var0 (+ var2 var5))) (= var1 (+ var2 var5))) (<= 0 (+ (+ 1 var2) (* (- 1) 1)))) (not (<= 0 (+ var2 (* (- 1) 1)))))) (inv_main70 var6 var5 var4 var3 var2 var1 var0 var3 var2))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main18 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var7 var1 (O_node (node (next (getnode (readHeap var7 var1))) nullAddr (data (getnode (readHeap var7 var1)))))))) (is-O_node (readHeap var7 var1))) (is-O_node (readHeap var7 var1)))) (inv_main19 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (and (and (and (inv_main23 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var7 var1 (O_node (node var2 (prev (getnode (readHeap var7 var1))) (data (getnode (readHeap var7 var1)))))))) (is-O_node (readHeap var7 var1))) (is-O_node (readHeap var7 var1)))) (inv_main44 var0 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap) (var6 Int) (var7 Int) (var8 Int) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Addr) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main70 var16 var15 var14 var13 var12 var11 var10 var9 var8) (= var6 (data (getnode (readHeap var16 var9))))) (= var7 var10)) (= var0 var11)) (= var1 var12)) (= var2 var13)) (= var3 var14)) (= var4 var15)) (= var5 var16)) (is-O_node (readHeap var16 var9))) (not (= var7 var6)))) (inv_main85 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (or (not (and (and (inv_main61 var4 var3 var2 var1 var0) (not (<= 0 (+ (+ 1 var0) (* (- 1) 1))))) (not (= nullAddr var1)))) (inv_main78 var4 var3 var2 var1 var0 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Int) (var6 Int) (var7 Int) (var8 Int) (var9 Heap)) (or (not (and (and (and (inv_main35 var9 var8 var7 var6 var5 var4 var3 var2 var1) (= var0 (writeHeap var9 var1 (O_node (node (next (getnode (readHeap var9 var1))) nullAddr (data (getnode (readHeap var9 var1)))))))) (is-O_node (readHeap var9 var1))) (is-O_node (readHeap var9 var1)))) (inv_main36 var0 var8 var7 var6 var5 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (or (not (and (and (inv_main49 var5 var4 var3 var2 var1) (= var0 (+ var4 (* (- 1) 1)))) (not (<= 0 (+ (+ 1 var1) (* (- 1) 1)))))) (inv_main61 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap) (var7 Int) (var8 Int) (var9 Int) (var10 Addr) (var11 Int) (var12 Int) (var13 Int) (var14 Addr) (var15 Int) (var16 Int) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main70 var17 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var2 (* (- 1) 1)))) (= var7 (data (getnode (readHeap var17 var10))))) (= var8 var11)) (= var1 var12)) (= var2 var13)) (= var3 var14)) (= var4 var15)) (= var5 var16)) (= var6 var17)) (is-O_node (readHeap var17 var10))) (= var8 var7))) (inv_main61 var6 var5 var4 var3 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Addr) (var10 Int) (var11 Addr) (var12 Addr) (var13 Int) (var14 Int) (var15 Int) (var16 Int) (var17 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main36 var17 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 var9)) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (= var7 var16)) (= var8 (writeHeap var17 var9 (O_node (node (next (getnode (readHeap var17 var9))) (prev (getnode (readHeap var17 var9))) var10))))) (is-O_node (readHeap var17 var9))) (is-O_node (readHeap var17 var9)))) (inv_main38 var8 var7 var6 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Addr) (var13 Int) (var14 Int) (var15 Int) (var16 Addr) (var17 Int) (var18 Int) (var19 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main71 var19 var18 var17 var16 var15 var14 var13 var12 var11) (= var0 (+ var10 (* (- 1) 1)))) (= var1 (next (getnode (readHeap var19 var12))))) (= var10 var11)) (= var2 var12)) (= var3 var13)) (= var4 var14)) (= var5 var15)) (= var6 var16)) (= var7 var17)) (= var8 var18)) (= var9 var19)) (is-O_node (readHeap var19 var12))) (<= 0 (+ (+ (* (- 1) 1) var10) (* (- 1) 1))))) (inv_main71 var9 var8 var7 var6 var5 var4 var3 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (or (not (and (and (and (and (inv_main61 var6 var5 var4 var3 var2) (= var0 (+ var2 var5))) (= var1 (+ var2 var5))) (<= 0 (+ (+ 1 var2) (* (- 1) 1)))) (<= 0 (+ var2 (* (- 1) 1))))) (inv_main71 var6 var5 var4 var3 var2 var1 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (or (not (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0)) (inv_main15 var7 var6 var5 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 node) (var7 Heap) (var8 Addr) (var9 Int) (var10 Int) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main4 var11 var10 var9) (= var0 1)) (= var8 (newAddr (allocHeap var11 (O_node var6))))) (= var1 var9)) (= var2 var9)) (= var3 var10)) (= var4 var9)) (= var5 var10)) (= var7 (newHeap (allocHeap var11 (O_node var6))))) (= nullAddr var8))) (inv_main15 var7 var5 var4 var3 var2 var1 var8 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Addr) (var7 Int) (var8 Int) (var9 Heap) (var10 Int) (var11 Int) (var12 Addr) (var13 Int) (var14 Int) (var15 Addr) (var16 Int) (var17 Int) (var18 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main56 var18 var17 var16 var15 var14 var13 var12 var11 var10) (= var0 (+ var5 (* (- 1) 1)))) (= var1 var10)) (= var2 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (= var7 var16)) (= var8 var17)) (= var9 (writeHeap var18 var12 (O_node (node (next (getnode (readHeap var18 var12))) (prev (getnode (readHeap var18 var12))) var11))))) (is-O_node (readHeap var18 var12))) (is-O_node (readHeap var18 var12)))) (inv_main49 var9 var8 var7 var6 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Int) (var11 Int) (var12 Int) (var13 Int) (var14 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main44 var14 var13 var12 var11 var10 var9 var8) (= var0 (+ var6 (* (- 1) 1)))) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 var13)) (= var7 (writeHeap var14 var9 (O_node (node (next (getnode (readHeap var14 var9))) var8 (data (getnode (readHeap var14 var9)))))))) (is-O_node (readHeap var14 var9))) (is-O_node (readHeap var14 var9)))) (inv_main49 var7 var6 var5 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main41 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var5 (* (- 1) 1)))) (= var1 var9)) (= var2 var10)) (= var3 var11)) (= var4 var12)) (= var5 var13)) (= var6 var14)) (= var7 var15)) (= var8 (writeHeap var16 var11 (O_node (node (next (getnode (readHeap var16 var11))) var9 (data (getnode (readHeap var16 var11)))))))) (is-O_node (readHeap var16 var11))) (is-O_node (readHeap var16 var11)))) (inv_main22 var8 var7 var6 var0 var4 var1 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Int) (var13 Int) (var14 Int) (var15 Int) (var16 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (inv_main38 var16 var15 var14 var13 var12 var11 var10 var9) (= var0 (+ var4 (* (- 1) 1)))) (= var1 var9)) (= var2 var10)) (= var8 var11)) (= var3 var12)) (= var4 var13)) (= var5 var14)) (= var6 var15)) (= var7 (writeHeap var16 var9 (O_node (node var11 (prev (getnode (readHeap var16 var9))) (data (getnode (readHeap var16 var9)))))))) (is-O_node (readHeap var16 var9))) (is-O_node (readHeap var16 var9))) (= var8 nullAddr))) (inv_main22 var7 var6 var5 var0 var3 var1 var2))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap) (var7 Addr) (var8 Int) (var9 Int) (var10 Int) (var11 Int) (var12 Int) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main19 var13 var12 var11 var10 var9 var8 var7) (= var0 var7)) (= var1 var8)) (= var2 var9)) (= var3 var10)) (= var4 var11)) (= var5 var12)) (= var6 (writeHeap var13 var7 (O_node (node (next (getnode (readHeap var13 var7))) (prev (getnode (readHeap var13 var7))) var8))))) (is-O_node (readHeap var13 var7))) (is-O_node (readHeap var13 var7)))) (inv_main22 var6 var5 var4 var3 var2 var0 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main12 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main12 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))) (is-O_node (readHeap var6 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main18 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main18 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))) (is-O_node (readHeap var6 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main19 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))) (is-O_node (readHeap var6 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (and (inv_main29 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var0)))) (is-O_node (readHeap var8 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main35 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (and (inv_main35 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var0)))) (is-O_node (readHeap var8 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main36 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Int) (var5 Int) (var6 Int) (var7 Int) (var8 Heap)) (not (and (and (inv_main36 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var0)))) (is-O_node (readHeap var8 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main38 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main38 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var0)))) (is-O_node (readHeap var7 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (inv_main41 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Int) (var4 Int) (var5 Int) (var6 Int) (var7 Heap)) (not (and (and (inv_main41 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var7 var2)))) (is-O_node (readHeap var7 var2))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main23 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))) (is-O_node (readHeap var6 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main44 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Int) (var6 Heap)) (not (and (and (inv_main44 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var1)))) (is-O_node (readHeap var6 var1))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main57 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main56 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var2)))))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (and (inv_main56 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var2)))) (is-O_node (readHeap var8 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main71 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Int) (var5 Addr) (var6 Int) (var7 Int) (var8 Heap)) (not (and (inv_main70 var8 var7 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var8 var1)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Int) (var4 Int) (var5 Heap)) (not (and (inv_main78 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var5 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Addr) (var4 Int) (var5 Int) (var6 Heap)) (not (and (inv_main82 var6 var5 var4 var3 var2 var1 var0) (not (is-O_node (readHeap var6 var0)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Int) (var4 Heap)) (not (inv_main85 var4 var3 var2 var1 var0))))
(check-sat)
