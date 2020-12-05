#lang scheme

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
              (map (lambda (j) (list i j))
                    (enumerate-interval 1 (- i 1))))
          (enumerate-interval 1 n)))

(unique-pairs 4) ; ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))

(define (square x) (* x x))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
        (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
        (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 10))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 6)

