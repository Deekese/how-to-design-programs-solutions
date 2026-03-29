#lang htdp/bsl
; Pos -> Number
; For a given position returns the manhattan distance
(check-expect (manhattan-distance (make-posn 3 5)) 8)
(define (manhattan-distance pos)
  (+ (posn-x pos) (posn-y pos)))