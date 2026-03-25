#lang htdp/bsl

; Exercise 11

(define (orig-dist x y)
  (expt (+ (sqr x) (sqr y)) 1/2))

(orig-dist 4 2)