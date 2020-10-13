#lang scheme

(define (square x) (* x x))

(define (fast-expt b n)
    (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (square b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* a b)))))

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
    (lambda (x) (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
          
  (try first-guess))

(define dx 0.00001)

(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (if (= n 1)
        f 
        (repeated (compose f f) (- n 1))))

; (log n k) ; k -> base, built-in function

(define (nth-root n x)
    (fixed-point ((repeated average-damp (floor (log n 2))) (lambda (y) (/ x (fast-expt y (- n 1))))) 
                1.0))

(nth-root 2 16)
(nth-root 3 27)
(nth-root 4 64)
