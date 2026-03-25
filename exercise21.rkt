#lang htdp/bsl

(define (ff a) (* 10 a))

; (ff (ff 1))

(+ (ff 1) (ff 1))
; DrRacket's stepper does not reuse the results of computation.
; Instead calculates it again.