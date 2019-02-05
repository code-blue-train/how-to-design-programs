;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |244|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 244. Argue why the following sentences are now legal:

(define (f x)
  (x 10))

; the x parameter is treated in the function definition as a function
; with 10 as the argument of the x function call

(define (f x)
  (x f))

; the x parameter in f's function body is a function
; the function name f is a variable to the x fucntion
; these are legal now

(define (f x y)
  (x 'a y 'b))

; function parameter x is a function in f's body
; with 'a, variable y and 'b as arguments to those functions

; Explain your reasoning.
; the arguments to x are used for computation in the f's function body