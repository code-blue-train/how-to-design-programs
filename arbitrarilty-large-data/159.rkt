;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |159|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; N Image -> Image
; intepretation consumes a natural number n and an image img.
; It produces a row—a horizontal arrangement—of n copies of img.
(define (row n img)
 (cond
   [(zero? n) empty-image]
   [(positive? n) (beside img (row (sub1 n) img))]))

; N Image -> Image
; intepretation consumes a natural number n and an image img.
; It produces a column—a vertical arrangement—of n copies of img.
                   
(define (col n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (above img (col (sub1 n) img))]))

 
 ; constants

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

(define LH-WIDTH (image-width LECTURE-HALL))
(define LH-HEIGHT (image-height LECTURE-HALL))

(define LH-AREA (* (image-width LECTURE-HALL) (image-height LECTURE-HALL)))

;Exercise 159. Turn the solution of exercise 153 into a world program.
;Its main function, dubbed riot, consumes how many balloons the students want to throw
; its visualization shows one balloon dropping after another at a rate of one per second.
;The function produces the list of Posns where the balloons hit.

;Hints (1) Here is one possible data representation:

(define-struct pair [balloon# lob])
; A Pair is a structure (make-pair N List-of-posns)
; A List-of-posns is one of: 
; – '()
; – (cons Posn List-of-posns)
; interpretation (make-pair n lob) means n balloons 
; must yet be thrown and added to lob

; A RiotWorld is List-of-pairs
; interpretation each pair on the list represents the posn of a balloon

(define TEST-PAIR (make-pair 2 (cons (make-posn 1 1) (cons (make-posn 2 2) '()))))
(define TEST-LOB (cons (make-posn 1 1) (cons (make-posn 2 2) '())))

; Number -> Pair
; intepretation consumes a number

; Pair Number Number -> Pair
; interpretation consumes a new pair and 2 numbers and makes a new pair
; with the numbers as a posn
(check-expect (throw-balloon (make-pair 1 (cons (make-posn 10 10) '())) 20 20)
              (make-pair 0 (cons (make-posn 20 20) (cons (make-posn 10 10) '()))))
(check-expect (throw-balloon (make-pair 0 '()) 10 10) (make-pair 0 '()))

(define (throw-balloon pr x y)
  (if (zero? (pair-balloon# pr))
      pr
      (make-pair (sub1 (pair-balloon# pr))
                 (cons (make-posn x y) (pair-lob pr)))))        
; Pair -> Image
; interpretation consumes pair and renders an image with the posn values placed
; on the LECTURE-HALL
(check-expect (render (make-pair 3 (cons (make-posn 50 40) (cons (make-posn 24 8) '()))))
              (place-image
               BALLOON
               50 40
               (place-image
                BALLOON
                24 8
                LECTURE-HALL)))
(check-expect (render (make-pair 3 (cons (make-posn 50 40) '())))
              (place-image 
               BALLOON
               50 40
               LECTURE-HALL))
                     
(define (render pr)
  (cond
    [(empty? (pair-lob pr)) LECTURE-HALL]
    [else
     (place-image
      BALLOON
      (posn-x (first (pair-lob pr)))
      (posn-y (first (pair-lob pr)))
      (render (make-pair (pair-balloon# pr) (rest (pair-lob pr)))))]))
                   
; Pair -> Pair
; intepretation consumes pair and produces the pair with another balloon with random x/y coordinates
(define (make-balloon pr)
  (throw-balloon pr (random LH-WIDTH) (random LH-HEIGHT)))


; Riot main program
; World state is pair structure
; (riot (make-pair 20 '()))

(define (riot pr)
  (big-bang pr
    (on-tick make-balloon 1.0)
    [to-draw render]))
