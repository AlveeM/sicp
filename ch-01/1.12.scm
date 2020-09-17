(define (pascal row r-idx)
    (if (or (= r-idx 1) (= row r-idx))
        1
        (+ (pascal (- row 1) (- r-idx 1))
           (pascal (- row 1) r-idx))))