(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

(define (fast-mult a b)
    (cond ((or (= a 0) (= b 0)) 0)
          ((= b 1) a)
          ((even? b) (double (fast-mult a (halve b))))
          (else (+ a (fast-mult a (- b 1))))))