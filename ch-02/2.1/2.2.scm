#lang scheme

(define (average x y) (/ (+ x y) 2))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
    (let ([x1 (x-point (start-segment segment))]
            [x2 (x-point (end-segment segment))]
            [y1 (y-point (start-segment segment))]
            [y2 (y-point (end-segment segment))])
        
        (make-point (average x1 x2) (average y1 y2))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; (define (test x y)
;     (let ([x 2]
;             [y (* y 2)])
;         (display x)
;         (display ",")
;         (display y)))

; (test 1 2)