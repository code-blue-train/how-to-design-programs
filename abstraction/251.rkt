;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |251|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 251. Design fold1, which is the abstraction of the two functions in figure 93.

; [List-of Number] Number [X Y -> Z] -> Number
; consumes [List-of Number] l, number e and function F
; applies F to l
; when l is empty applies e
(check-expect (fold1 (list 1 1) 0 +)
              2)
(check-expect (fold1 (list 2 2) 1 *)
              4)
(define (fold1 l e F)
  (cond
    [(empty? l) e]
    [else
     (F (first l)
        (fold1 (rest l) e F))]))