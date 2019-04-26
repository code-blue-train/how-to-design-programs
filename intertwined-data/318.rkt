;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |318|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
              
; S-expression -> Number
; The function consumes an S-expression and determines its depth.
; An Atom has a depth of 1. The depth of a list of S-expressions is the
; maximum depth of its items plus 1.
(check-expect (depth '()) 0)
(check-expect (depth '(hello)) 2)
(check-expect (depth '((hello world))) 3)
(define (depth sexp)
  (local ( ;Sexp -> Number
          (define (depth sexp)
            (cond
              [(atom? sexp) 1]
              [else
               (depth-sl sexp)]))
          ; S-list -> Number
          (define (depth-sl sl)
            (cond
              [(empty? sl) 0]
              [else
               (max (+ 1 (depth (first sl)))
                    (depth-sl (rest sl)))])))
    (depth sexp)))

