#lang scheme

; (1 3 (5 7) 9)
(define test (list 1 3 (list 5 7) 9))
; (car test)
; (cdr test)
; (cdr (cdr test))
; (car (cdr (cdr test)))
; (cdr (car (cdr (cdr test))))
(car (cdr (car (cdr (cdr test)))))

; ((7))
(define test-2 (list (list 7)))
(car (car test-2))

; (1 (2 (3 ( 4 (5 (6 7))))))
(define test-3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr test-3))))))))))))