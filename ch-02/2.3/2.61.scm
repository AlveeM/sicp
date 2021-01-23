#lang scheme

(define (adjoin-set el set)
  (cond ((null? set) (cons el))
        ((= el (car set)) set)
        ((< x (car set)) (cons x set))
        ((else (cons (car set) (adjoin-set el (cdr set)))))))