#lang scheme

(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (sum-recurse term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-recurse term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))