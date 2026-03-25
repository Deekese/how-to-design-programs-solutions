#lang htdp/bsl

(define sunny #true)
(define friday #false)

(or (not sunny) friday)

; Why is the answer #false?
; Today is not friday and it is sunny.
; I only go to the mall if it is not sunny or if today is Friday.