#lang scheme

; painter that draws the outline of the designated frame
(define seg-1 (make-segment (make-vect 0 0) (make-vect 0 1)))
(define seg-2 (make-segment (make-vect 0 1) (make-vect 1 1)))
(define seg-3 (make-segment (make-vect 1 1) (make-vect 1 0)))
(define seg-4 (make-segment (make-vect 1 0) (make-vect 0 0)))
(define seg-list (list seg-1 seg-2 seg-3 seg-4))

(define (draw-outline segments)
  (segments->painter segments))

; painter that draws an "X" by connecting opposite corners of the frame
(define seg-1 (make-segment (make-vect 0 0) (make-vect 1 1)))
(define seg-2 (make-segment (make-vect 0 1) (make-vect 1 0)))
(define seg-list (list seg-1 seg-2))

(define (draw-x segments)
  (segments->painter segments))

; painter that draws a diamond shape by connecting the midpoints of the sides of the frame
(define seg-1 (make-segment (make-vect 0 1) (make-vect 1 2)))
(define seg-2 (make-segment (make-vect 1 2) (make-vect 2 1)))
(define seg-3 (make-segment (make-vect 2 1) (make-vect 1 0)))
(define seg-4 (make-segment (make-vect 1 0) (make-vect 0 1)))
(define seg-list (list seg-1 seg-2 seg-3 seg-4))

(define (draw-diamond segments)
  (segments->painter segments))
