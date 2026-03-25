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
(define VELOCITY 5)

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
; increases the number of clock ticks for every clock tick
; given: 20, expect: 21
; given: 78, expect: 79
(define (tock cw)
  (+ cw 1))

(tock 20)
(tock 78)

; WorlState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(define (render cw)
  (place-image tree (- TRACK-LENGTH 10) 20 (place-image CAR (- (* VELOCITY cw) (/ BODY-WIDTH 2)) (+ Y-CAR (sin (* VELOCITY cw))) BACKGROUND)))


; WorldState -> Boolean
; Stops animation when car reaches the end of the track.
(define (end? cw)
  (> (* VELOCITY cw) TRACK-LENGTH))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when end?]))

(main 0)