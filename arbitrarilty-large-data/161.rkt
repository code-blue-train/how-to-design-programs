;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |161|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 161. Translate the examples into tests and make sure they all succeed.
; Then change the function in figure 64 so that everyone gets $14 per hour.
; Now revise the entire program so that changing the wage for everyone
; is a single change to the entire program and not several.

; List-of-numbers is one of:
; '()
; (cons Number List-of-numbers)

; List-of-numbers -> List-of-numbers
; computes the weekly wages for the weekly hours

; constants
; employee hourly wage
(define HOURLY-WAGE 14)
(define WEEKLY-MAX-HOURS 100)

(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (cons 392 '()))
(check-expect (wage* (cons 4 (cons 2 '()))) (cons 56 (cons 28 '())))
(check-error (wage* (cons 28 (cons 101 '())))
             (string-append "employee cannot work more than " (number->string WEEKLY-MAX-HOURS)
                               " hours per week"))
(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [else
     (cond
       [(> (first whrs) WEEKLY-MAX-HOURS)
         ((error (string-append "employee cannot work more than " (number->string WEEKLY-MAX-HOURS)
                               " hours per week"))]
       [else (cons (wage (first whrs)) (wage* (rest whrs)))])]))

; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* HOURLY-WAGE h))


