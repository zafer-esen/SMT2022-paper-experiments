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

(declare-datatypes ((HeapObject 0) (TSLL 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_TSLL (getTSLL TSLL)) (defObj))
                   ((TSLL (next Addr) (opt Addr) (data Int)))))
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
(declare-fun inv_main10 (Heap Addr) Bool)
(declare-fun inv_main11 (Heap Addr Addr) Bool)
(declare-fun inv_main12 (Heap Addr) Bool)
(declare-fun inv_main13 (Heap Addr) Bool)
(declare-fun inv_main15 (Heap Addr) Bool)
(declare-fun inv_main16 (Heap Addr) Bool)
(declare-fun inv_main17 (Heap Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main21 (Heap Addr Addr) Bool)
(declare-fun inv_main22 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main23 (Heap Addr Addr) Bool)
(declare-fun inv_main26 (Heap Addr Addr) Bool)
(declare-fun inv_main3 (Heap Addr) Bool)
(declare-fun inv_main30 (Heap Addr Addr) Bool)
(declare-fun inv_main31 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main32 (Heap Addr Addr) Bool)
(declare-fun inv_main33 (Heap Addr Addr) Bool)
(declare-fun inv_main35 (Heap Addr Addr) Bool)
(declare-fun inv_main36 (Heap Addr Addr) Bool)
(declare-fun inv_main39 (Heap Addr Addr) Bool)
(declare-fun inv_main40 (Heap Addr Addr) Bool)
(declare-fun inv_main42 (Heap Addr Addr) Bool)
(declare-fun inv_main44 (Heap Addr Addr Int) Bool)
(declare-fun inv_main46 (Heap Addr Addr Int) Bool)
(declare-fun inv_main48 (Heap Addr Addr Int) Bool)
(declare-fun inv_main56 (Heap Addr Addr) Bool)
(declare-fun inv_main57 (Heap Addr Addr) Bool)
(declare-fun inv_main6 (Heap Addr) Bool)
(declare-fun inv_main60 (Heap Addr Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (and (inv_main40 var6 var5 var4) (= var2 (next (getTSLL (readHeap var6 var4))))) (= var0 var4)) (= var3 var5)) (= var1 var6)) (is-O_TSLL (readHeap var6 var4))) (= var2 nullAddr)) (not (= var3 nullAddr)))) (inv_main56 var1 var3 var3))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main17 var3 var2 var1) (= var0 0)) (= var2 nullAddr)) (not (= var2 nullAddr)))) (inv_main56 var3 var2 var2))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main60 var8 var7 var6) (= var5 var2)) (= var0 var3)) (= var1 (writeHeap var4 var3 defObj))) (= var2 var6)) (= var3 var7)) (= var4 (writeHeap var8 (opt (getTSLL (readHeap var8 var7))) defObj))) (is-O_TSLL (readHeap var8 var7))) (not (= var5 nullAddr)))) (inv_main56 var1 var5 var5))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main57 var9 var8 var7) (= var6 var2)) (= var0 var3)) (= var1 (writeHeap var4 var3 defObj))) (= var5 (data (getTSLL (readHeap var9 var8))))) (= var2 var7)) (= var3 var8)) (= var4 var9)) (is-O_TSLL (readHeap var9 var8))) (not (= var5 2))) (not (= var6 nullAddr)))) (inv_main56 var1 var6 var6))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (inv_main23 var7 var6 var5) (= var0 var5)) (= var1 var6)) (= var2 (writeHeap var7 var5 (O_TSLL (TSLL nullAddr (opt (getTSLL (readHeap var7 var5))) (data (getTSLL (readHeap var7 var5)))))))) (is-O_TSLL (readHeap var7 var5))) (is-O_TSLL (readHeap var7 var5))) (= var3 0)) (= var4 0))) (inv_main33 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (inv_main17 var6 var5 var4) (= var0 (newAddr (allocHeap var6 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var6 (O_TSLL var1))))) (not (= var3 0)))) (inv_main22 var2 var5 var4 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (and (inv_main3 var4 var3) (= var0 var3)) (= var1 (writeHeap var4 var3 (O_TSLL (TSLL nullAddr (opt (getTSLL (readHeap var4 var3))) (data (getTSLL (readHeap var4 var3)))))))) (is-O_TSLL (readHeap var4 var3))) (is-O_TSLL (readHeap var4 var3))) (not (= var2 0)))) (inv_main6 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Int) (var3 Int) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (and (and (inv_main3 var5 var4) (= var0 var4)) (= var1 (writeHeap var5 var4 (O_TSLL (TSLL nullAddr (opt (getTSLL (readHeap var5 var4))) (data (getTSLL (readHeap var5 var4)))))))) (is-O_TSLL (readHeap var5 var4))) (is-O_TSLL (readHeap var5 var4))) (= var2 0)) (= var3 0))) (inv_main13 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main44 var4 var3 var2 var1) (= var0 0)) (not (= var1 2)))) (inv_main46 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main44 var8 var7 var6 var5) (or (and (not (= var1 var2)) (= var0 1)) (and (= var1 var2) (= var0 0)))) (= var1 (opt (getTSLL (readHeap var8 var6))))) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 var6))) (= var5 2))) (inv_main46 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main39 var3 var2 var1) (= var0 (data (getTSLL (readHeap var3 var1))))) (is-O_TSLL (readHeap var3 var1)))) (inv_main44 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main40 var6 var5 var4) (= var3 (next (getTSLL (readHeap var6 var4))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_TSLL (readHeap var6 var4))) (not (= var3 nullAddr)))) (inv_main39 var2 var1 var3))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main17 var3 var2 var1) (= var0 0)) (not (= var2 nullAddr)))) (inv_main39 var3 var2 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main23 var6 var5 var4) (= var0 var4)) (= var1 var5)) (= var2 (writeHeap var6 var4 (O_TSLL (TSLL nullAddr (opt (getTSLL (readHeap var6 var4))) (data (getTSLL (readHeap var6 var4)))))))) (is-O_TSLL (readHeap var6 var4))) (is-O_TSLL (readHeap var6 var4))) (not (= var3 0)))) (inv_main26 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main32 var3 var2 var1) (= var0 (writeHeap var3 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var1))) (opt (getTSLL (readHeap var3 var1))) 1))))) (is-O_TSLL (readHeap var3 var1))) (is-O_TSLL (readHeap var3 var1)))) (inv_main35 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (and (and (inv_main13 var2 var1) (= var0 (writeHeap var2 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var2 var1))) (opt (getTSLL (readHeap var2 var1))) 0))))) (is-O_TSLL (readHeap var2 var1))) (is-O_TSLL (readHeap var2 var1)))) (inv_main16 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (inv_main56 var6 var5 var4) (= var0 (next (getTSLL (readHeap var6 var4))))) (= var1 var4)) (= var2 var5)) (= var3 var6)) (is-O_TSLL (readHeap var6 var4)))) (inv_main57 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main57 var6 var5 var4) (= var3 (data (getTSLL (readHeap var6 var5))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_TSLL (readHeap var6 var5))) (= var3 2))) (inv_main60 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main30 var3 var2 var1) (= var0 (writeHeap var3 (opt (getTSLL (readHeap var3 var1))) (O_TSLL (TSLL nullAddr (opt (getTSLL (readHeap var3 (opt (getTSLL (readHeap var3 var1)))))) (data (getTSLL (readHeap var3 (opt (getTSLL (readHeap var3 var1))))))))))) (is-O_TSLL (readHeap var3 (opt (getTSLL (readHeap var3 var1)))))) (is-O_TSLL (readHeap var3 (opt (getTSLL (readHeap var3 var1)))))) (is-O_TSLL (readHeap var3 var1)))) (inv_main17 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main35 var3 var2 var1) (= var0 (writeHeap var3 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var1))) var1 (data (getTSLL (readHeap var3 var1)))))))) (is-O_TSLL (readHeap var3 var1))) (is-O_TSLL (readHeap var3 var1)))) (inv_main17 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main36 var3 var2 var1) (= var0 (writeHeap var3 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var1))) var1 (data (getTSLL (readHeap var3 var1)))))))) (is-O_TSLL (readHeap var3 var1))) (is-O_TSLL (readHeap var3 var1)))) (inv_main17 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (and (inv_main10 var3 var2) (= var0 var2)) (= var1 (writeHeap var3 (opt (getTSLL (readHeap var3 var2))) (O_TSLL (TSLL nullAddr (opt (getTSLL (readHeap var3 (opt (getTSLL (readHeap var3 var2)))))) (data (getTSLL (readHeap var3 (opt (getTSLL (readHeap var3 var2))))))))))) (is-O_TSLL (readHeap var3 (opt (getTSLL (readHeap var3 var2)))))) (is-O_TSLL (readHeap var3 (opt (getTSLL (readHeap var3 var2)))))) (is-O_TSLL (readHeap var3 var2)))) (inv_main17 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main15 var3 var2) (= var0 var2)) (= var1 (writeHeap var3 var2 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var2))) var2 (data (getTSLL (readHeap var3 var2)))))))) (is-O_TSLL (readHeap var3 var2))) (is-O_TSLL (readHeap var3 var2)))) (inv_main17 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main16 var3 var2) (= var0 var2)) (= var1 (writeHeap var3 var2 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var2))) var2 (data (getTSLL (readHeap var3 var2)))))))) (is-O_TSLL (readHeap var3 var2))) (is-O_TSLL (readHeap var3 var2)))) (inv_main17 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Int) (var3 Int) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (and (and (inv_main3 var5 var4) (= var0 var4)) (= var1 (writeHeap var5 var4 (O_TSLL (TSLL nullAddr (opt (getTSLL (readHeap var5 var4))) (data (getTSLL (readHeap var5 var4)))))))) (is-O_TSLL (readHeap var5 var4))) (is-O_TSLL (readHeap var5 var4))) (= var2 0)) (not (= var3 0)))) (inv_main12 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main48 var11 var10 var9 var8) (or (and (= var3 var4) (= var7 1)) (and (not (= var3 var4)) (= var7 0)))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (opt (getTSLL (readHeap var11 var9))))) (= var4 var9)) (= var5 var10)) (= var6 var11)) (is-O_TSLL (readHeap var11 var9))) (= var8 0)) (= var7 0))) (inv_main42 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main22 var4 var3 var2 var1) (= var0 (writeHeap var4 var2 (O_TSLL (TSLL var1 (opt (getTSLL (readHeap var4 var2))) (data (getTSLL (readHeap var4 var2)))))))) (is-O_TSLL (readHeap var4 var2))) (is-O_TSLL (readHeap var4 var2)))) (inv_main21 var0 var3 var2))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main6 var6 var5) (= var0 (newAddr (allocHeap var4 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var4 (O_TSLL var1))))) (= var3 var5)) (= var4 (writeHeap var6 var5 (O_TSLL (TSLL (next (getTSLL (readHeap var6 var5))) (opt (getTSLL (readHeap var6 var5))) 2))))) (is-O_TSLL (readHeap var6 var5))) (is-O_TSLL (readHeap var6 var5)))) (inv_main11 var2 var3 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (inv_main21 var6 var5 var4) (= var0 (next (getTSLL (readHeap var6 var4))))) (= var1 var4)) (= var2 var5)) (= var3 var6)) (is-O_TSLL (readHeap var6 var4)))) (inv_main23 var3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (and (and (inv_main12 var2 var1) (= var0 (writeHeap var2 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var2 var1))) (opt (getTSLL (readHeap var2 var1))) 1))))) (is-O_TSLL (readHeap var2 var1))) (is-O_TSLL (readHeap var2 var1)))) (inv_main15 var0 var1))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main26 var8 var7 var6) (= var0 (newAddr (allocHeap var5 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var5 (O_TSLL var1))))) (= var3 var6)) (= var4 var7)) (= var5 (writeHeap var8 var6 (O_TSLL (TSLL (next (getTSLL (readHeap var8 var6))) (opt (getTSLL (readHeap var8 var6))) 2))))) (is-O_TSLL (readHeap var8 var6))) (is-O_TSLL (readHeap var8 var6)))) (inv_main31 var2 var4 var3 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Heap)) (or (not (and (and (inv_main2 var3) (= var0 (newAddr (allocHeap var3 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var3 (O_TSLL var1)))))) (inv_main3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main31 var4 var3 var2 var1) (= var0 (writeHeap var4 var2 (O_TSLL (TSLL (next (getTSLL (readHeap var4 var2))) var1 (data (getTSLL (readHeap var4 var2)))))))) (is-O_TSLL (readHeap var4 var2))) (is-O_TSLL (readHeap var4 var2)))) (inv_main30 var0 var3 var2))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main46 var4 var3 var2 var1) (= var0 0)) (= var1 0))) (inv_main48 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main46 var8 var7 var6 var5) (or (and (= var1 nullAddr) (= var0 1)) (and (not (= var1 nullAddr)) (= var0 0)))) (= var1 (next (getTSLL (readHeap var8 (opt (getTSLL (readHeap var8 var6)))))))) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 (opt (getTSLL (readHeap var8 var6)))))) (is-O_TSLL (readHeap var8 var6))) (not (= var5 0)))) (inv_main48 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (inv_main23 var7 var6 var5) (= var0 var5)) (= var1 var6)) (= var2 (writeHeap var7 var5 (O_TSLL (TSLL nullAddr (opt (getTSLL (readHeap var7 var5))) (data (getTSLL (readHeap var7 var5)))))))) (is-O_TSLL (readHeap var7 var5))) (is-O_TSLL (readHeap var7 var5))) (= var3 0)) (not (= var4 0)))) (inv_main32 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main11 var3 var2 var1) (= var0 (writeHeap var3 var2 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var2))) var1 (data (getTSLL (readHeap var3 var2)))))))) (is-O_TSLL (readHeap var3 var2))) (is-O_TSLL (readHeap var3 var2)))) (inv_main10 var0 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main48 var3 var2 var1 var0) (not (= var0 0)))) (inv_main40 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Int) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main48 var11 var10 var9 var8) (or (and (= var3 var4) (= var7 1)) (and (not (= var3 var4)) (= var7 0)))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (opt (getTSLL (readHeap var11 var9))))) (= var4 var9)) (= var5 var10)) (= var6 var11)) (is-O_TSLL (readHeap var11 var9))) (= var8 0)) (not (= var7 0)))) (inv_main40 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main33 var3 var2 var1) (= var0 (writeHeap var3 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var1))) (opt (getTSLL (readHeap var3 var1))) 0))))) (is-O_TSLL (readHeap var3 var1))) (is-O_TSLL (readHeap var3 var1)))) (inv_main36 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main3 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main3 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main6 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main6 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main11 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main11 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))) (is-O_TSLL (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main10 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main10 var1 var0) (not (is-O_TSLL (readHeap var1 (opt (getTSLL (readHeap var1 var0))))))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (and (inv_main10 var1 var0) (not (is-O_TSLL (readHeap var1 (opt (getTSLL (readHeap var1 var0))))))) (is-O_TSLL (readHeap var1 (opt (getTSLL (readHeap var1 var0)))))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main12 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main12 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main15 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main15 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main13 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main13 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main16 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main16 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main22 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main21 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main23 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main23 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main26 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main26 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main31 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main31 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main30 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main30 var2 var1 var0) (not (is-O_TSLL (readHeap var2 (opt (getTSLL (readHeap var2 var0))))))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main30 var2 var1 var0) (not (is-O_TSLL (readHeap var2 (opt (getTSLL (readHeap var2 var0))))))) (is-O_TSLL (readHeap var2 (opt (getTSLL (readHeap var2 var0)))))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main32 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main32 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main35 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main35 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main33 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main33 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main36 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main36 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main39 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main44 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (= var0 2)))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main46 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (not (= var0 0))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (and (inv_main46 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (opt (getTSLL (readHeap var3 var1))))))) (is-O_TSLL (readHeap var3 var1))) (not (= var0 0))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main48 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (= var0 0)))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main42 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main40 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main56 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main57 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main60 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))))))
(check-sat)
