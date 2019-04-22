;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |279|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 279. Decide which of the following phrases are legal lambda expressions:

(lambda (x y) (x y y))
; valid as the function has parameters and a valid body

(lambda () 10)
; invalid as the function must have at least 1 parameter

(lambda (x) x)
; valid as the function has a parameter and a valid body

(lambda (x y) x)
; valid as the function has at least 1 parameter and a valid body

(lambda x 10)
; invalid as there is no parameter defined and a function must have at least 1 parameter