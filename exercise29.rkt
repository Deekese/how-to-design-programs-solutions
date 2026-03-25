#lang htdp/bsl

(define REF-ATTENDEE 120)
(define REF-PRICE 5)
(define PRICE-CHANGE 0.1)
(define ATTENDEE-CHANGE 15)
(define FIXED-COST 0)
(define VAR-COST 1.50)

(define (attendees ticket-price)
  (- REF-ATTENDEE (* (- ticket-price REF-PRICE) (/ ATTENDEE-CHANGE PRICE-CHANGE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* VAR-COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))


(define (profitX price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
        (* 1.50
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))


(profit 3) ; 630
(profit 4) ; 675
(profit 5) ; 420
; Lower profits than before and a ticket price of $4 is optimal.