#lang htdp/bsl

(define-struct movie [title producer year])
; constructor: make-movie
; selectors: movie-title, movie-producer, movie-year
; predicates: movie?
; String, String, Number

(define curr-movie (make-movie "Mario" "James" "1994"))
(movie-title curr-movie)
(movie-producer curr-movie)
(movie-year curr-movie)
(movie? curr-movie)

(define-struct person [name hair eyes phone])
; c: make-person
; s: person-name, person-hair, person-eyes, person-phone
; p: person?
; String, String, String, Number

(make-person "James" "green" "blue" "0175")

(define-struct pet [name number])
; c: make-pet
; s: pet-name, pet-number
; p: pet?
; String, Number
(make-pet "Fluffy" "1")

(define-struct CD [artist title price])
; c: make-CD
; s: CD-artist, CD-title, CD-price
; p: CD?
; String, String, Number
(make-CD "Eminem" "Please stand up" 99)

(define-struct sweater [material size producer])
; c: make-sweater
; s: sweater-material, sweater-size, sweater-producer
; p: sweater?
; String, Number, String
(make-sweater "Cotton" 42 "Nike")