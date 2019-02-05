;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |250|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 250. Design tabulate, which is the abstraction of the two functions in
; figure 92. When tabulate is properly designed, use it to define a tabulation function
; for sqr and tan.

; Number -> [List-of Numbers]
; consumes a number n and a function F and calculates F between
; n and 0 inclusive

(define CI .1)

(check-within (tabulate 2 sin)
              (tabulate-sin 2) CI)
(check-within (tabulate 2 sqrt)
              (tabulate-sqrt 2) CI)
(define (tabulate n F)
  (cond
    [(= n 0) (list (F 0))]
    [else
     (cons
      (F n)
      (tabulate (sub1 n) F))]))


; Number -> [List-of Numbers]
; tabulates sqrt between n and 0 (incl.) in a list
(define (tabulate-sqrt n)
  (tabulate n sqrt))

; Number -> [List-of Numbers]
; tabulates sin between n and 0 (incl.) in a list
(define (tabulate-sin n)
  (tabulate n sin))