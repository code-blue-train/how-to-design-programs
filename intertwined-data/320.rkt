;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |320|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Reformulate the data definition for S-expr so
; that the first clause is expanded into the three clauses of
; Atom and the second clause uses the List-of abstraction.
; Redesign the count function for this data definition.

;Now integrate the definition of SL into the one for S-expr.
; Simplify count again. Consider using lambda.

; An S-expr is one of: 
; - Number
; - String
; - Symbol
; – [List-of S-expr]
 
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
              
; S-expr Symbol -> N 
; counts all occurrences of sy in sexp
(check-expect (count 'world 'hello) 0)
(check-expect (count '(world hello) 'hello) 1)
(check-expect (count '(((world) hello) hello) 'hello) 2)
(define (count sexp sym)
  (local (; S-expr -> Number
          ; if S-exp is an atom return 1 otherwise 0
          (define (count-atom sexp)
            (if (equal? sexp sym) 1 0))
          ; S-expr -> Number
          ; consumes an S-exp sexp and uses foldr to process the sexp list
          (define (count-list sexp)
            (foldr (lambda (sexp result)
                     (+ (count sexp sym) result))
                   0 sexp)))
    (cond [(number? sexp) 0]
          [(string? sexp) 0]
          [(symbol? sexp) (count-atom sexp)]
          [(list? sexp) (count-list sexp)])))



     