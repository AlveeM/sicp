#lang scheme

(define (identity x) x)

(define (inc x) (+ x 1))

(define (square x)
    (* x x))

(define (divides? a b)
    (= (remainder b a) 0))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
    (find-divisor n 2))

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

(define (prime? x) (fast-prime? x 20))

(define (filtered-accumulate combiner null-value term a next b filter)
    (if (> a b)
        null-value
        (if (filter a)
            (combiner (term a)
                      (filtered-accumulate combiner null-value term (next a) next b filter))
            (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (sum-square-primes start end)
    (filtered-accumulate + 0 square start inc end prime?))

(define (gcd a b)
    (if (= b 0)
        a 
        (gcd b (remainder a b))))

(define (product-relative-prime n)
    (define (relative-prime-filter x) (= 1 (gcd x n)))
    (filtered-accumulate * 1 identity 1 inc n relative-prime-filter))
