#lang htdp/bsl

(require 2htdp/image)

(require 2htdp/universe)

; Physical constants
(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define BODY-WIDTH (* WHEEL-DISTANCE 2))
(define BODY-HEIGHT (* 3 WHEEL-RADIUS))
(define TRACK-LENGTH (* 10 BODY-WIDTH))
(define TRACK-HEIGHT (* 3 BODY-HEIGHT))
(define Y-CAR (- (* 2 BODY-HEIGHT) WHEEL-RADIUS))
(define VELOCITY 1)

; Graphical constants
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define BODY
  (overlay/xy
  (rectangle BODY-WIDTH BODY-HEIGHT "solid" "red")
  (- (/ BODY-WIDTH 2) (/ WHEEL-DISTANCE 2))
  (- BODY-HEIGHT)
  (rectangle WHEEL-DISTANCE BODY-HEIGHT "solid" "red")))

(define CAR
  (overlay/xy BOTH-WHEELS
              (- (/ WHEEL-RADIUS 2))
              (-  (- (* 2 BODY-HEIGHT) WHEEL-RADIUS))
              BODY))


(define BACKGROUND (empty-scene TRACK-LENGTH TRACK-HEIGHT))

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

; WorldState -> WorldState
; given: 20, expect: 21
; given: 78, expect: 79
(define (tock cw)
  (+ cw 3))

(tock 20)
(tock 78)

; WorlState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(define (render cw)
  (place-image CAR (- cw (/ BODY-WIDTH 2)) (+ Y-CAR (sin cw)) BACKGROUND))


; WorldState -> Boolean
; Stops animation when car reaches the end of the track.
(define (end? cw)
  (> (* VELOCITY cw) TRACK-LENGTH))

; WorldState Number Numer String -> WorldState
; places the car at x-mouse
; if the give me is "button-down"

(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? me "button-down") x-mouse]
    [else x-position-of-car]))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [on-mouse hyper]
    [to-draw render]
    [stop-when end?]))

(main 0)