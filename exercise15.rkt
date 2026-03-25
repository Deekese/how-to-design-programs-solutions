#lang htdp/bsl

(define (==> sunny friday)
  (or friday (not sunny)))

(==> #true #true)
(==> #true #false)
(==> #false #true)
(==> #false #false)