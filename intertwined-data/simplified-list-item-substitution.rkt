;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname simplified-list-item-substitution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/abstraction)

; S-expr Symbol Atom -> S-expr
; replaces all occurrences of old in sexp with new
 
(check-expect (substitute '(((world) bye) bye) 'bye '42)
              '(((world) 42) 42))
(check-expect (substitute '((bite) test) 'test 'me)
               '((bite) me))
(check-expect (substitute 'true 'true 'false)
              'false)
(check-expect (substitute (list "a" "b" "c") "c" "fu")
              (list "a" "b" "fu"))
(check-expect (substitute (list "a" "b" 3) 3 "fu")
              (list "a" "b" "fu"))
(check-expect (substitute 3 3 200)
              200)
 
(define (substitute sexp old new)
  (cond
    [(atom? sexp) (if (equal? sexp old) new sexp)]
    [else
     (map (lambda (s) (substitute s old new)) sexp)]))


(define (atom? s)
  (cond
    [(number? s) #true]
    [(string? s) #true]
    [(symbol? s) #true]
    [else #false]))
    