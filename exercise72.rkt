#lang htdp/bsl

(define-struct phone [area number])
; A Phone is a structure:
; (make-phone Number Number)
; interpretation (make-phone area number) means a phone number with
; area code and the actual number

(define-struct phone# [area switch num])
; A Phone# is a structure:
; (make-phone# Number Number Number)
; interpretation area code consists of the first three digits of the phone number
; the next three the code for the phone switch (exchange) of your neighborhood
; num are the last four digits of phone with respect to the neighborhood.
; [000,999], [000, 999], [0000, 9999]

