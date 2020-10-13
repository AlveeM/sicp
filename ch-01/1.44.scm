#lang scheme

(define dx 0.00001)

(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (if (= n 1)
        f 
        (repeated (compose f f) (- n 1))))

(define (smooth f)
    (lambda (x)
            (/ (+ (f (- x dx) (f x) (f (+ x dx)))) 3)))

(define (smooth-n-fold f n)
    ((repeated smooth n) f))
