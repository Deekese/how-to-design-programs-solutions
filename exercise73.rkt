#lang htdp/bsl

; Posn Number -> Posn
; Updates Posn x position with the number
(check-expect (posn-up-x (make-posn 5 4) 2) (make-posn 2 4))
(define (posn-up-x point num)
  (make-posn num (posn-y point)))