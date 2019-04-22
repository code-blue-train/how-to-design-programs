;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |138|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 138. Here is a data definition for representing sequences of amounts of money:

; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)

;Create some examples to make sure you understand the data definition.
;Also add an arrow for the self-reference.
;Design the sum function, which consumes a List-of-amounts and computes the sum of the amounts.
;Use DrRacket’s stepper to see how (sum l) works for a short list l in List-of-amounts.
(check-expect (sum '()) 0)
(check-expect (sum (cons 1 '())) 1)
(check-expect (sum (cons 2 (cons 5 '()))) 7)
;header
(define (header-sum loa)
  (cond
    [(empty? loa) ...]
    [(cons? loa) ...]))

;template
(define (template-sum loa)
  (cond
    [(empty? loa) ...]
    [(cons? loa)
     (... (first loa) ...
          (template-sum (rest loa)) ...)]))

(define (sum loa)
  (cond
    [(empty? loa) 0]
    [(cons? loa)
     (+ (first loa) (sum (rest loa)))]))

(sum (cons 1 (cons 10 (cons 5 '()))))
