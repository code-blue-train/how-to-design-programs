;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |309|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/abstraction)

; [List-of [List-of Strings]] is one of:
; (cons String '())
; (cons String [List-of Strings])
(define LLOS
  (cons
   (cons "one" '())
   (cons
    (cons "one"
          (cons "two" '()))
    (cons
     (cons "one"
           (cons "two"
                 (cons "three" '()))) '()))))

;[List-of [List-of Strings]] -> Number
; determines the number of strings per item in a list of list of strings
(define input LLOS)
(define output '(1 2 3))
(check-expect (words-on-line input) output)
(define (words-on-line llos)
  (match llos
    ['() '()]
    [(cons fst lst) (cons (length fst)
                      (words-on-line lst))]))
         
 