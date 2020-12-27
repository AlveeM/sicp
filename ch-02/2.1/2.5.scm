#lang scheme

(define (square x) (* x x))

(define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (square b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* a b)))))

(define (fast-expt b n)
    (fast-expt-iter b n 1))

(define (cons a b)
    (* (fast-expt 2 a) (fast-expt 3 b)))

(define (car pair)
    (if (= (remainder pair 2) 0)
        (+ (car (/ pair 2)) 1)
        0))

(define (cdr pair)
    (if (= (remainder pair 3) 0)
        (+ (cdr (/ pair 3)) 1)
        0))

(define test-pair (cons 1 2))
(car test-pair)
(cdr test-pair)