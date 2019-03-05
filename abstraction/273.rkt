;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |273|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 273. The fold functions are so powerful that you can define
; almost any list processing functions with them. Use fold to define map.
; [X Y] [X -> Y] [List-of X] -> [List-of Y]
(check-expect (map* add1 (list 1 2))
              (list 2 3))
(check-expect (map* sub1 (list 5 4))
              (list 4 3))
(define (map* F l)
  (local (; X X -> Y
          ; applies F to both args
          (define (combine a b)
            (cons (F a) b)))
    (foldr combine '() l)))