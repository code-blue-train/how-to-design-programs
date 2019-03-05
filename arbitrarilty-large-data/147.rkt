;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |147|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 147. Develop a data definition for NEList-of-Booleans,
;a representation of non-empty lists of Boolean values.
; Then redesign the functions all-true and one-true from exercise 140.

; NEList-of-Booleans
; is one of:
; (cons Boolean '())
; (cons Boolean NEList-of-booleans)
; interpretation non-emtpy list of booleans

; NEList-of-booleans -> Boolean
; intepreation consumes ne-l and produces #true if all values are #true
; otherwise produces #false
(check-expect (all-true? (cons #true '())) #true)
(check-expect (all-true? (cons #true (cons #true '()))) #true)
(check-expect (all-true? (cons #false (cons #true '()))) #false)
(check-expect (all-true? (cons #true (cons #false (cons #true '())))) #false)

(define (all-true? ne-l)
  (cond
    [(empty? (rest ne-l)) #true]
    [else
     (and (first ne-l) (all-true? (rest ne-l)))]))

; NEList-of-booleans -> Boolean
; intepretation consumes ne-l and produces #true if any value in the list is #true
; otherwise produces #false
(check-expect (one-true? (cons #true '())) #true)
(check-expect (one-true? (cons #true (cons #true '()))) #true)
(check-expect (one-true? (cons #false '())) #false)
(check-expect (one-true? (cons #true (cons #false '()))) #true)

(define (one-true? ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else
     (or (first ne-l) (one-true? (rest ne-l)))]))


