#lang scheme

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x) (* x x))
  
(define (average x y)
    (/ (+ x y) 2))

(define (iterative-improve good-enough? improve-guess)
    (define (helper guess)
        (if (good-enough? guess)
            guess
            (helper (improve-guess guess))))
            
    (lambda (guess) (helper guess)))

(define (sqrt-iter x)
    (define (improve guess)
        (average guess (/ x guess)))

    (define (good-enough? guess)
        (< (abs (- (square guess) x)) 0.001))

    ((iterative-improve good-enough? improve) x))

(define (fixed-point f first-guess)
    (define tolerance 0.00001)

    (define (close-enough? guess)
        (< (abs (- guess (improve guess))) tolerance))

    (define (improve guess)
        (f guess))

    ((iterative-improve close-enough? improve) first-guess))

(fixed-point cos 1.0)

(fixed-point (lambda (y) (+ (sin y) (cos y)))
              1.0)