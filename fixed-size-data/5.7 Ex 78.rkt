;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.7 Ex 78|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A Movie is a structure
;   (make-movie String String String)
; Example:
; Title: Godfather
; Producer: Robert Evans
; Year: 1974
(define-struct movie [title producer year])

; Person is structure
;   (make-person String String String String)
; Example:
; Name: Evelyn Shortstack
; Hair: Red
; Eyes: Red
; Phone: 555-555-5555
(define-struct person [name hair eyes phone])

; Pet is a structure
;   (make-pet String Number)
; Example:
; Name: Felix
; Number: 19
(define-struct pet [name number])

; A CD is a structure
;   (make-CD String String Number)
; Example:
; Artist: Pink Floyd
; Title: Meddle
; Price: 14.99
(define-struct CD [artist title price])

; A Sweater is a structure
;   (make-sweater String String String)
(define-struct sweater [material size producer])

; A pit-midnight is a structure
;   (make-pit-midnight Number Number Number)
; interpretation: defines a point in time since midnight
(define-struct pit-midnight [hours minutes seconds])

; A 3L-word is a structure
;   (make-3L-word String)
; intepretation: a three letter word
; Consists of :
; lowercase letters, represented with 1Strings "a" through "z"
; plus #false
; 
(define-struct 3L-word [word])

(define (test a)
  (make-3L-word a))