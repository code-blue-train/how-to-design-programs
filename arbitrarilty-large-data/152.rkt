;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |152|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Exercise 152. Design two functions: col and row.

; The function col consumes a natural number n and an image img.
; It produces a column—a vertical arrangement—of n copies of img.

; N Image -> Image
; intepretation consumes a natural number n and an image img.
; It produces a column—a vertical arrangement—of n copies of img.
(check-expect (col 0 (square 5 "outline" "red")) empty-image)
(check-expect (col 1 (square 5 "outline" "red")) (square 5 "outline" "red"))
(check-expect (col 2 (square 5 "outline" "red"))
              (above (square 5 "outline" "red")
                     (square 5 "outline" "red")))
                   
; header
; (define (col n img) img)

;template
;(define (col n img)
;  (cond
;    [(zero? n) ...]
;    [(positive? n) (... (col (sub1 n) img) ...)]))

(define (col n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (above img (col (sub1 n) img))]))

;The function row consumes a natural number n and an image img.
; It produces a row—a horizontal arrangement—of n copies of img.

; N Image -> Image
; intepretation consumes a natural number n and an image img.
; It produces a row—a horizontal arrangement—of n copies of img.
(check-expect (row 0 (circle 10 "outline" "black")) empty-image)
(check-expect (row 3 (circle 10 "outline" "black"))
              (beside (circle 10 "outline" "black")
                      (circle 10 "outline" "black")
                      (circle 10 "outline" "black")))

; header
; (define (row n img) img)

;template
;(define (row n img)
;  (cond
;    [(zero? n) ...]
;    [(positive? n) (... (row (sub1 n) img) ...)]))

 (define (row n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (beside img (row (sub1 n) img))]))
