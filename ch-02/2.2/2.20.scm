#lang scheme

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(define (same-parity x . rest)
    (let ((rem (remainder x 2))
            (helper (lambda (x rest parity)
                        )))))

(same-parity 2 2 3 4)