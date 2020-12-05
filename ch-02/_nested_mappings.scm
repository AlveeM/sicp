#lang scheme

(define (square x) (* x x))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

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

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

; (map (lambda (i)
;         (map (lambda (j) (list i j))
;             (enumerate-interval 1 (- i 1))))
;       (enumerate-interval 1 4))

; (accumulate append
;             null
;             (map (lambda (i)
;                    (map (lambda (j) (list i j))
;                         (enumerate-interval 1 (- i 1))))
;                  (enumerate-interval 1 5)))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

(define (permutations s)
  (if (null? s)                    ; empty set?
      (list null)                   ; sequence containing empty set
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(permutations (list 1 2))

(remove 1 (list 1 2 3))