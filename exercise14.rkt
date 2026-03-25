#lang htdp/bsl

(define (string-last str)
  (if (> (string-length str) 0)
      (string-ith str (- (string-length str) 1))
      ""))

(string-last "hello world")
(string-last "")