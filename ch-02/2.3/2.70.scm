#lang scheme

; leaf procedures
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

; tree procedures
(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

; decoding 
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

; encoding
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (has-symbol? symbol tree)
  (not (false? (member symbol (symbols tree)))))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
    null
    (cond ((has-symbol? symbol (left-branch tree)) 
            (cons 0 (encode-symbol symbol (left-branch tree))))
          ((has-symbol? symbol (right-branch tree))
            (cons 1 (encode-symbol symbol (right-branch tree))))
          (else (error "not found")))))

; sets of weighted elements
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

; successive merge
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (if (= (length leaf-set) 1)
      (car leaf-set)
      (successive-merge (adjoin-set (make-code-tree (car leaf-set) (car (cdr leaf-set)))
                                    (cdr (cdr leaf-set))))))

; lyrics
(define frequencies (list (list 'A 2)
                          (list 'NA 16)
                          (list 'BOOM 1)
                          (list 'SHA 3)
                          (list 'GET 2)
                          (list 'YIP 9)
                          (list 'JOB 2)
                          (list 'WAH 2)))

(define tree (generate-huffman-tree frequencies))

(define message (list 'GET 'A 'JOB 'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'GET 'A 'JOB 'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'WAH 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'SHA 'BOOM))

(encode message tree)
(length (encode message tree))