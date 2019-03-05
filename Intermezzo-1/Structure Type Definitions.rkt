;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Structure Type Definitions|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;exercise 125. Discriminate the legal from the illegal sentences:

(define-struct oops [])
; legal as the structure name is followed by opening/closing brackets

(define-struct child [parents dob date])
; legal as the structure definition has a single variable name
; and the variables for the structure values are also valid

(define-struct (child person) [dob date])
; illegal as the structure (child person) cannot contain 2 variables or wrapped in parens

;Explain why the sentences are legal or illegal. 

;exercise 126. Identify the values among the following expressions,
;assuming the definitions area contains these structure type definitions:

(define-struct point [x y z])
(define-struct none  [])

(make-point 1 2 3)
point-x = 1
point-y = 2
point-z = 3
all are values

(make-point (make-point 1 2 3) 4 5)
point-x = (make-point 1 2 3) 
point-y = 4
point-z = 5
point-x is a structure and the others are values

(make-point (+ 1 2) 3 4)
point-x = 3
point-y = 3
point-x = 4
all are values

(make-none)
= (make-none)
structure not a value as not values are defined in the structure defition

(make-point (point-x (make-point 1 2 3)) 4 5)
point-x = 1
point-y = 4
point-z = 5
all are values

;exercise 127. Suppose the program contains
(define-struct ball [x y speed-x speed-y])

(number? (make-ball 1 2 3 4))
;#false

(ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3))
;3

(ball-y (make-ball (+ 1 2) (+ 3 3) 2 3))
;6

(ball-x (make-posn 1 2))
; illegal as ball-x isn't a valid selector for posn
; stepper errored that the function application of ball? was expected

(ball-speed-y 5)
; illegal as selector requires a ball structure and not a value
; stepper error: ball-speed-y: contract violation expected: ball?  given: 5
