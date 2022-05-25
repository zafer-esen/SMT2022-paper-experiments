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

(declare-datatypes ((HeapObject 0) (TSLL 0))
                   (((O_Int (getInt Int)) (O_UInt (getUInt Int)) (O_Addr (getAddr Addr)) (O_TSLL (getTSLL TSLL)) (defObj))
                   ((TSLL (next Addr) (colour Int)))))
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
(declare-fun inv_main13 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main14 (Heap Addr Addr Addr Addr) Bool)
(declare-fun inv_main15 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main18 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main19 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main23 (Heap Addr Addr Addr Addr) Bool)
(declare-fun inv_main24 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main26 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main29 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main3 (Heap Addr) Bool)
(declare-fun inv_main31 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main36 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main4 (Heap Addr) Bool)
(declare-fun inv_main40 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main41 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main42 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main46 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main48 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main52 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main57 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main58 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main59 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main6 (Heap Addr Addr) Bool)
(declare-fun inv_main62 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main7 (Heap Addr Addr) Bool)
(declare-fun inv_main9 (Heap Addr Addr Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main9 var4 var3 var2 var1) (= var0 0)) (not (= var3 var2)))) (inv_main29 var4 var3 var2 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main15 var8 var7 var6 var5) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 (writeHeap var8 var5 (O_TSLL (TSLL var7 (colour (getTSLL (readHeap var8 var5)))))))) (is-O_TSLL (readHeap var8 var5))) (is-O_TSLL (readHeap var8 var5))) (not (= var4 0)))) (inv_main18 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main18 var4 var3 var2 var1) (= var0 (writeHeap var4 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var4 var1))) 1))))) (is-O_TSLL (readHeap var4 var1))) (is-O_TSLL (readHeap var4 var1)))) (inv_main9 var0 var3 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main26 var4 var3 var2 var1) (= var0 (writeHeap var4 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var4 var1))) 1))))) (is-O_TSLL (readHeap var4 var1))) (is-O_TSLL (readHeap var4 var1)))) (inv_main9 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (and (inv_main7 var5 var4 var3) (= var0 var3)) (= var1 var4)) (= var2 (writeHeap var5 var3 (O_TSLL (TSLL (next (getTSLL (readHeap var5 var3))) 1))))) (is-O_TSLL (readHeap var5 var3))) (is-O_TSLL (readHeap var5 var3)))) (inv_main9 var2 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main57 var3 var2 var1 var0) (= 0 (colour (getTSLL (readHeap var3 var1))))) (is-O_TSLL (readHeap var3 var1)))) (inv_main58 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main42 var8 var7 var6 var5) (= var3 (next (getTSLL (readHeap var8 var5))))) (= var0 var5)) (= var1 var6)) (= var4 var7)) (= var2 var8)) (is-O_TSLL (readHeap var8 var5))) (= var4 var3))) (inv_main48 var2 var4 var1 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main15 var8 var7 var6 var5) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 (writeHeap var8 var5 (O_TSLL (TSLL var7 (colour (getTSLL (readHeap var8 var5)))))))) (is-O_TSLL (readHeap var8 var5))) (is-O_TSLL (readHeap var8 var5))) (= var4 0))) (inv_main19 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (inv_main22 var8 var7 var6 var5) (= var0 (next (getTSLL (readHeap var8 var5))))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 var5)))) (inv_main24 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main9 var4 var3 var2 var1) (= var0 0)) (= var3 var2))) (inv_main31 var4 var3 var2 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main42 var8 var7 var6 var5) (= var3 (next (getTSLL (readHeap var8 var5))))) (= var0 var5)) (= var1 var6)) (= var4 var7)) (= var2 var8)) (is-O_TSLL (readHeap var8 var5))) (not (= var4 var3)))) (inv_main46 var2 var4 var1 var3))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Heap)) (or (not (and (and (inv_main2 var3) (= var0 (newAddr (allocHeap var3 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var3 (O_TSLL var1)))))) (inv_main3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (inv_main58 var9 var8 var7 var6) (= var0 (writeHeap var5 var3 defObj))) (= var1 (next (getTSLL (readHeap var9 var7))))) (= var2 var6)) (= var3 var7)) (= var4 var8)) (= var5 var9)) (is-O_TSLL (readHeap var9 var7)))) (inv_main62 var0 var4 var3 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main41 var8 var7 var6 var5) (= var3 (next (getTSLL (readHeap var8 var5))))) (= var0 var5)) (= var1 var6)) (= var4 var7)) (= var2 var8)) (is-O_TSLL (readHeap var8 var5))) (not (= var4 var3)))) (inv_main40 var2 var4 var1 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main29 var3 var2 var1 var0) (= 1 (colour (getTSLL (readHeap var3 var0))))) (is-O_TSLL (readHeap var3 var0))) (not (= var2 var0)))) (inv_main40 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main29 var3 var2 var1 var0) (not (= 1 (colour (getTSLL (readHeap var3 var0)))))) (is-O_TSLL (readHeap var3 var0)))) (inv_main36 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main40 var3 var2 var1 var0) (not (= 0 (colour (getTSLL (readHeap var3 var0)))))) (is-O_TSLL (readHeap var3 var0)))) (inv_main41 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main46 var3 var2 var1 var0) (not (= 1 (colour (getTSLL (readHeap var3 var0)))))) (is-O_TSLL (readHeap var3 var0)))) (inv_main41 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main19 var10 var9 var8 var7) (= var0 (newAddr (allocHeap var6 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var6 (O_TSLL var1))))) (= var3 var7)) (= var4 var8)) (= var5 var9)) (= var6 (writeHeap var10 var7 (O_TSLL (TSLL (next (getTSLL (readHeap var10 var7))) 0))))) (is-O_TSLL (readHeap var10 var7))) (is-O_TSLL (readHeap var10 var7)))) (inv_main23 var2 var5 var4 var3 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main4 var6 var5) (= var0 (newAddr (allocHeap var4 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var4 (O_TSLL var1))))) (= var3 var5)) (= var4 (writeHeap var6 var5 (O_TSLL (TSLL nullAddr (colour (getTSLL (readHeap var6 var5)))))))) (is-O_TSLL (readHeap var6 var5))) (is-O_TSLL (readHeap var6 var5)))) (inv_main6 var2 var3 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (and (and (inv_main3 var2 var1) (= var0 (writeHeap var2 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var2 var1))) 1))))) (is-O_TSLL (readHeap var2 var1))) (is-O_TSLL (readHeap var2 var1)))) (inv_main4 var0 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main6 var3 var2 var1) (= var0 (writeHeap var3 var1 (O_TSLL (TSLL var2 (colour (getTSLL (readHeap var3 var1)))))))) (is-O_TSLL (readHeap var3 var1))) (is-O_TSLL (readHeap var3 var1)))) (inv_main7 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (inv_main9 var7 var6 var5 var4) (= var0 (newAddr (allocHeap var7 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var7 (O_TSLL var1))))) (not (= var3 0)))) (inv_main14 var2 var6 var5 var4 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (inv_main13 var8 var7 var6 var5) (= var0 (next (getTSLL (readHeap var8 var5))))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 var5)))) (inv_main15 var4 var3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (inv_main14 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 var2 (O_TSLL (TSLL var1 (colour (getTSLL (readHeap var5 var2)))))))) (is-O_TSLL (readHeap var5 var2))) (is-O_TSLL (readHeap var5 var2)))) (inv_main13 var0 var4 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main46 var3 var2 var1 var0) (= 1 (colour (getTSLL (readHeap var3 var0))))) (is-O_TSLL (readHeap var3 var0)))) (inv_main52 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main24 var4 var3 var2 var1) (= var0 (writeHeap var4 var1 (O_TSLL (TSLL var3 (colour (getTSLL (readHeap var4 var1)))))))) (is-O_TSLL (readHeap var4 var1))) (is-O_TSLL (readHeap var4 var1)))) (inv_main26 var0 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main62 var12 var11 var10 var9) (= var0 var3)) (= var7 var2)) (= var8 var5)) (= var1 (writeHeap var6 var3 defObj))) (= var2 (next (getTSLL (readHeap var12 var9))))) (= var3 var9)) (= var4 var10)) (= var5 var11)) (= var6 var12)) (is-O_TSLL (readHeap var12 var9))) (not (= var8 var7)))) (inv_main57 var1 var8 var7 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Addr) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Addr) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main59 var12 var11 var10 var9) (= var7 var2)) (= var0 var4)) (= var8 var5)) (= var1 (writeHeap var6 var4 defObj))) (= var2 (next (getTSLL (readHeap var12 var10))))) (= var3 var9)) (= var4 var10)) (= var5 var11)) (= var6 var12)) (is-O_TSLL (readHeap var12 var10))) (not (= var8 var7)))) (inv_main57 var1 var8 var7 var7))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main41 var8 var7 var6 var5) (= var2 (next (getTSLL (readHeap var8 var5))))) (= var0 var5)) (= var3 var6)) (= var4 var7)) (= var1 var8)) (is-O_TSLL (readHeap var8 var5))) (= var4 var2)) (not (= var4 var3)))) (inv_main57 var1 var4 var3 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main29 var3 var2 var1 var0) (= 1 (colour (getTSLL (readHeap var3 var0))))) (is-O_TSLL (readHeap var3 var0))) (= var2 var0)) (not (= var2 var1)))) (inv_main57 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main57 var3 var2 var1 var0) (not (= 0 (colour (getTSLL (readHeap var3 var1)))))) (is-O_TSLL (readHeap var3 var1)))) (inv_main59 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main40 var3 var2 var1 var0) (= 0 (colour (getTSLL (readHeap var3 var0))))) (is-O_TSLL (readHeap var3 var0)))) (inv_main42 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (inv_main23 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 var2 (O_TSLL (TSLL var1 (colour (getTSLL (readHeap var5 var2)))))))) (is-O_TSLL (readHeap var5 var2))) (is-O_TSLL (readHeap var5 var2)))) (inv_main22 var0 var4 var3 var2))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main3 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main3 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main4 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main4 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main6 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main6 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main7 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main7 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main14 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main14 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var1)))) (is-O_TSLL (readHeap var4 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main13 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main15 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main15 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))) (is-O_TSLL (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main18 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main18 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))) (is-O_TSLL (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main19 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main19 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))) (is-O_TSLL (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main23 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main23 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var1)))) (is-O_TSLL (readHeap var4 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main24 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main24 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))) (is-O_TSLL (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main26 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main26 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))) (is-O_TSLL (readHeap var3 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main31 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main29 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main36 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main40 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main42 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main48 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main46 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main52 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main41 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main57 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main58 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main62 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main59 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(check-sat)
