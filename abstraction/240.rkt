;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |240|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 240. Here are two strange but similar data definitions:

; An LStr is one of: 
; – String
; – (make-layer LStr)

; An LNum is one of: 
; – Number
; – (make-layer LNum)

; Both data definitions rely on this structure-type definition:
(define-struct layer [stuff])

; Both define nested forms of data: one is about numbers and the other about strings.
; Make examples for both. Abstract over the two.
; Then instantiate the abstract definition to get back the originals.

(define LS
  (make-layer "String"))

(define LN
  (make-layer 10))


; A [Layer STUFF] is a structure:
; (make-layer STUFF)

; A [Layer Number] is a structure:
; Number
; (make-layer Number)

; A [CL String] is a structure:
; String
; (make-layer String)
