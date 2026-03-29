#lang htdp/bsl

(require 2htdp/universe)
(require 2htdp/image)

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; WorldState -> Image
; Draws the circle with the given color
(check-expect (render "red") (circle 20 "solid" "red"))
(define (render ws)
  (circle 20 "solid" ws))

(define (main ws)
  (big-bang ws
    [on-tick traffic-light-next]
    [to-draw render]))

(main "yellow")