;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |316|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; An S-expr is one of: 
; – Atom
; – SL
 
; An SL is one of: 
; – '()
; – (cons S-expr SL)
          
; An Atom is one of:
; - Number
; - String
; - Symbol
(check-expect (atom? 10) #t)
(check-expect (atom? "s") #t)
(check-expect (atom? 's) #t)
(check-expect (atom? (lambda (x) (+ x 1))) #f)

(define (atom? a)
  (or
   (string? a)
   (number? a)
   (symbol? a)))
              