#lang scheme

(define (square x) (* x x))

(define (inc x) (+ x 1))

(define (inc-by-two x) (+ x 2))

(define (identity x) x)

(define (product-recurse term a next b)
    (if (> a b)
        1
        (* (term a)
            (product-recurse term (next a) next b))))

(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(define (factorial n)
    (product-iter identity 1 inc n))

(define (pi n)
    (* (/ (* 2 (square (product-iter identity 4.0 inc-by-two (- n 2))) n)
        (square (product-iter identity 3.0 inc-by-two (- n 1)))) 
        4))
