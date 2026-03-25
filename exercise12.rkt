#lang htdp/bsl

; Exercise 12

(define (side-area side-length)
  (sqr side-length))

(define (cvolume side-length)
  (* side-length (side-area side-length)))

(define (csurface side-length)
  (* 6 (side-area side-length)))

(cvolume 5)
(csurface 5)

; A square is a 2d object with a width and a length.
; In 3-dimensional space we can imagine that a square has a thickness of 1.
; By adding length times squares side-by-side, we get a cube.