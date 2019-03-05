;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.7 Ex 79|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A Color is one of:
; Examples:
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"
; this list of colors isn't exhaustive
(define WHITE "white")
(define BLACK "black")

; H is a Number between 0 and 100.
; interpretation represents a happiness value
; Example:
(define HAPPY 100)
(define SOSO 50)
(define SAD 0)

(define-struct person [fstname lstname male?])
; A Person is a structure:
;   (make-person String String Boolean)
; Example:
(define Person1 (make-person "Darryl" "LaMonica" #true))
(define Person2 (make-person "Frida" "Kahlo" #false))


(define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; Example:
; (define owner1 (make-dog "Chancey Lapadias" "Donovan" 4 100))

; A Weapon is one of:
; — #false
; — Posn
; interpretation #false means the missle hasn't
; been fired yet; a Posn means a missle is in flight
; Example:
(define NOT-FIRED #false)
(define FIRED (make-posn 50 50))