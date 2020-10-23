#lang scheme

(define (gcd a b)
  (if (= b 0)
      a 
      (gcd b (remainder a b))))

(define (sign x)
  (if (negative? x)
      -1
      (if (positive? x)
          1
          0)))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (* (sign n) (sign d) (abs (/ n g))) (abs (/ d g)))))