;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |153|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Exercise 153. 
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


(define COLS 18)
(define ROWS 8)

(define SQR-DIA 10)

(define BACKGROUND (empty-scene (* ROWS SQR-DIA) (* COLS SQR-DIA)))

(define BOX (square SQR-DIA "outline" "black"))

(define BOXES (row ROWS (col COLS BOX)))

(define BALLOON (circle 4 "solid" "red"))

(define LECTURE-HALL
  (place-image
   BOXES
   (/ (image-width BACKGROUND) 2)
   (/ (image-height BACKGROUND) 2)
   BACKGROUND))


; List-of-posn -> Image
; intepretation consumes a list of Posn whose coordinates fit
; into the dimensions of the lecture hall.
; it produces an image of the lecture hall with red dots added as specified by the Posns.




