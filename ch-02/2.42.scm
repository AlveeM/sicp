#lang scheme

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define empty-board null)

(define (adjoin-position new-row k rest-of-queens)
  (cons (cons new-row k) rest-of-queens))

(define (safe? k positions)
  (let ((first-row (car (car positions)))
        (first-col (cdr (car positions))))
      (accumulate (lambda (pos cur-val)
                          (let ((row (car pos))
                                (col (cdr pos)))
                              (and cur-val
                                    (not (= (- first-row first-col) (- row col)))
                                    (not (= (+ first-row first-col) (+ row col)))
                                    (not (= first-row row)))))
                  #t
                  (cdr positions))))

(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)
