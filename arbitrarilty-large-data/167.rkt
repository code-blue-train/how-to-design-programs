;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |167|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; List-of-posn is one of
; '()
; (cons Posn List-of-posns)
; intepretation an instance of lop represents a posn

; Exercise 167. Design the function sum, which consumes a list of Posns
; and produces the sum of all of its x-coordinates.


; Posn -> Number
; intepretation consumes a posn and returns the x-coordinate
(define (p-x p)
  (posn-x p))

; Lop -> Number
; intepretation consumes a lop and produces the sum of the x-coordinates
(check-expect (sum '()) 0)
(check-expect (sum (cons (make-posn 1 5) (cons (make-posn 5 1) '()))) 6)
(define (sum lop)
  (cond
    [(empty? lop) 0]
    [(cons? lop)
     (+ (p-x (first lop)) (sum (rest lop)))]))
      




                 
            