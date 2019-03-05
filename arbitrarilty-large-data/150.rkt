;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |150|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 150. Design the function add-to-pi.
; It consumes a natural number n and adds it to pi without using the primitive + operation.
; Here is a start:
; N -> Number
; computes (+ n pi) without using +
 
(check-within (add-to-pi 3) (+ 3 pi) 0.001)
(check-within (add-to-pi 1) (+ 1 pi) 0.001)

(define (add-to-pi n)
  (cond
    [(zero? n) pi]
    [(positive? n) (add1 (add-to-pi (sub1 n)))]))

(check-expect (add 1 1) 2)
(check-expect (add 4 2) 6)
; N Number -> Number
; intepretation consumes N and arbitrary number n and adds N to n without using +
(define (add n x)
  (cond
    [(zero? n) x]
    [(positive? n) (add1 (add (sub1 n) x))]))

;Why does the skeleton use check-within?
; to force the comparison to pi to be within a precision that makes sense

