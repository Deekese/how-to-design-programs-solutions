#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)

(define HEIGHT 300) ; distances in pixels 
(define WIDTH  100)
(define YDELTA 3)
 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
 
(define CENTER (/ (image-height ROCKET) 2))

(define (place-rocket y-pos)
  (place-image ROCKET 10 (- HEIGHT y-pos CENTER) BACKG))

(check-expect (show 0) (place-rocket 0))
(check-expect (show "resting") (place-rocket 0))
(check-expect (show -2) (place-image (text (number->string -2) 20 "red")
                                     10 (* 3/4 WIDTH)
                                     (place-rocket 0)))
(check-expect (show 5) (place-rocket 5))

(define (show x)
  (cond
    [(string? x)
     (place-rocket 0)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-rocket 0))]
    [(>= x 0)
     (place-rocket x)]))

; Why? Avoids unnecessary repetitions and makes changes easier.

(define (launch x ke)
  (cond
    [(string? x) (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))

(define (fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (+ x 1)]
    [else (+ x YDELTA)]))

(define (stop x)
  (and (number? x) (= HEIGHT x)))

(define (main1 s)
  (big-bang s
    [to-draw show]
    [on-key launch]
    [on-tick fly 1/10]
    [stop-when stop]))

(main1 "resting")