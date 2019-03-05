;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |254|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 254. Formulate signatures for the following functions:

; sort-n, which consumes a list of numbers and a function that consumes
; two numbers (from the list) and produces a Boolean;
; sort-n produces a sorted list of numbers.
; [List-of Number] [Number Number -> Boolean] -> [List-of Number]
; consumes a [List-of Number], and function F that consumes 2 of the numbers
; and produces a boolean
; the final output is a sorted list of numbers
(define (sort-n lon F) lon)

; sort-s, which consumes a list of strings and a function that consumes
; two strings (from the list) and produces a Boolean;
; sort-s produces a sorted list of strings.
; [List-of String] [String String -> Boolean] -> [List-of String]
; consumes a [List-of String], and function F that consumes 2 of the strings
; and produces a boolean
; the final output is a sorted list of strings
(define (sort-s los F) los)

; Then abstract over the two signatures, following the above steps.

; [X] [List-of X] [X X -> Boolean] -> [List-of X] 
; consumes a [List-of X], and 2 of the list are inputs into a
; function that returns a boolean;
; the final output is a [List-of X]
(define (abs l F) l)

; Also show that the generalized signature can be instantiated to describe
; the signature of a sort function for lists of IRs.

; [List-of IR] [IR IR -> Boolean] -> [List-of IR]
; consumes a [List-of IR], and 2 of the IR items are inputs into a function
; that returns a boolean
; the final output is a sorted [List-of IR]
(define (sort-IR loir F) loir)