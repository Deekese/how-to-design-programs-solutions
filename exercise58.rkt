#lang htdp/bsl

; Price -> Number
; Calculates the tax for a price
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 500) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 5000) (* 0.05 5000))
(check-expect (sales-tax 10000) (* 0.08 10000))
(check-expect (sales-tax 10001) (* 0.08 10001))

(define LOW-BOUND 1000)
(define LUX-BOUND 10000)

(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p LOW-BOUND)) 0]
    [(and (<= LOW-BOUND p) (< p LUX-BOUND)) (* 0.05 p)]
    [(>= p LUX-BOUND) (* 0.08 p)]))

