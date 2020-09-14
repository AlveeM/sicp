(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; - When the `a-plus-abs-b` function is called, it evaluates the `if` condition first
; - If the value of b is greater than `0` then it evaluates to `+`
; - Otherwise, it evaluates to `-`
; - Then the primitive operator is applied to `a` and `b`