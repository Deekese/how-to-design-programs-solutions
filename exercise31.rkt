#lang htdp/bsl

(require 2htdp/batch-io)

(write-file "first-name" "Matthew")
(write-file "last-name" "Fisler")
(write-file "author" "Felleisen")

(define (letter first-name last-name signature-name)
  (string-append
   (opening first-name)
   "\n\n"
   (body first-name last-name)
   "\n\n"
   (closing signature-name)))

(define (opening first-name)
  (string-append "Dear " first-name ","))

(define (body first-name last-name)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " last-name " have won our lottery. So, " "\n"
   first-name ", " "hurry and pick up your prize."))

(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

(define (main in-fst in-lst in-signature out)
(write-file out
            (letter (read-file in-fst)
                    (read-file in-lst)
                    (read-file in-signature))))

(main "first-name" "last-name" "author" "letter")