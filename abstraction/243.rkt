;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |243|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 243. Assume the definitions area in DrRacket contains
(define (f x) x)

; Identify the values among the following expressions:
(cons f '())
; f is the function call not a value
; '() is a value

(f f)
; the second f, the function argument, is a value

(cons f (cons 10 (cons (f 10) '())))
; (cons 10 (cons (f 10) are values

