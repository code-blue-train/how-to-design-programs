;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.6 Ex 58|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Price falls into one of three intervals
; - 0 through 999
; 1000 through 9999
; 10000 and above
; intepretation  the price of an item

; constants for the 3 tax-rate intervals in the tax table
(define TRI-1 0)
(define TRI-2 0.05)
(define TRI-3 0.08)

; Price -> Number
; computes the amount of tax charged for p

(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) 50)
(check-expect (sales-tax 1282) 64.10)
(check-expect (sales-tax 10000) 800)
(check-expect (sales-tax 12017) 961.36)

(define (sales-tax p)
  (cond
    [(and (>= p 0) (< p 1000)) TRI-1]
    [(and (>= p 1000) (< p 10000)) (* TRI-2 p)]
    [(>= p 10000) (* TRI-3 p)]))
   