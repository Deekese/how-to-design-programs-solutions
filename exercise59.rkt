#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)

; TrafficLight -> TrafficLight
; yields the next state, given the current state cs
(define (tl-next cs)
  (cond
    [(string=? cs "red") "green"]
    [(string=? cs "green") "yellow"]
    [(string=? cs "yellow") "red"]))

(define HEIGHT 30)
(define WIDTH 90)
(define CIRCLE-RADIUS (/ WIDTH 8))
(define RED-POS (- (/ WIDTH 3) CIRCLE-RADIUS))
(define YELLOW-POS (/ WIDTH 2))
(define GREEN-POS (+ (* 2/3 WIDTH) CIRCLE-RADIUS))

; Color Mode -> Circle Image
; Renders a circle with given color and mode.
(check-expect (render-circle "red" "solid") (circle CIRCLE-RADIUS "solid" "red"))
(define (render-circle color mode)
  (circle CIRCLE-RADIUS mode color))

; Color Color -> Mode
; Compares current color with constant color and choose the render mode
(check-expect (render-mode "red" "green") "outline")
(check-expect (render-mode "red" "red") "solid")
(define (render-mode const-color current-color)
  (if (string=? const-color current-color)
      "solid"
      "outline"))

; Color -> Traffic Light Image
; Renders the traffic light with current active color

(define (tl-render color)
  (place-image (render-circle "red" (render-mode "red" color))
         RED-POS (/ HEIGHT 2)
  (place-image (render-circle "yellow" (render-mode "yellow" color))
               YELLOW-POS (/ HEIGHT 2)
  (place-image (render-circle "green" (render-mode "green" color))
               GREEN-POS (/ HEIGHT 2)
               (empty-scene WIDTH HEIGHT)))))


; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))


(traffic-light-simulation "green")