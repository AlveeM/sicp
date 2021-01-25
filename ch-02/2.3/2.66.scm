#lang scheme

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (lookup given-key records)
  (if (null? records)
    null
    (cond ((equal? given-key (key (entry records))) (entry records))
          ((< given-key (key (entry records)))
            (lookup given-key (left-branch records)))
          (else (lookup given-key (right-branch records))))))