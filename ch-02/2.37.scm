#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        null
        (cons (accumulate op init (map (lambda (seq) (car seq)) seqs))
                (accumulate-n op init (map (lambda (seq) (cdr seq)) seqs)))))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
    (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (map (lambda (y) (dot-product x y)) cols)) m)))

(define matrix1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define matrix2 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define vector (list 1 2 3))

(matrix-*-matrix matrix1 matrix2)