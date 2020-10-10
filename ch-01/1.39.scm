#lang scheme

(define (square x) (* x x))

(define (cont-frac n d k)
    (define (iter-helper i result)
        (if (= i 0)
            result
            (iter-helper (- i 1) (/ (n i) (+ (d i) result)))))
    (iter-helper k 0))

(define (tan-cf x k)
    (cont-frac
        (lambda (i)
                (if (= i 1)
                    x
                    (- (square x))))
        (lambda (i) (- (* 2 i) 1))
        k))

(tan-cf 2.5 20)
(tan 2.5)

