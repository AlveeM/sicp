#lang scheme

(define (variable? x) (symbol? x))

(define (make-exponentiation base exp)
  (cond ((= exp 0) 1)
        ((= exp 1) base)
        (else (list '** base exp))))

(define (base expression)
  (car (cdr expression)))

(define (exponent expression)
  (car (cdr (cdr expression))))

(define (exponentiation? expression)
  (and (pair? expression)
      (eq? (car expression) '**)))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
        (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) variable))
          (make-product (deriv (multiplier exp) variable)
                        (multiplicand exp))))                         
        (else
         (error "unknown expression type -- DERIV" exp))))
