#lang scheme

(define x (list (list 1 2) (list 3 4)))

(define (fringe items)
    (if (null? items)
        items
        (if (pair? items)
            (append (fringe (car items)) (fringe (cdr items)))
            (list items))))

(fringe x)
(fringe (list x x))