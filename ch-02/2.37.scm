#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (row) (dot-product row v)) m))

(define matrix1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define matrix2 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define vector (list 1 2 3))