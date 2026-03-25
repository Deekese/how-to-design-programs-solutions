#lang htdp/bsl

(require 2htdp/image)

(define (image-classify img)
  (cond [(> (image-height img) (image-width img)) "tall"]
        [(< (image-height img) (image-width img)) "wide"]
        [(= (image-height img) (image-width img)) "square"]))

(image-classify (rectangle 100 50 "solid" "red"))
(image-classify (rectangle 50 100 "solid" "blue"))
(image-classify (rectangle 50 50 "solid" "black"))