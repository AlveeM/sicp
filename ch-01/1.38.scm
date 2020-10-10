#lang scheme

(define (cont-frac n d k)
    (define (iter-helper i result)
        (if (= i 0)
            result
            (iter-helper (- i 1) (/ (n i) (+ (d i) result)))))
    (iter-helper k 0))

(define (e)
    (+ 2 (cont-frac (lambda (i) 1.0)
            (lambda (i)
                (if (= 0 (remainder (+ i 1) 3))
                    (/ (* 2 (+ i 1)) 3)
                    1))
            10)))

(e)