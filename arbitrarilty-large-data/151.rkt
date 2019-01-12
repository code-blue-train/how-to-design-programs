;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |151|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 151. Design the function multiply.
; It consumes a natural number n and multiplies it with a number x without using *.

; N Number -> Number
; intepretation consumes a natural number n and multiplies with
; a number x without using *
(check-expect (multiply 1 1) 1)
(check-expect (multiply 5 5) 25)
(check-expect (multiply 8 6) 48)
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [(positive? n) (+ x (multiply (sub1 n) x))]))

; multiplication is just the addition of one number a number of times
; e.g. 3 * 4 is equal to (4 + 4 + 4)