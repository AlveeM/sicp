; Ben Bitdiddle has invented a test to determine whether the interpreter 
; he is faced with is using applicative-order evaluation or 
; normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; Applicative Order
- The arguments in the evaluation expression would have to be evaluated before the conditional expression can be evaluated.
- Since `(p)` defined to be recursive, it will get stuck in an infinite loop.

; Normal Order
- The conditional expression would run with x replaced with 0 and y replaced with (p) resulting in the following:
  (if (= 0 0)
    0
   (p))
- The predicate expression would evaluate to true and the result would be 0.