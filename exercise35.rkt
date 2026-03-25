#lang htdp/bsl

; String -> 1String
; Extracts the last character from a non-empty string.
; given: "hello world", expected: "d"
; given: "fish", expected: "h"

(define (string-last str)
  (string-ith str (- (string-length str) 1)))

(string-last "hello world")
(string-last "fish")

