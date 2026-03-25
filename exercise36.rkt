#lang htdp/bsl

(require 2htdp/image)

; Image -> Number
; Counts the number of pixels in a given image.
; given: (rectangle 100 50 "solid" "blue"), expected: 5000

(define (image-area img)
  (* (image-height img) (image-width img)))

(image-area (rectangle 100 50 "solid" "blue"))