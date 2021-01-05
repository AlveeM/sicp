#lang scheme

; Method 2 (using besides and rotations)
(define (below painter1 painter2)
  (rotate-270 (beside (rotate-90 painter1) 
                      (rotate-90 painter2))))