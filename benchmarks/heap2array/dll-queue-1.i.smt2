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
                   ((TSLL (next Addr) (prev Addr) (data Int)))))
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
(declare-fun inv_main101 (Heap Addr Addr Int) Bool)
(declare-fun inv_main105 (Heap Addr Addr Int) Bool)
(declare-fun inv_main108 (Heap Addr Addr Int) Bool)
(declare-fun inv_main111 (Heap Addr Addr Int) Bool)
(declare-fun inv_main113 (Heap Addr Addr Int) Bool)
(declare-fun inv_main12 (Heap Addr Addr Int) Bool)
(declare-fun inv_main121 (Heap Addr Addr Int) Bool)
(declare-fun inv_main13 (Heap Addr Addr Int Addr) Bool)
(declare-fun inv_main14 (Heap Addr Addr Int) Bool)
(declare-fun inv_main15 (Heap Addr Addr Int) Bool)
(declare-fun inv_main18 (Heap Addr Addr Int) Bool)
(declare-fun inv_main19 (Heap Addr Addr Int) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main22 (Heap Addr Addr Int) Bool)
(declare-fun inv_main25 (Heap Addr Addr Int) Bool)
(declare-fun inv_main3 (Heap Addr) Bool)
(declare-fun inv_main30 (Heap Addr Addr Int) Bool)
(declare-fun inv_main34 (Heap Addr Addr Int) Bool)
(declare-fun inv_main39 (Heap Addr Addr Int) Bool)
(declare-fun inv_main4 (Heap Addr) Bool)
(declare-fun inv_main42 (Heap Addr Addr Int) Bool)
(declare-fun inv_main45 (Heap Addr Addr Int) Bool)
(declare-fun inv_main47 (Heap Addr Addr Int) Bool)
(declare-fun inv_main5 (Heap Addr) Bool)
(declare-fun inv_main51 (Heap Addr Addr Int) Bool)
(declare-fun inv_main55 (Heap Addr Addr Int) Bool)
(declare-fun inv_main58 (Heap Addr Addr Int) Bool)
(declare-fun inv_main60 (Heap Addr Addr Int) Bool)
(declare-fun inv_main63 (Heap Addr Addr Int) Bool)
(declare-fun inv_main65 (Heap Addr Addr Int) Bool)
(declare-fun inv_main70 (Heap Addr Addr Int) Bool)
(declare-fun inv_main74 (Heap Addr Addr Int) Bool)
(declare-fun inv_main77 (Heap Addr Addr Int) Bool)
(declare-fun inv_main79 (Heap Addr Addr Int) Bool)
(declare-fun inv_main8 (Heap Addr Addr Int) Bool)
(declare-fun inv_main82 (Heap Addr Addr Int) Bool)
(declare-fun inv_main84 (Heap Addr Addr Int) Bool)
(declare-fun inv_main88 (Heap Addr Addr Int) Bool)
(declare-fun inv_main90 (Heap Addr Addr Int) Bool)
(declare-fun inv_main94 (Heap Addr Addr Int) Bool)
(declare-fun inv_main96 (Heap Addr Addr Int) Bool)
(assert (forall ((var0 Heap)) (or (not (= var0 emptyHeap)) (inv_main2 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (and (and (inv_main3 var2 var1) (= var0 (writeHeap var2 var1 (O_TSLL (TSLL nullAddr (prev (getTSLL (readHeap var2 var1))) (data (getTSLL (readHeap var2 var1)))))))) (is-O_TSLL (readHeap var2 var1))) (is-O_TSLL (readHeap var2 var1)))) (inv_main4 var0 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main94 var8 var7 var6 var5) (= var4 (data (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))))))))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))))))))) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7))))))))) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))) (is-O_TSLL (readHeap var8 var7))) (not (= var4 3)))) (inv_main101 var3 var2 var1 var0))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap)) (or (not (and (and (and (inv_main4 var2 var1) (= var0 (writeHeap var2 var1 (O_TSLL (TSLL (next (getTSLL (readHeap var2 var1))) nullAddr (data (getTSLL (readHeap var2 var1)))))))) (is-O_TSLL (readHeap var2 var1))) (is-O_TSLL (readHeap var2 var1)))) (inv_main5 var0 var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Int) (var3 Addr) (var4 Addr) (var5 Heap)) (or (not (and (and (and (inv_main13 var5 var4 var3 var2 var1) (= var0 (writeHeap var5 var3 (O_TSLL (TSLL var1 (prev (getTSLL (readHeap var5 var3))) (data (getTSLL (readHeap var5 var3)))))))) (is-O_TSLL (readHeap var5 var3))) (is-O_TSLL (readHeap var5 var3)))) (inv_main12 var0 var4 var3 var2))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main77 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 var7))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 var7))) (= var4 nullAddr))) (inv_main84 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main82 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))) (is-O_TSLL (readHeap var8 var7))) (= var4 nullAddr))) (inv_main90 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main42 var3 var2 var1 var0) (= var0 2)) (not (= var2 nullAddr)))) (inv_main58 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main42 var3 var2 var1 var0) (not (= var0 2)))) (inv_main55 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main63 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))) (is-O_TSLL (readHeap var8 var7))) (not (= var4 nullAddr)))) (inv_main55 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main42 var3 var2 var1 var0) (= var0 2)) (= var2 nullAddr))) (inv_main60 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main18 var3 var2 var1 var0) (= var2 nullAddr))) (inv_main30 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main8 var4 var3 var2 var1) (= var0 0)) (= var3 nullAddr))) (inv_main39 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main108 var3 var2 var1 var0) (= var0 0))) (inv_main111 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap) (var9 Int) (var10 Int) (var11 Addr) (var12 Addr) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main108 var13 var12 var11 var10) (or (and (<= 0 (+ var4 (* (- 1) 1))) (= var9 1)) (and (not (<= 0 (+ var4 (* (- 1) 1)))) (= var9 0)))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 (data (getTSLL (readHeap var13 var11))))) (= var5 var10)) (= var6 var11)) (= var7 var12)) (= var8 var13)) (is-O_TSLL (readHeap var13 var11))) (not (= var10 0))) (not (= var9 0)))) (inv_main111 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap) (var9 Int) (var10 Int) (var11 Addr) (var12 Addr) (var13 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (and (and (inv_main108 var13 var12 var11 var10) (or (and (<= 0 (+ var4 (* (- 1) 1))) (= var9 1)) (and (not (<= 0 (+ var4 (* (- 1) 1)))) (= var9 0)))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (= var4 (data (getTSLL (readHeap var13 var11))))) (= var5 var10)) (= var6 var11)) (= var7 var12)) (= var8 var13)) (is-O_TSLL (readHeap var13 var11))) (not (= var10 0))) (= var9 0))) (inv_main113 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main82 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))) (is-O_TSLL (readHeap var8 var7))) (not (= var4 nullAddr)))) (inv_main88 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main18 var3 var2 var1 var0) (not (= var2 nullAddr))) (not (= var1 nullAddr)))) (inv_main8 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (and (inv_main5 var4 var3) (= var0 0)) (= var1 var3)) (= var2 (writeHeap var4 var3 (O_TSLL (TSLL (next (getTSLL (readHeap var4 var3))) (prev (getTSLL (readHeap var4 var3))) 0))))) (is-O_TSLL (readHeap var4 var3))) (is-O_TSLL (readHeap var4 var3)))) (inv_main8 var2 var1 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main18 var3 var2 var1 var0) (not (= var2 nullAddr))) (= var1 nullAddr))) (inv_main34 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main55 var3 var2 var1 var0) (= var0 3)) (= var2 nullAddr))) (inv_main79 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main15 var7 var6 var5 var4) (= var3 var4)) (= var0 var5)) (= var1 var6)) (= var2 (writeHeap var7 var5 (O_TSLL (TSLL nullAddr (prev (getTSLL (readHeap var7 var5))) (data (getTSLL (readHeap var7 var5)))))))) (is-O_TSLL (readHeap var7 var5))) (is-O_TSLL (readHeap var7 var5))) (not (= var3 0))) (= var3 1))) (inv_main22 var2 var1 var0 var3))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (inv_main14 var8 var7 var6 var5) (= var0 (next (getTSLL (readHeap var8 var6))))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 var6)))) (inv_main15 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main45 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 var7))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 var7))) (= var4 nullAddr))) (inv_main51 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main15 var7 var6 var5 var4) (= var3 var4)) (= var0 var5)) (= var1 var6)) (= var2 (writeHeap var7 var5 (O_TSLL (TSLL nullAddr (prev (getTSLL (readHeap var7 var5))) (data (getTSLL (readHeap var7 var5)))))))) (is-O_TSLL (readHeap var7 var5))) (is-O_TSLL (readHeap var7 var5))) (not (= var3 0))) (not (= var3 1))) (<= 0 (+ var3 (* (- 1) 2))))) (inv_main25 var2 var1 var0 var3))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (inv_main63 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))) (is-O_TSLL (readHeap var8 var7))) (= var4 nullAddr))) (inv_main70 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (inv_main105 var4 var3 var2 var1) (not (= var2 nullAddr))) (not (= var0 0)))) (inv_main108 var4 var3 var2 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (inv_main74 var8 var7 var6 var5) (= var0 (next (getTSLL (readHeap var8 var7))))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 var7)))) (inv_main105 var4 var3 var0 var1))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (inv_main111 var8 var7 var6 var5) (= var0 (next (getTSLL (readHeap var8 var6))))) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 var8)) (is-O_TSLL (readHeap var8 var6)))) (inv_main105 var4 var3 var0 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (inv_main8 var4 var3 var2 var1) (= var0 0)) (not (= var3 nullAddr))) (= var1 1)) (= var3 nullAddr))) (inv_main47 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main8 var4 var3 var2 var1) (= var0 0)) (not (= var3 nullAddr))) (not (= var1 1)))) (inv_main42 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main45 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 var7))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 var7))) (not (= var4 nullAddr)))) (inv_main42 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main105 var3 var2 var1 var0) (= var1 nullAddr)) (not (= var2 nullAddr)))) (inv_main121 var3 var2 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (inv_main105 var4 var3 var2 var1) (not (= var2 nullAddr))) (= var0 0)) (not (= var3 nullAddr)))) (inv_main121 var4 var3 var3 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Heap) (var3 Addr) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap) (var8 Addr) (var9 Int) (var10 Addr) (var11 Addr) (var12 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (and (inv_main121 var12 var11 var10 var9) (= var0 var4)) (= var1 var5)) (= var8 var3)) (= var2 (writeHeap var7 var5 defObj))) (= var3 (next (getTSLL (readHeap var12 var11))))) (= var4 var9)) (= var5 var10)) (= var6 var11)) (= var7 var12)) (is-O_TSLL (readHeap var12 var11))) (not (= var8 nullAddr)))) (inv_main121 var2 var8 var8 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (inv_main8 var4 var3 var2 var1) (= var0 0)) (not (= var3 nullAddr))) (= var1 1)) (not (= var3 nullAddr)))) (inv_main45 var4 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main88 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7))))))))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7))))))))) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))) (is-O_TSLL (readHeap var8 var7))) (not (= var4 nullAddr)))) (inv_main94 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main88 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7))))))))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7))))))))) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))) (is-O_TSLL (readHeap var8 var7))) (= var4 nullAddr))) (inv_main96 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (inv_main8 var7 var6 var5 var4) (= var0 (newAddr (allocHeap var7 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var7 (O_TSLL var1))))) (not (= var3 0)))) (inv_main13 var2 var6 var5 var4 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main58 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 var7))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 var7))) (= var4 nullAddr))) (inv_main65 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 TSLL) (var2 Heap) (var3 Heap)) (or (not (and (and (inv_main2 var3) (= var0 (newAddr (allocHeap var3 (O_TSLL var1))))) (= var2 (newHeap (allocHeap var3 (O_TSLL var1)))))) (inv_main3 var2 var0))))
(assert (forall ((var0 Heap) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (or (not (and (and (and (and (inv_main12 var4 var3 var2 var1) (= var0 (writeHeap var4 (next (getTSLL (readHeap var4 var2))) (O_TSLL (TSLL (next (getTSLL (readHeap var4 (next (getTSLL (readHeap var4 var2)))))) var2 (data (getTSLL (readHeap var4 (next (getTSLL (readHeap var4 var2))))))))))) (is-O_TSLL (readHeap var4 (next (getTSLL (readHeap var4 var2)))))) (is-O_TSLL (readHeap var4 (next (getTSLL (readHeap var4 var2)))))) (is-O_TSLL (readHeap var4 var2)))) (inv_main14 var0 var3 var2 var1))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main77 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 var7))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 var7))) (not (= var4 nullAddr)))) (inv_main82 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (inv_main15 var7 var6 var5 var4) (= var3 var4)) (= var0 var5)) (= var1 var6)) (= var2 (writeHeap var7 var5 (O_TSLL (TSLL nullAddr (prev (getTSLL (readHeap var7 var5))) (data (getTSLL (readHeap var7 var5)))))))) (is-O_TSLL (readHeap var7 var5))) (is-O_TSLL (readHeap var7 var5))) (= var3 0))) (inv_main19 var2 var1 var0 var3))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main19 var8 var7 var6 var5) (= var0 1)) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 (writeHeap var8 var6 (O_TSLL (TSLL (next (getTSLL (readHeap var8 var6))) (prev (getTSLL (readHeap var8 var6))) 1))))) (is-O_TSLL (readHeap var8 var6))) (is-O_TSLL (readHeap var8 var6)))) (inv_main18 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main22 var8 var7 var6 var5) (= var0 2)) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 (writeHeap var8 var6 (O_TSLL (TSLL (next (getTSLL (readHeap var8 var6))) (prev (getTSLL (readHeap var8 var6))) 2))))) (is-O_TSLL (readHeap var8 var6))) (is-O_TSLL (readHeap var8 var6)))) (inv_main18 var4 var3 var2 var0))))
(assert (forall ((var0 Addr) (var1 Addr) (var2 Heap) (var3 Int) (var4 Int) (var5 Addr) (var6 Addr) (var7 Heap)) (or (not (and (and (and (and (and (and (and (and (and (inv_main15 var7 var6 var5 var4) (= var3 var4)) (= var0 var5)) (= var1 var6)) (= var2 (writeHeap var7 var5 (O_TSLL (TSLL nullAddr (prev (getTSLL (readHeap var7 var5))) (data (getTSLL (readHeap var7 var5)))))))) (is-O_TSLL (readHeap var7 var5))) (is-O_TSLL (readHeap var7 var5))) (not (= var3 0))) (not (= var3 1))) (not (<= 0 (+ var3 (* (- 1) 2)))))) (inv_main18 var2 var1 var0 var3))))
(assert (forall ((var0 Int) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main25 var8 var7 var6 var5) (= var0 3)) (= var1 var5)) (= var2 var6)) (= var3 var7)) (= var4 (writeHeap var8 var6 (O_TSLL (TSLL (next (getTSLL (readHeap var8 var6))) (prev (getTSLL (readHeap var8 var6))) 3))))) (is-O_TSLL (readHeap var8 var6))) (is-O_TSLL (readHeap var8 var6)))) (inv_main18 var4 var3 var2 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Addr) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (inv_main58 var8 var7 var6 var5) (= var4 (next (getTSLL (readHeap var8 var7))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 var7))) (not (= var4 nullAddr)))) (inv_main63 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (inv_main55 var3 var2 var1 var0) (not (= var0 3)))) (inv_main74 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap) (var4 Int) (var5 Int) (var6 Addr) (var7 Addr) (var8 Heap)) (or (not (and (and (and (and (and (and (and (and (and (and (inv_main94 var8 var7 var6 var5) (= var4 (data (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))))))))))) (= var0 var5)) (= var1 var6)) (= var2 var7)) (= var3 var8)) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))))))))) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 (next (getTSLL (readHeap var8 var7))))))))) (is-O_TSLL (readHeap var8 (next (getTSLL (readHeap var8 var7)))))) (is-O_TSLL (readHeap var8 var7))) (= var4 3))) (inv_main74 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (or (not (and (and (inv_main55 var3 var2 var1 var0) (= var0 3)) (not (= var2 nullAddr)))) (inv_main77 var3 var2 var1 var0))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main3 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main3 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main4 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main4 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (inv_main5 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))))))
(assert (forall ((var0 Addr) (var1 Heap)) (not (and (and (inv_main5 var1 var0) (not (is-O_TSLL (readHeap var1 var0)))) (is-O_TSLL (readHeap var1 var0))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var2)))))))
(assert (forall ((var0 Addr) (var1 Int) (var2 Addr) (var3 Addr) (var4 Heap)) (not (and (and (inv_main13 var4 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var4 var2)))) (is-O_TSLL (readHeap var4 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main12 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main12 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var1))))))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (and (inv_main12 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var1))))))) (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var1)))))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main14 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main15 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main15 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main19 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main19 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main22 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main22 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main25 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main25 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (is-O_TSLL (readHeap var3 var1))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main30 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main34 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main39 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main47 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main45 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main51 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main60 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main58 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main65 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main63 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main63 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var2))))))) (is-O_TSLL (readHeap var3 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main70 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main79 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main77 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main84 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main82 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main82 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var2))))))) (is-O_TSLL (readHeap var3 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main90 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main88 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main88 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var2))))))) (is-O_TSLL (readHeap var3 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (and (inv_main88 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 (next (getTSLL (readHeap var3 var2)))))))))) (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var2)))))) (is-O_TSLL (readHeap var3 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main96 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main94 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main94 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var2))))))) (is-O_TSLL (readHeap var3 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (and (inv_main94 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 (next (getTSLL (readHeap var3 var2)))))))))) (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var2)))))) (is-O_TSLL (readHeap var3 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (and (and (inv_main94 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 (next (getTSLL (readHeap var3 (next (getTSLL (readHeap var3 var2))))))))))))) (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 (next (getTSLL (readHeap var3 var2))))))))) (is-O_TSLL (readHeap var3 (next (getTSLL (readHeap var3 var2)))))) (is-O_TSLL (readHeap var3 var2))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main101 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main74 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (and (inv_main108 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))) (not (= var0 0))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (inv_main113 var3 var2 var1 var0))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main111 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var1)))))))
(assert (forall ((var0 Int) (var1 Addr) (var2 Addr) (var3 Heap)) (not (and (inv_main121 var3 var2 var1 var0) (not (is-O_TSLL (readHeap var3 var2)))))))
(check-sat)
