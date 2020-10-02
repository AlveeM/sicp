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

(define (prime? n)
  (= n (smallest-divisor n)))

; 1.22 code starts here
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(define (search-for-primes start count)
  (if (= count 0)
        (display " done ")
        (if (and (> start 2) (= 0 (remainder start 2)))
            (search-for-primes (+ start 1) count)
            (if (timed-prime-test start)
                (search-for-primes (+ start 2) (- count 1))
                (search-for-primes (+ start 2) count)))))

(search-for-primes 100000000000 3)   ; 100,000,000,000
; (search-for-primes 1000000000000 3)  ; 1,000,000,000,000
; (search-for-primes 10000000000000 3) ; 10,000,000,000,000