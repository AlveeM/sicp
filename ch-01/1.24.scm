#lang scheme

(define (runtime) (current-milliseconds))

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

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (when (fast-prime? n (floor (log n)))
      (report-prime (- (current-inexact-milliseconds) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(define (search-for-primes start count)
  (if (= count 0)
        (display " done ")
        (if (and (> start 2) (= 0 (remainder start 2)))
            (search-for-primes (+ start 1) count)
            (if (boolean? (timed-prime-test start))
                (search-for-primes (+ start 2) (- count 1))
                (search-for-primes (+ start 2) count)))))

; (search-for-primes 1000 3)    
; (search-for-primes 100000 3)   
; (search-for-primes 1000000 3) 