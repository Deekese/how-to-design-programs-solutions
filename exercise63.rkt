#lang htdp/bsl

(define (distance-to-0 ap)
  (sqrt
   (+ (sqr (posn-x ap))
      (sqr (posn-y ap)))))


(distance-to-0 (make-posn 3 4))
; 3²+4² = 9 + 16 = 25 , sqrt 25 = 5
(distance-to-0 (make-posn 6 (* 2 4)))
; 6² + 8² = 36 + 64 = 100, sqrt 100 = 10
(+ (distance-to-0 (make-posn 12 5)) 10)
; 12² + 5² = 144 + 25 = 169, sqrt 169 = 13
; 13 + 10 = 23
