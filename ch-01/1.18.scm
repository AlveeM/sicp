(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

(define (fast-mult a b)
    (if (< b 0)
        (fast-mult-iter b a 0)
        (fast-mult-iter a b 0)))

(define (fast-mult-iter a b total)
    (cond ((or (= a 0) (= b 0)) 0)
          ((= b 1) (+ total a))
          ((even? b) (fast-mult-iter (double a) (halve b) total))
          (else (fast-mult-iter a (- b 1) (+ total a)))))