;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.1 Ex 104|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; Lp is a structure
; it represents a vehicles license plate number
; (make-lp String)
(define-struct lp [n])

(define lp-test (make-lp "TEST ME"))
; Vehicle is a structure
; make-vehicle Number lp Number
; intepretation p represents the # of passengers, lp is the license plate number
; and f is fuel consumption (miles per gallon)
(define-struct vehicle [p lp f])
(define vehicle-test (make-vehicle 8 lp-test 20))

; Vehicle -> Vehicle
; template for a function that consumes vehicle and returns vehicle
(define (fn-vehicle v)
  (... (vehicle-p v) ... (lp-n (vehicle-lp v)) ... (vehicle-f v) ...))

