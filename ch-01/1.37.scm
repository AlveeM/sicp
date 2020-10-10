#lang scheme

(define (cont-frac n d k)
    (define (iter-helper i result)
        (if (= i 0)
            result
            (iter-helper (- i 1) (/ (n i) (+ (d i) result)))))
    (iter-helper k 0))

; (define (cont-frac n d k)
;     (define (recurse-helper i)
;         (if (> i k)
;             0
;             (/ (n i) (+ (d i) (recurse-helper (+ i 1))))))
;     (recurse-helper 1.0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)