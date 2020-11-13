#lang scheme

(define (last-pair list1)
    (if (null? (cdr list1))
        (car list1)
        (last-pair (cdr list1))))

(define test-list (list 1 2 3 4 5))
(last-pair test-list)