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

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(append squares odds) ; (1 4 9 16 25 1 3 5 7)

(define (map proc items)
  (if (null? items)
      items
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (scale-list items factor)
    (map (lambda (x) (* x factor)
        items)))