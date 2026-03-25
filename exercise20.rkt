#lang htdp/bsl

(define (string-delete str i)
  (string-append (substring str 0 i) (substring str (add1 i))))

(string-delete "hello_world" 5)