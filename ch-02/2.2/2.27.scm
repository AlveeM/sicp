#lang scheme

(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse items)
    (if (null? items)
        items
        (if (pair? items)
            (append (deep-reverse (cdr items)) (cons (deep-reverse (car items)) (list)))
            items)))

(deep-reverse x)