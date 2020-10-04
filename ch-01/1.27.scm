#lang scheme

(define (square x)
    (* x x))

(define (divides? a b)
    (= (remainder b a) 0))

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

(define (carmichael-test n)
    (define (iter-test start end)
        (if (= start end) 
            #t
            (if (fermat-test n)
                (iter-test (+ start 1) end)
                #f)))
    (iter-test 2 n))

; Carmichael Numbers: 561, 1105, 1729, 2465, 2821, and 6601
(carmichael-test 6601)