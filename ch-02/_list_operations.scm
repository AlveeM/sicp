#lang scheme

(define test-list (list 1 2 3 4 5))
; (car test-list)
; (cdr test-list)

(define (list-ref items n)
    (display items)
    (newline)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))

(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))

(define odds (list 1 3 5 7))

(length odds)

