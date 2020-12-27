#lang scheme

(define (list-ref items n)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n 1))))

; Method 1
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin frame) (list-ref frame 0))
(define (edge1 frame) (list-ref frame 1))
(define (edge2 frame) (list-ref frame 2))


; Method 2
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin frame) (car frame))
(define (edge1 frame) (car (cdr frame)))
(define (edge2 frame) (cdr (cdr test)))
