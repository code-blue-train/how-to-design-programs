;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |252|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Exercise 252. Design fold2, which is the abstraction of the two functions in figure 94.
; Compare this exercise with exercise 251. Even though both involve the product function,
; this exercise poses an additional challenge because the second function, image*,
; consumes a list of Posns and produces an Image.
; Still, the solution is within reach of the material in this section,
; and it is especially worth comparing the solution with the one to the preceding exercise.
; The comparison yields interesting insights into abstract signatures.

; graphical constants:    
(define emt
  (empty-scene 100 100))
(define dot
  (circle 3 "solid" "red"))


; [List-of ITEM] ITEM Function -> ITEM
; consumes a [List-of ITEM] l, an ITEM e and a function 
; applies F to l
; e is the value when l is empty
(check-expect (fold2
               (list (make-posn 25 25) (make-posn 50 50))
               emt
               place-dot)
              (place-image
               dot 25 25
               (place-image dot 50 50 emt)))
(check-expect (fold2 (list 2 2) 1 *)
              4)             
(define (fold2 l e F)
  (cond
    [(empty? l) e]
    [else
     (F (first l)
        (fold2 (rest l) e F))]))


; Posn Image -> Image 
(define (place-dot p img)
  (place-image
     dot
     (posn-x p) (posn-y p)
     img))