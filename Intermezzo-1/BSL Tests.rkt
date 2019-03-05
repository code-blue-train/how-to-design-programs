;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |BSL Tests|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;exercise 128. Copy the following tests into DrRacket’s definitions area:

(check-member-of "green" "red" "yellow" "grey")
; fails because none of the values when compared using equal? yield #true

(check-within (make-posn #i1.0 #i1.1)
              (make-posn #i0.9 #i1.2)  0.01)
; fails because actual value is not within 1/00 of the expected value

(check-range #i0.9 #i0.6 #i0.8)
; fails because because exp #i0.9 isn't between the low-high expressions

(check-random (make-posn (random 3) (random 9))
              (make-posn (random 9) (random 3)))
; fails because the comparison expressions aren't equal ... the random function's arguments are reversed

(check-satisfied 4 odd?)
; fails because value 4 when applied to function odd? returns #false and
; and tests using check-satisfied must return #true to succeed

;Validate that all of them fail and explain why