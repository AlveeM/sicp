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

; (define (unique-triplets n)
;   (flatmap (lambda (i) 
;               (flatmap (lambda (j)
;                           (map (lambda (k) (list i j k))
;                                 (enumerate-interval 1 (- j 1))))
;                       (enumerate-interval 1 (- i 1))))
;           (enumerate-interval 1 n)))

(define (unique-pairs n)
  (flatmap (lambda (i)
              (map (lambda (j) (list i j))
                    (enumerate-interval 1 (- i 1))))
          (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap
   (lambda (pair)
     (let ((i (car pair))
           (j (cadr pair)))
       (map (lambda (k) (list i j k))
          (enumerate-interval 1 (- j 1)))))
   (unique-pairs n)))

(define (triplet-sum n s)
  (filter (lambda (items) (= (accumulate + 0 items) s))
          (unique-triples n)))

(triplet-sum 4 6)


