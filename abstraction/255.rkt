;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |255|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 255. Formulate signatures for the following functions:

; map-n, which consumes a list of numbers and a function from numbers to numbers
; to produce a list of numbers.
; [List-of Number] [Number -> Number] -> [List-of Number]
; consumes a list of numbers and a function from numbers to numbers
; to produce a list of numbers.
(define (map-n lon F) lon)

; map-s, which consumes a list of strings and a function from strings to strings
; and produces a list of strings.
; [List-of String] [String-> String] -> [List-of String]
; consumes a list of strings and a function from strings to strings
; to produce a list of strings.
(define (map-s los F) los)


; Then abstract over the two signatures, following the above steps.
; [X Y] [List-of X] [X -> Y] -> [List-of Y]
; consumes a list of X and a function from X to Y and produces a list of Y
(define (abstract l F) l)

; Also show that the generalized signature can be instantiated to describe
; the signature of the map1 function above
; [X Y] [List-of X] [X -> Y] -> [List-of Y]
(define (map1 l F) l)





