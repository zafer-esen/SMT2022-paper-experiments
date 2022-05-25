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

(declare-datatypes ((HeapObject 0) (item 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_item (getitem item)) (defObj))
                   ((item (next Addr) (data Addr)))))
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
(declare-fun inv_main0 (Heap Int) Bool)
(declare-fun inv_main10 (Heap Addr Int Addr) Bool)
(declare-fun inv_main12 (Heap Addr Int Addr Addr) Bool)
(declare-fun inv_main15 (Heap Addr) Bool)
(declare-fun inv_main16 (Heap Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Addr) Bool)
(declare-fun inv_main9 (Heap Addr Int Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main9 var4 var3 var2 var1) (= var0 (writeHeap var4 var1 (O_item (item var3 (data (getitem (readHeap var4 var1)))))))) (is-O_item (readHeap var4 var1))) (is-O_item (readHeap var4 var1)))) (inv_main10 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 item) (var3 Heap) (var4 Addr) (var5 Heap) (var6 Heap)) (or (not (and (and (and (and (and (inv_main2 var6) (= var0 (newAddr (allocHeap var5 (O_item var2))))) (= var1 1)) (= var3 (newHeap (allocHeap var5 (O_item var2))))) (= var4 nullAddr)) (= var5 var6))) (inv_main9 var3 var4 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 item) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Heap) (var8 Int) (var9 Addr) (var10 Addr) (var11 Int) (var12 Addr) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main12 var13 var12 var11 var10 var9) (= var0 (newAddr (allocHeap var7 (O_item var2))))) (= var1 1)) (= var3 (newHeap (allocHeap var7 (O_item var2))))) (= var4 var10)) (= var5 var11)) (= var6 var12)) (= var7 (writeHeap var13 var10 (O_item (item (next (getitem (readHeap var13 var10))) var9))))) (is-O_item (readHeap var13 var10))) (is-O_item (readHeap var13 var10))) (not (= var8 0)))) (inv_main9 var3 var4 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Int) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main12 var9 var8 var7 var6 var5) (= var4 var6)) (= var0 var7)) (= var1 var8)) (= var2 (writeHeap var9 var6 (O_item (item (next (getitem (readHeap var9 var6))) var5))))) (is-O_item (readHeap var9 var6))) (is-O_item (readHeap var9 var6))) (= var3 0)) (not (= var4 nullAddr)))) (inv_main16 var2 var4))))
(assert (forall ((var0 Addr) (var1 Heap)) (or (not (and (inv_main15 var1 var0) (not (= var0 nullAddr)))) (inv_main22 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (and (inv_main10 var4 var3 var2 var1) (= var0 (data (getitem (readHeap var4 (next (getitem (readHeap var4 var1)))))))) (is-O_item (readHeap var4 (next (getitem (readHeap var4 var1)))))) (is-O_item (readHeap var4 var1))) (not (= (next (getitem (readHeap var4 var1))) nullAddr))) (is-O_item (readHeap var4 var1)))) (inv_main12 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 item) (var2 Heap) (var3 Addr) (var4 Int) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (inv_main10 var6 var5 var4 var3) (= var0 (newAddr (allocHeap var6 (O_item var1))))) (= var2 (newHeap (allocHeap var6 (O_item var1))))) (= (next (getitem (readHeap var6 var3))) nullAddr)) (is-O_item (readHeap var6 var3)))) (inv_main12 var2 var5 var4 var3 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main15 var2 var1) (= var0 0)) (= var1 nullAddr))) (inv_main0 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (inv_main16 var7 var6) (= var0 var3)) (= var1 var4)) (= var2 (writeHeap var5 var4 defObj))) (= var3 (next (getitem (readHeap var7 var6))))) (= var4 var6)) (= var5 var7)) (is-O_item (readHeap var7 var6)))) (inv_main15 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (inv_main22 var7 var6) (= var0 var3)) (= var1 var4)) (= var2 (writeHeap var5 var4 defObj))) (= var3 (next (getitem (readHeap var7 var6))))) (= var4 var6)) (= var5 var7)) (is-O_item (readHeap var7 var6)))) (inv_main15 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Int) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main12 var9 var8 var7 var6 var5) (= var4 var6)) (= var0 var7)) (= var1 var8)) (= var2 (writeHeap var9 var6 (O_item (item (next (getitem (readHeap var9 var6))) var5))))) (is-O_item (readHeap var9 var6))) (is-O_item (readHeap var9 var6))) (= var3 0)) (= var4 nullAddr))) (inv_main15 var2 var4))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap)) (not (and (inv_main9 var3 var2 var1 var0) (not (is-O_item (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap)) (not (and (and (inv_main9 var3 var2 var1 var0) (not (is-O_item (readHeap var3 var0)))) (is-O_item (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap)) (not (and (inv_main10 var3 var2 var1 var0) (not (is-O_item (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap)) (not (and (and (and (inv_main10 var3 var2 var1 var0) (not (is-O_item (readHeap var3 var0)))) (not (= (next (getitem (readHeap var3 var0))) nullAddr))) (is-O_item (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap)) (not (and (and (and (and (inv_main10 var3 var2 var1 var0) (not (is-O_item (readHeap var3 (next (getitem (readHeap var3 var0))))))) (is-O_item (readHeap var3 var0))) (not (= (next (getitem (readHeap var3 var0))) nullAddr))) (is-O_item (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (inv_main12 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var4 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Addr) (var4 Heap)) (not (and (and (inv_main12 var4 var3 var2 var1 var0) (not (is-O_item (readHeap var4 var1)))) (is-O_item (readHeap var4 var1))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main16 var1 var0) (not (is-O_item (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main22 var1 var0) (not (is-O_item (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Heap)) (not (and (inv_main0 var2 var1) (not (= (readHeap var2 var0) defObj))))))
(check-sat)
