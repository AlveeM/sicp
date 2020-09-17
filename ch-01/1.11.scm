; Recursive Process
(define (fn n)
    (if (< n 3)
        n
        (+ (fn (- n 1)) 
           (* 2 (fn (- n 2))) 
           (* 3 (fn (- n 3))))))

; Iterative Process
(define (fn n)
    (if (< n 3)
        n
        (fn-iter 2 1 0 (- n 2))))
    
(define (fn-iter a b c count)
    (if (= count 0)
        a
        (fn-iter 
                 (+ a (* 2 b) (* 3 c))
                 a
                 b
                 (- count 1))))