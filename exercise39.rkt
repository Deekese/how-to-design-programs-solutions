#lang htdp/bsl

(require 2htdp/image)

(require 2htdp/universe)

; Physical constants
(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define BODY-WIDTH (* WHEEL-DISTANCE 2))
(define BODY-HEIGHT (* 3 WHEEL-RADIUS))

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

CAR