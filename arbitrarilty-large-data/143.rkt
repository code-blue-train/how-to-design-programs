;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |143|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;exercise 143. Determine how average behaves in DrRacket when applied to the empty list.
;Then design checked-average,
;a function that produces an informative error message when it is applied to '().

; List-of-temperatures -> Number
; computes the average temperature
(check-expect (average (cons 1 (cons 2 (cons 3 '())))) 2)
(define (average alot)
  (/ (sum alot) (how-many alot)))
 
; List-of-temperatures -> Number 
; adds up the temperatures on the given list 
(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot) (sum (rest alot)))]))
 
; List-of-temperatures -> Number 
; counts the temperatures on the given list
(check-expect (how-many (cons 1 '())) 1)
(check-expect (how-many (cons 1 (cons 2 (cons 3 '())))) 3)
(define (how-many alot)
  (cond
    [(empty? alot) 0]
    [(cons? alot) (length alot)]))
     