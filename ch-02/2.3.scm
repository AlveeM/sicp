#lang scheme

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-rectangle top-left-point bottom-right-point)
    (cons top-left-point bottom-right-point))

(define (top-left rect) (car rect))

(define (bottom-right rect) (cdr rect))

(define (top-right rect)
    (let ([x (x-point (cdr rect))]
            [y (abs (- (y-point (car rect)) (y-point (cdr rect))))])
        
        (make-point x y)))

(define (bottom-left rect)
    (let ([x (x-point (top-left rect))]
            [y (y-point (bottom-right rect))])
        (make-point x y)))

(define (width rect)
    (let ([x1 (x-point (top-left rect))]
            [x2 (x-point (bottom-right rect))])
        (abs (- x1 x2))))

(define (height rect)
    (let ([y1 (y-point (top-left rect))]
            [y2 (y-point (bottom-right rect))])
        (abs (- y1 y2))))

(define (area rect)
    (* (width rect) (height rect)))

(define (perimeter rect)
    (+ (* 2 (width rect)) (* 2 (height rect))))

(define test-rect (make-rectangle (make-point 0 4) (make-point 5 0)))
(top-left test-rect) ; 0, 5
(top-right test-rect) ; 5, 4
(bottom-right test-rect) ; 5, 0
(bottom-left test-rect) ; 0, 0
(area test-rect) ; 20
(perimeter test-rect) ; 16