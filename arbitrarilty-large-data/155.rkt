;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |155|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; An RD (Russian Doll) is one of
; String
; (make-layer String RD)
(define-struct layer [color doll])


; Exercise 155. Design the function inner.

; RD -> String
; intepretation consumes a Russian doll and produces the color of
; the inner most doll
(check-expect (inner (make-layer "blue"
                           (make-layer "green"
                                       (make-layer "white" "black")))) "black")
(check-expect (inner "red") "red")
                                     
(define (inner an-rd)
  (cond
    [(string? an-rd) an-rd]
    [else
     (inner (layer-doll an-rd))]))

(inner (make-layer "red" (make-layer "white" "blue")))
    



