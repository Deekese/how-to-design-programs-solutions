#lang htdp/bsl

; Constant speed of ball
(define SPEED 3)
; location = number distance of ball to ceiling
; direction = string describe moving direction of ball ("up", "down")
(define-struct balld [location direction])

(make-balld 10 "up")
(make-balld 2 "down")