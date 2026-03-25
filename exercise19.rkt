#lang htdp/bsl

(define (string-insert str i)
  (string-append (substring str 0 i) "_" (substring str i)))

(string-insert "helloworld" 5)
(string-insert "" 0)