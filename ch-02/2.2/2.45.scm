#lang scheme

; (define (right-split painter n)
;   (if (= n 0)
;       painter
;       (let ((smaller (right-split painter (- n 1))))
;         (beside painter (below smaller smaller)))))

; (define (up-split painter n)
;   (if (= n 0)
;       painter
;       (let ((smaller (up-split painter (- n 1))))
;         (below (beside (smaller smaller)) painter))))

(define (split op1 op2)
  (define (split-rec painter n)
    (if (= n 0)
      painter
      (let ((smaller (split-rec painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))  
  split-rec)

(define right-split (split beside below))
(define up-split (split below beside))