#lang htdp/bsl

; String -> String
; Returns the string with the first character removed.
; given: "hello world", expected: "ello world"
; given: "", expected: ""

(define (string-rest str)
  (if (> (string-length str) 0)
      (substring str 1)
      str))

(string-rest "hello world")
(string-rest "")