;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |BSL Grammar|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)


; exercise 116
; because x is a variable and variables are expressions

(= y z)
; = is a primitive application, y and z are variables
; and variables and primitive applications are expressions

(= (= y z) 0)
; = is a valid primitive application expression
; y ane z are valid variable expressions
; and 0 is a valid value expression

; exercise 117

(3 + 4)
; primitive applications require the operator to be the first value in the expression
; e.g. (+ 3 4)

number?
; there is no open parenthesis before the number? function

(x)
; there is no expression after the x variable

; Exercise 118
; why are they valid?
(define (f x) x)
; the function definition f is valid as it is a variable
; with a valid variable/expression x

(define (f x) y)
; the function definition f is valid as it is a variable
; with valid variable/expressions x and y

(define (f x y) 3)
; the function definition f is valid as it is a variable
; with valid expressions x and y
; and value 3 is a valid expression

; exercise 119
; why are these illegal?
(define (f "x") x)
; "x" is not a valid expression

(define (f x y z) (x))
; the expression (x) of function defintion f cannot start with an open parenthesis

; exercise 120. Discriminate the legal from the illegal sentences:
(x)
; illegal

(+ 1 (not x))
; illegal as primitive + expects a number as it second argument
; and not returns boolean

(+ 1 2 3)
; legal
; the + primitive expects a list of numbers as arguments/expressions
; this is an expression because it is a primitive application