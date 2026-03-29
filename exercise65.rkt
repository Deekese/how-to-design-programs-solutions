#lang htdp/bsl

(define-struct movie [title producer year])
; constructor: make-movie
; selectors: movie-title, movie-producer, movie-year
; predicates: movie?

(define curr-movie (make-movie "Mario" "James" "1994"))
(movie-title curr-movie)
(movie-producer curr-movie)
(movie-year curr-movie)
(movie? curr-movie)

(define-struct person [name hair eyes phone])
; c: make-person
; s: person-name, person-hair, person-eyes, person-phone
; p: person?

(define-struct pet [name number])
; c: make-pet
; s: pet-name, pet-number
; p: pet?

(define-struct CD [artist title price])
; c: make-CD
; s: CD-artist, CD-title, CD-price
; p: CD?

(define-struct sweater [material size producer])
; c: make-sweater
; s: sweater-material, sweater-size, sweater-producer
; p: sweater?