;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |239|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 239. A list of two items is another frequently used form of data
; in ISL programming. Here is a data definition with two parameters:
; A [List X Y] is a structure: 
;   (cons X (cons Y '()))

; pairs of numbers
; A [List Number Number] is a structure:
; (cons Number (cons Number '())))
(define pn
  (cons 1 (cons 2 '())))

; pairs of Numbers and 1Strings
; A [LIst Number 1String] is a structure:
; (cons Number (cons 1String '())))
(define pn1s
  (cons 1 (cons "a" '())))

; pairs of Strings and Booleans
; A [List Strings Booleans] is a structure:
; (cons String (cons Boolean '())))
(define psb
  (cons "String" (cons #false '())))