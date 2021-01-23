#lang scheme

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (union set1 set2)
  (cond ((null? set1) set2)
        ((adjoin-set (car set1) (union (cdr set1) set2)))))