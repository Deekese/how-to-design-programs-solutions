#lang htdp/bsl

; String -> 1String
; Extracts the first character from a non-empty string.
; given: "hello world", expected: "h"
; given: "fish", expected: "f"
(define (string-first str)
  (string-ith str 0))

(string-first "hello world")
(string-first "fish")