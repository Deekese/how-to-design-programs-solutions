#lang htdp/bsl

(require 2htdp/image)

(define (image-area img)
  (* (image-height img) (image-width img)))

(image-area (rectangle 20 5 "solid" "blue"))