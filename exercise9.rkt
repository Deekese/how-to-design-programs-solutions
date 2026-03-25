#lang htdp/bsl

(require 2htdp/image)

;(define in -5)
;(define in "fish")
;(define in (rectangle 10 5 "solid" "blue"))
;(define in #false)
(define in #true)

(cond [(string? in) (string-length in)]
      [(image? in) (* (image-width in) (image-height in))]
      [(number? in) (abs in)]
      [(boolean? in) (if in
                         10
                         20)])