#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
    (accumulate (lambda (leaves sum)
                    (+ leaves sum)) 
                0
                (map (lambda (sub-tree)
                        (if (pair? sub-tree)
                            (count-leaves sub-tree)
                            1))
                    t)))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x) ; 4

(list x x) ; (((1 2) 3 4) ((1 2) 3 4))

(count-leaves (list x x)) ; 8
