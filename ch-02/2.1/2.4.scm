#lang scheme

(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p)))

(define (cdr z)
    (z (lambda (p q) q)))

(define test-cons (cons "str1" "str2"))
; (define test-cons (cons + -))

; (display test-cons)
; (car test-cons)
; (cdr test-cons)