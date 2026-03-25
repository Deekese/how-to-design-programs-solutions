#lang htdp/bsl

(define REF-ATTENDEE 120)
(define REF-PRICE 5)
(define PRICE-CHANGE 0.1)
(define ATTENDEE-CHANGE 15)
(define FIXED-COST 180)
(define VAR-COST 0.04)

(define (attendees ticket-price)
  (- REF-ATTENDEE (* (- ticket-price REF-PRICE) (/ ATTENDEE-CHANGE PRICE-CHANGE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* VAR-COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))


(profit 1) ; 511.2
(profit 2) ; 937.2
(profit 3) ; 1063.2
(profit 4) ; 889.2
(profit 5) ; 415.2

; A ticket-price of $3 maximizes the theaters profit.