#lang htdp/bsl

; Exercise 4

(define str "helloworld")
(define i 5)

(string-append (substring str 0 i) (substring str (add1 i)))

; Legimite values for i are 0 to 9.