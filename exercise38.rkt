#lang htdp/bsl

; String -> String
; Returns the string with the last character removed.
; given: "hello world", expected: "hello worl"
; given: "", expected: ""

(define (string-remove-last str)
  (if (> (string-length str) 0)
      (substring str 0 (- (string-length str) 1))
      str))

(string-remove-last "hello world")
(string-remove-last "")