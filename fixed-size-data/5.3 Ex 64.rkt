;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.3 Ex 64|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; exercise 64
; computes the distance of ap to the origin
(check-expect (manhattan-distance (make-posn 3 4)) 7)
(check-expect (manhattan-distance (make-posn 10 10)) 20)

; calculates the Manhattan distance of mp to the origin
; Posn -> Number
(define (manhattan-distance mp)
  (+
   (posn-x mp)
   (posn-y mp)
   ))
  
    
     
