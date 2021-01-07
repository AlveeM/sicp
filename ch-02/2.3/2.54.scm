#lang scheme

(define (equal? list-1 list-2)
  (cond ((and (empty? list-1) (empty? list-2)) #t)
        ((or (empty? list-1) (empty? list-2)) #f)
        ((not (eq? (car list-1) (car list-2))) #f)
        (else (equal? (cdr list-1) (cdr list-2)))))

(equal? '(this is a list) '(this is a list))   ;#t
(equal? '(this is a list) '(this (is a) list)) ;#f
