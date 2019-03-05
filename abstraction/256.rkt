;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |256|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 256. Explain the following abstract function:
; [X] [X -> Number] [NEList-of X] -> X 
; finds the (first) item in lx that maximizes f
; if (argmax f (list x-1 ... x-n)) == x-i, 
; then (>= (f x-i) (f x-1)), (>= (f x-i) (f x-2)), ...
;(define (argmax f lx) ...)

; i don't know how to explain argmax as i don't understand what x=i means

; Use it on concrete examples in ISL.
(check-expect (argmax second
                      '(("sam" 10)("jones" 8)("summer" 15)))
              (list "summer" 15))

; Can you articulate an analogous purpose statement for argmin?
; [X] [X -> Number] [NEList-of X] -> X 
; finds the (first) item in lx that minimizes f
; if (argmin f (list x-1 ... x-n)) == x-i, 
; then (<= (f x-i) (f x-1)), (<= (f x-i) (f x-2)), ...
; (define (argmin f lx) ...)

(check-expect (argmin second
                      '(("sam" 10)("jones" 8)("summer" 15)))
              (list "jones" 8))
