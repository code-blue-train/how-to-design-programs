;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |140|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 140. Design the function all-true,
; which consumes a list of Boolean values and determines whether all of them are #true.
;In other words, if there is any #false on the list, the function produces #false.

; List-of-booleans
; contains:
; '()
; (cons Boolean list-of-booleans)

; List-of-booleans -> Boolean
; intepretation consumes list-of-booleans (lob) and if all values are #true
; return #true otherwise return #false
(define CONS1 (cons #false '()))
(define CONS2 (cons #true (cons #false '())))
(check-expect (all-true? (cons #false '())) #false)
(check-expect (all-true? (cons #true '())) #true)
(check-expect (all-true? (cons #true (cons #false (cons #false '())))) #false)
(define (all-true? lob)
  (cond
    [(empty? lob) #true]
    [(cons? lob)
     (and (first lob) (all-true? (rest lob)))]))

; List-of-booleans -> Boolean
; intepretation consumes a list-of-booleans (lob) and returns #true if one value in the
; list is true otherwise returns #false
(check-expect (one-true? (cons #true '())) #true)
(check-expect (one-true? (cons #false '())) #false)
(check-expect (one-true? (cons #false (cons #true '()))) #true)
(define (one-true? lob)
  (cond
   [(empty? lob) #false]
   [(cons? lob)
    (or (first lob) (one-true? (rest lob)))]))
   
   
    
    