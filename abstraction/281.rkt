;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |281|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 281. Write down a lambda expression that
(require 2htdp/image)

;consumes a number and decides whether it is less than 10;
((lambda (n) (< n 10)) 5)
;#true

;multiplies two given numbers and turns the result into a string;
((lambda (a b) (number->string (* a b))) 5 5)
; "25"

;consumes a natural number and returns 0 for evens and 1 for odds;
((lambda (n) (if (even? n) 0 1)) 4)
; 0

;consumes two inventory records and compares them by price;
(define-struct ir [name price])
; An IR is a structure:
;   (make-ir String Number)
((lambda (ir1 ir2)
  (= (ir-price ir1) (ir-price ir2)))
 (make-ir "goggles" 25.50) (make-ir "sunglasses" 30.50))
; #false


;adds a red dot at a given Posn to a given Image.
((lambda (p img)
  (place-image
   (circle 5 "solid" "red")
   (posn-x p) (posn-y p)
   img)) (make-posn 50 50) (empty-scene 100 100))
;(place-image
; (circle 5 "solid" "red")
; 50 50
; (empty-scene 100 100))