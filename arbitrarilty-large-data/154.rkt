;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |154|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; An RD (Russian Doll) is one of
; String
; (make-layer String RD)
(define-struct layer [color doll])


; Exercise 154. Design the function colors.

; RD -> String
; intepretation consumes a Russian doll and produces a string of all colors,
; separated by a comma and a space. Thus our example should produce
(check-expect (colors (make-layer "yellow" (make-layer "green" "red"))) "yellow, green, red")
(check-expect (colors "yellow") "yellow")
(define (colors an-rd)
  (cond
   [(string? an-rd) an-rd]
   [else
     (string-append (layer-color an-rd) ", " (colors (layer-doll an-rd)))]))

(colors (make-layer "green" (make-layer "white" "red")))
     



