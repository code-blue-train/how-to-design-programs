;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.8 Ex 81|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; Time -> Seconds
; consumes instances of time structures and computes the number of seconds
; that have passed since midnight (00:00:00)

; Time is a structure
;   (make-time Number Number Number)
; time-hours is a number between 0 and 24
; time-minutes is a number between 0 and 60
; time-seconds is a number between 0 and 60
; Examples;

(define-struct time [hours minutes seconds])
(define ex1 (make-time 0 0 0))
(define ex2 (make-time 24 60 60))
(define ex3 (make-time 12 30 2))

; Function examples as unit tests
(check-expect (time->seconds ex1) 0)
(check-expect (time->seconds ex2) 90060)
(check-expect (time->seconds ex3) 45002)
(define (time->seconds a)
  (+ (* (time-hours a) 60 60) (* (time-minutes a) 60) (time-seconds a)))