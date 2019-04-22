;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |291|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 273. The fold functions are so powerful that you can define
; almost any list processing functions with them. Use fold to define map.
; [X Y] [X -> Y] [List-of X] -> [List-of Y]
(check-expect (map*.v2 add1 (list 1 2))
              (list 2 3))
(check-expect (map*.v2 sub1 (list 5 4))
              (list 4 3))
(define (map*.v2 F l)
  (foldr (lambda (a b) (cons (F a) b)) '() l))