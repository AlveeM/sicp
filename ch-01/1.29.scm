#lang scheme 

(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)

(define (simpsons-integral f a b n)
    (define (h) (/ (- b a) n))
    (define (y k) (f (+ a (* k (h)))))
    (define (term k)
        (if (or (= k 0) (= k n))
            (y k)
            (if (even? k)
                (* 2 (y k))
                (* 4 (y k)))))
    (* (/ (h) 3) (sum term 0 inc n)))

(simpsons-integral cube 0 1.0  100)
(simpsons-integral cube 0 1.0 1000)