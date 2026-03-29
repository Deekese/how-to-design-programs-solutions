#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)

; WorldState is the current level of the gauge

(define GAUGE-WIDTH 100)
(define GAUGE-HEIGHT 5)
(define TICK-DECREASE 0.1)
(define MIN-LEVEL 0)
(define MAX-LEVEL 100)
(define LEVEL-INCREASE 1/3)
(define LEVEL-DECREASE 1/5)

(define BACKGROUND (rectangle GAUGE-WIDTH (* GAUGE-HEIGHT MAX-LEVEL) "outline" "black"))

; WorldState -> WorldState
; Decreases gauge level by 0.1 for every tick.
; given: 6, expect: 7
(define (tock ws)
  (max 0 (- ws 0.1)))

; number number -> image
; Draw the rectangle with given width and height size
; given: 5 10, expect: (rectangle 5 10 "solid" "red")
(define (renderGauge width height)
  (rectangle width height "solid" "red"))

; WorldState -> image
; Renders the red gauge under the gauge outline
(define (render ws)
  (underlay/xy (renderGauge GAUGE-WIDTH (* GAUGE-HEIGHT ws)) 0 (- (* GAUGE-HEIGHT ws) (* GAUGE-HEIGHT MAX-LEVEL)) BACKGROUND))

; WorldState keypress -> WorldState
; Changes the gauge level depending on the pressed key
; given: 0 "down", expect: 0
; given: 100 "up", expect: 100
; given: 5 "up", expect: 5+1/3
; given: 10 "down", expect: 9+4/5
(define (keypress ws a-key)
  (cond
    [(key=? a-key "down") (max 0 (- ws 1/5))]
    [(key=? a-key "up") (min 100 (+ ws 1/3))]
    [else ws]))

(define (gauge-prop ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [on-key keypress]))

(gauge-prop 100)
