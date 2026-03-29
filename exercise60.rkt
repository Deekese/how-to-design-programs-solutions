#lang htdp/bsl

; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next-numeric 0) 1)
(check-expect (tl-next-numeric 1) 2)
(check-expect (tl-next-numeric 2) 0)
(define (tl-next-numeric cs) (modulo (+ cs 1) 3))

; No. Switch to a new state is faster than the cond expression with strings.
; Interpretation of the numbers are difficult without the mapping from number to traffict light color.
