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
                   ((TSLL (next Addr) (inner Addr)))))
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
(declare-fun inv_main103 (Heap Addr Addr) Bool)
(declare-fun inv_main106 (Heap Addr Addr) Bool)
(declare-fun inv_main109 (Heap Addr Addr) Bool)
(declare-fun inv_main11 (Heap Addr) Bool)
(declare-fun inv_main111 (Heap Addr Addr) Bool)
(declare-fun inv_main114 (Heap Addr Addr) Bool)
(declare-fun inv_main116 (Heap Addr Addr) Bool)
(declare-fun inv_main121 (Heap Addr Addr) Bool)
(declare-fun inv_main14 (Heap Addr) Bool)
(declare-fun inv_main15 (Heap Addr Addr) Bool)
(declare-fun inv_main16 (Heap Addr) Bool)
(declare-fun inv_main19 (Heap Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main21 (Heap Addr Addr) Bool)
(declare-fun inv_main26 (Heap Addr Addr) Bool)
(declare-fun inv_main3 (Heap Addr) Bool)
(declare-fun inv_main30 (Heap Addr Addr) Bool)
(declare-fun inv_main31 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main32 (Heap Addr Addr) Bool)
(declare-fun inv_main37 (Heap Addr Addr) Bool)
(declare-fun inv_main42 (Heap Addr Addr) Bool)
(declare-fun inv_main45 (Heap Addr Addr) Bool)
(declare-fun inv_main46 (Heap Addr Addr) Bool)
(declare-fun inv_main49 (Heap Addr Addr) Bool)
(declare-fun inv_main50 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main51 (Heap Addr Addr) Bool)
(declare-fun inv_main54 (Heap Addr Addr) Bool)
(declare-fun inv_main56 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main64 (Heap Addr Addr) Bool)
(declare-fun inv_main69 (Heap Addr Addr Int) Bool)
(declare-fun inv_main7 (Heap Addr) Bool)
(declare-fun inv_main70 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main76 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main78 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main81 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main83 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main86 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main88 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main93 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main96 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main98 (Heap Addr Addr Int Addr) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main76 var4 var3 var2 var1 var0) (= nullAddr (inner (getTSLL (readHeap var4 var0))))) (is-O_TSLL (readHeap var4 var0)))) (inv_main81 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Int) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main96 var11 var10 var9 var8 var7) (= var0 0)) (= var6 (next (getTSLL (readHeap var11 var9))))) (= var1 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (= var5 var11)) (is-O_TSLL (readHeap var11 var9))) (not (= nullAddr var6)))) (inv_main69 var5 var4 var6 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (inv_main26 var7 var6 var5) (= var0 0)) (= var1 nullAddr)) (= var4 var6)) (= var2 var7)) (= var3 0)) (not (= nullAddr var4))) (not (= nullAddr var4)))) (inv_main69 var2 var4 var4 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main81 var4 var3 var2 var1 var0) (not (= nullAddr (next (getTSLL (readHeap var4 var0)))))) (is-O_TSLL (readHeap var4 var0)))) (inv_main88 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (and (inv_main103 var6 var5 var4) (= var3 (inner (getTSLL (readHeap var6 var5))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_TSLL (readHeap var6 var5))) (not (= nullAddr var3))) (not (= nullAddr var3)))) (inv_main109 var2 var1 var3))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (and (inv_main3 var3 var2) (= var1 var2)) (= var0 (writeHeap var3 var2 (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var3 var2)))))))) (is-O_TSLL (readHeap var3 var2))) (is-O_TSLL (readHeap var3 var2))) (= var1 nullAddr))) (inv_main7 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main109 var2 var1 var0) (= nullAddr (inner (getTSLL (readHeap var2 var0))))) (is-O_TSLL (readHeap var2 var0)))) (inv_main114 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (inv_main26 var6 var5 var4) (= var0 (newAddr (allocHeap var6 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var6 (O_TSLL var1))))) (not (= var3 0)))) (inv_main31 var2 var5 var4 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main109 var2 var1 var0) (not (= nullAddr (inner (getTSLL (readHeap var2 var0)))))) (is-O_TSLL (readHeap var2 var0)))) (inv_main116 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (inv_main70 var5 var4 var3 var2 var1) (= var0 1)) (not (= nullAddr var1))) (= var2 0)) (= nullAddr var1))) (inv_main78 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (inv_main70 var5 var4 var3 var2 var1) (= var0 2)) (not (= nullAddr var1))) (not (= var2 0))) (= nullAddr var1))) (inv_main78 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (and (and (inv_main3 var4 var3) (= var1 var3)) (= var0 (writeHeap var4 var3 (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var4 var3)))))))) (is-O_TSLL (readHeap var4 var3))) (is-O_TSLL (readHeap var4 var3))) (not (= var1 nullAddr))) (not (= var2 0)))) (inv_main11 var0 var1))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Addr) (var4 Heap) (var5 Addr) (var6 Int) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main32 var9 var8 var7) (= var0 (newAddr (allocHeap var4 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var4 (O_TSLL var1))))) (= var5 var7)) (= var3 var8)) (= var4 (writeHeap var9 var7 (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var9 var7)))))))) (is-O_TSLL (readHeap var9 var7))) (is-O_TSLL (readHeap var9 var7))) (not (= nullAddr var5))) (not (= var5 nullAddr))) (= var6 0))) (inv_main50 var2 var3 var5 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main49 var3 var2 var1) (= var0 (writeHeap var3 (inner (getTSLL (readHeap var3 var1))) (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var3 (inner (getTSLL (readHeap var3 var1))))))))))) (is-O_TSLL (readHeap var3 (inner (getTSLL (readHeap var3 var1)))))) (is-O_TSLL (readHeap var3 (inner (getTSLL (readHeap var3 var1)))))) (is-O_TSLL (readHeap var3 var1)))) (inv_main51 var0 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (inv_main70 var5 var4 var3 var2 var1) (= var0 1)) (not (= nullAddr var1))) (= var2 0)) (not (= nullAddr var1)))) (inv_main76 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (inv_main70 var5 var4 var3 var2 var1) (= var0 2)) (not (= nullAddr var1))) (not (= var2 0))) (not (= nullAddr var1)))) (inv_main76 var5 var4 var3 var0 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main15 var3 var2 var1) (= var0 (writeHeap var3 var2 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var2))) var1))))) (is-O_TSLL (readHeap var3 var2))) (is-O_TSLL (readHeap var3 var2)))) (inv_main14 var0 var2))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main50 var4 var3 var2 var1) (= var0 (writeHeap var4 var2 (O_TSLL (TSLL (next (getTSLL (readHeap var4 var2))) var1))))) (is-O_TSLL (readHeap var4 var2))) (is-O_TSLL (readHeap var4 var2)))) (inv_main49 var0 var3 var2))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Heap)) (or (not (and (and (inv_main2 var3) (= var0 (newAddr (allocHeap var3 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var3 (O_TSLL var1)))))) (inv_main3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main31 var4 var3 var2 var1) (= var0 (writeHeap var4 var2 (O_TSLL (TSLL var1 (inner (getTSLL (readHeap var4 var2)))))))) (is-O_TSLL (readHeap var4 var2))) (is-O_TSLL (readHeap var4 var2)))) (inv_main30 var0 var3 var2))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (and (and (inv_main32 var5 var4 var3) (= var2 var3)) (= var0 var4)) (= var1 (writeHeap var5 var3 (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var5 var3)))))))) (is-O_TSLL (readHeap var5 var3))) (is-O_TSLL (readHeap var5 var3))) (= nullAddr var2))) (inv_main37 var1 var0 var2))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (and (and (and (inv_main14 var2 var1) (= var0 (writeHeap var2 (inner (getTSLL (readHeap var2 var1))) (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var2 (inner (getTSLL (readHeap var2 var1))))))))))) (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var1)))))) (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var1)))))) (is-O_TSLL (readHeap var2 var1)))) (inv_main16 var0 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main56 var3 var2 var1 var0) (not (= var0 nullAddr)))) (inv_main26 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main56 var11 var10 var9 var8) (or (and (= var3 nullAddr) (= var7 1)) (and (not (= var3 nullAddr)) (= var7 0)))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (inner (getTSLL (readHeap var11 var9))))) (= var4 var9)) (= var5 var10)) (= var6 var11)) (is-O_TSLL (readHeap var11 var9))) (= var8 nullAddr)) (not (= var7 0)))) (inv_main26 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (inv_main21 var2 var1 var0) (not (= var0 nullAddr)))) (inv_main26 var2 var1 var1))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main21 var8 var7 var6) (or (and (= var2 nullAddr) (= var5 1)) (and (not (= var2 nullAddr)) (= var5 0)))) (= var0 var3)) (= var1 var4)) (= var2 (inner (getTSLL (readHeap var8 var7))))) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 var7))) (= var6 nullAddr)) (not (= var5 0)))) (inv_main26 var1 var0 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (inv_main30 var6 var5 var4) (= var0 (next (getTSLL (readHeap var6 var4))))) (= var1 var4)) (= var2 var5)) (= var3 var6)) (is-O_TSLL (readHeap var6 var4)))) (inv_main32 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main70 var4 var3 var2 var1 var0) (= nullAddr var0)) (not (<= 0 (+ 1 (* (- 1) var1)))))) (inv_main98 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (inv_main26 var6 var5 var4) (= var0 nullAddr)) (= var3 var5)) (= var1 var6)) (= var2 0)) (= nullAddr var3))) (inv_main64 var1 var3 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main86 var10 var9 var8 var7 var6) (= var0 (inner (getTSLL (readHeap var10 var6))))) (= var1 var6)) (= var5 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_TSLL (readHeap var10 var6))) (= var5 1))) (inv_main93 var4 var3 var2 var5 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main69 var4 var3 var2 var1) (= var0 (inner (getTSLL (readHeap var4 var2))))) (is-O_TSLL (readHeap var4 var2)))) (inv_main70 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (inv_main93 var10 var9 var8 var7 var6) (= var0 (inner (getTSLL (readHeap var10 var6))))) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 var9)) (= var5 var10)) (is-O_TSLL (readHeap var10 var6)))) (inv_main70 var5 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main86 var10 var9 var8 var7 var6) (= var0 (inner (getTSLL (readHeap var10 var6))))) (= var1 var6)) (= var5 var7)) (= var2 var8)) (= var3 var9)) (= var4 var10)) (is-O_TSLL (readHeap var10 var6))) (not (= var5 1)))) (inv_main70 var4 var3 var2 var5 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (and (and (and (and (inv_main32 var5 var4 var3) (= var2 var3)) (= var0 var4)) (= var1 (writeHeap var5 var3 (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var5 var3)))))))) (is-O_TSLL (readHeap var5 var3))) (is-O_TSLL (readHeap var5 var3))) (not (= nullAddr var2))) (= var2 nullAddr))) (inv_main42 var1 var0 var2))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main114 var2 var1 var0) (not (= nullAddr (next (getTSLL (readHeap var2 var0)))))) (is-O_TSLL (readHeap var2 var0)))) (inv_main121 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main81 var4 var3 var2 var1 var0) (= nullAddr (next (getTSLL (readHeap var4 var0))))) (is-O_TSLL (readHeap var4 var0)))) (inv_main86 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main103 var6 var5 var4) (= var3 (inner (getTSLL (readHeap var6 var5))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_TSLL (readHeap var6 var5))) (= nullAddr var3))) (inv_main106 var2 var1 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (inv_main114 var6 var5 var4) (= var0 nullAddr)) (= var1 var4)) (= var2 var5)) (= var3 (writeHeap var6 var4 defObj))) (= nullAddr (next (getTSLL (readHeap var6 var4))))) (is-O_TSLL (readHeap var6 var4)))) (inv_main106 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main76 var4 var3 var2 var1 var0) (not (= nullAddr (inner (getTSLL (readHeap var4 var0)))))) (is-O_TSLL (readHeap var4 var0)))) (inv_main83 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main21 var8 var7 var6) (or (and (= var2 nullAddr) (= var5 1)) (and (not (= var2 nullAddr)) (= var5 0)))) (= var0 var3)) (= var1 var4)) (= var2 (inner (getTSLL (readHeap var8 var7))))) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 var7))) (= var6 nullAddr)) (= var5 0))) (inv_main19 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main45 var3 var2 var1) (= var0 (inner (getTSLL (readHeap var3 var1))))) (is-O_TSLL (readHeap var3 var1)))) (inv_main56 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (and (and (inv_main11 var2 var1) (= var0 (writeHeap var2 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var2 var1))) nullAddr))))) (is-O_TSLL (readHeap var2 var1))) (is-O_TSLL (readHeap var2 var1)))) (inv_main10 var0 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (and (and (and (inv_main16 var2 var1) (= var0 (writeHeap var2 (inner (getTSLL (readHeap var2 var1))) (O_TSLL (TSLL (next (getTSLL (readHeap var2 (inner (getTSLL (readHeap var2 var1)))))) nullAddr))))) (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var1)))))) (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var1)))))) (is-O_TSLL (readHeap var2 var1)))) (inv_main10 var0 var1))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr) (var4 Addr) (var5 Heap) (var6 Addr) (var7 Addr) (var8 Addr) (var9 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main106 var9 var8 var7) (= var6 var2)) (= var0 var4)) (= var1 (writeHeap var5 var4 defObj))) (= var2 (next (getTSLL (readHeap var9 var8))))) (= var3 var7)) (= var4 var8)) (= var5 var9)) (is-O_TSLL (readHeap var9 var8))) (not (= nullAddr var6)))) (inv_main103 var1 var6 var6))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Addr) (var6 Addr) (var7 Int) (var8 Addr) (var9 Addr) (var10 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main96 var10 var9 var8 var7 var6) (= var4 (next (getTSLL (readHeap var10 var8))))) (= var0 var6)) (= var1 var7)) (= var2 var8)) (= var5 var9)) (= var3 var10)) (is-O_TSLL (readHeap var10 var8))) (= nullAddr var4)) (not (= nullAddr var5)))) (inv_main103 var3 var5 var4))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Int) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (and (inv_main26 var6 var5 var4) (= var0 nullAddr)) (= var3 var5)) (= var1 var6)) (= var2 0)) (not (= nullAddr var3))) (= nullAddr var3)) (not (= nullAddr var3)))) (inv_main103 var1 var3 var3))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (or (not (and (and (inv_main10 var2 var1) (= var0 (inner (getTSLL (readHeap var2 var1))))) (is-O_TSLL (readHeap var2 var1)))) (inv_main21 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap) (var7 Int) (var8 Addr) (var9 Addr) (var10 Addr) (var11 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main56 var11 var10 var9 var8) (or (and (= var3 nullAddr) (= var7 1)) (and (not (= var3 nullAddr)) (= var7 0)))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (= var3 (inner (getTSLL (readHeap var11 var9))))) (= var4 var9)) (= var5 var10)) (= var6 var11)) (is-O_TSLL (readHeap var11 var9))) (= var8 nullAddr)) (= var7 0))) (inv_main54 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Int) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main32 var6 var5 var4) (= var2 var4)) (= var0 var5)) (= var1 (writeHeap var6 var4 (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var6 var4)))))))) (is-O_TSLL (readHeap var6 var4))) (is-O_TSLL (readHeap var6 var4))) (not (= nullAddr var2))) (not (= var2 nullAddr))) (not (= var3 0)))) (inv_main46 var1 var0 var2))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (inv_main46 var3 var2 var1) (= var0 (writeHeap var3 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var3 var1))) nullAddr))))) (is-O_TSLL (readHeap var3 var1))) (is-O_TSLL (readHeap var3 var1)))) (inv_main45 var0 var2 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (and (and (inv_main51 var3 var2 var1) (= var0 (writeHeap var3 (inner (getTSLL (readHeap var3 var1))) (O_TSLL (TSLL (next (getTSLL (readHeap var3 (inner (getTSLL (readHeap var3 var1)))))) nullAddr))))) (is-O_TSLL (readHeap var3 (inner (getTSLL (readHeap var3 var1)))))) (is-O_TSLL (readHeap var3 (inner (getTSLL (readHeap var3 var1)))))) (is-O_TSLL (readHeap var3 var1)))) (inv_main45 var0 var2 var1))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Addr) (var5 Addr) (var6 Heap)) (or (not (and (and (and (and (and (and (and (inv_main103 var6 var5 var4) (= var3 (inner (getTSLL (readHeap var6 var5))))) (= var0 var4)) (= var1 var5)) (= var2 var6)) (is-O_TSLL (readHeap var6 var5))) (not (= nullAddr var3))) (= nullAddr var3))) (inv_main111 var2 var1 var3))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main3 var7 var6) (= var0 (newAddr (allocHeap var3 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var3 (O_TSLL var1))))) (= var4 var6)) (= var3 (writeHeap var7 var6 (O_TSLL (TSLL nullAddr (inner (getTSLL (readHeap var7 var6)))))))) (is-O_TSLL (readHeap var7 var6))) (is-O_TSLL (readHeap var7 var6))) (not (= var4 nullAddr))) (= var5 0))) (inv_main15 var2 var4 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main70 var4 var3 var2 var1 var0) (= nullAddr var0)) (<= 0 (+ 1 (* (- 1) var1))))) (inv_main96 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main3 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main3 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (inv_main7 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main11 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main11 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main15 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main15 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))) (is-O_TSLL (readHeap var2 var1))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main14 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main14 var1 var0) (not (is-O_TSLL (readHeap var1 (inner (getTSLL (readHeap var1 var0))))))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (and (inv_main14 var1 var0) (not (is-O_TSLL (readHeap var1 (inner (getTSLL (readHeap var1 var0))))))) (is-O_TSLL (readHeap var1 (inner (getTSLL (readHeap var1 var0)))))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main16 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main16 var1 var0) (not (is-O_TSLL (readHeap var1 (inner (getTSLL (readHeap var1 var0))))))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (and (inv_main16 var1 var0) (not (is-O_TSLL (readHeap var1 (inner (getTSLL (readHeap var1 var0))))))) (is-O_TSLL (readHeap var1 (inner (getTSLL (readHeap var1 var0)))))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main10 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main21 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))) (= var0 nullAddr)))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (inv_main19 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main31 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main31 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main30 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main32 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main32 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main37 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main42 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main46 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main46 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main50 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main50 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main49 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main49 var2 var1 var0) (not (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var0))))))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main49 var2 var1 var0) (not (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var0))))))) (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var0)))))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main51 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (inv_main51 var2 var1 var0) (not (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var0))))))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (and (and (inv_main51 var2 var1 var0) (not (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var0))))))) (is-O_TSLL (readHeap var2 (inner (getTSLL (readHeap var2 var0)))))) (is-O_TSLL (readHeap var2 var0))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main45 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main56 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (= var0 nullAddr)))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main54 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main64 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main69 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (inv_main78 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main76 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (inv_main83 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main81 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (inv_main88 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main86 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main93 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var0)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (inv_main98 var4 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main96 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var2)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main103 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main111 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main109 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main116 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main114 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var0)))))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (inv_main121 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap)) (not (and (inv_main106 var2 var1 var0) (not (is-O_TSLL (readHeap var2 var1)))))))
(check-sat)
