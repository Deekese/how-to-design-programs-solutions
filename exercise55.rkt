#lang htdp/bsl

(require 2htdp/image)

(define HEIGHT 300) ; distances in pixels 
(define WIDTH  100)
(define YDELTA 3)
 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
 
(define CENTER (/ (image-height ROCKET) 2))

(define (place-rocket y-pos)
  (place-image ROCKET 10 (- y-pos CENTER) BACKG))

(check-expect (show HEIGHT) (place-rocket (- HEIGHT HEIGHT)))
(check-expect (show "resting") (place-rocket HEIGHT))
(check-expect (show -2) (place-image (text (number->string -2) 20 "red")
                                     10 (* 3/4 WIDTH)
                                     (place-rocket HEIGHT)))

(define (show x)
  (cond
    [(string? x)
     (place-rocket HEIGHT)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-rocket HEIGHT))]
    [(>= x 0)
     (place-rocket (- HEIGHT x))]))

; Why? Avoids unnecessary repetitions and makes changes easier.
