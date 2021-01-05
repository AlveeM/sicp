#lang scheme

(define (make-segment vs ve)
  (cons vs ve))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))