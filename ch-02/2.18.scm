#lang scheme

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

; (define (reverse list1)
;     (if (null? (cdr list1))
;         list1
;         (append (reverse (cdr list1)) (list (car list1)))))

(define (reverse items)
    (define (iter acc rest)
        (if (null? rest)
            acc
            (iter (cons (car rest) acc) (cdr rest))))
    (iter (list) items))

(define test-list (list 1 2 3 4 5))

(reverse test-list)