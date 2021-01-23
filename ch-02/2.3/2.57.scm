#lang scheme

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (augend sum)
  (accumulate make-sum 0 (caddr sum)))

(define (multiplicand sum)
  (accumulate make-product 1 (caddr sum)))

; (define list-1 (list 0 1 2))
; (cadr list-1)  ; 1
; (caddr list-1) ; 2