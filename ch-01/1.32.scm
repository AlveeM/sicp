#lang scheme 

(define (inc x) (+ x 1))

(define (identity x) x)

(define (accumulate-recurse combiner null-value term a next b)
    (define (helper term a next b)
        (if (> a b)
            null-value
            (combiner (term a) (helper term (next a) next b))))
    (helper term a next b))

(define (accumulate-iter combiner null-value term a next b)
    (define (helper a result)
        (if (> a b)
            result
            (helper (next a) (combiner result (term a)))))
    (helper a null-value))

(define (sum term a next b)
    (accumulate-iter + 0 term a next b))

(define (product term a next b)
    (accumulate-iter * 1 term a next b))

(sum identity 1 inc 3)
(product identity 1 inc 4)