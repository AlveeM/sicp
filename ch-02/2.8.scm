#lang scheme

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y))
                    (- (upper-bound x) (lower-bound y))))

(define interval-1 (make-interval 2 3))
(define interval-2 (make-interval 1 3))

(add-interval interval-1 interval-2)
(sub-interval interval-1 interval-2)