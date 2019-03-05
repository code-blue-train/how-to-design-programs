;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |237|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Function Lon Number -> Lon
(check-expect (extract >
                       (list 0 1) -1)
              (list 0 1))
(define (extract R l t)
  (cond
    [(empty? l) '()]
    [else
     (cond
       [(R (first l) t)
       (cons
        (first l)
        (extract R (rest l) t))]
       [else
        (extract R (rest l) t)])]))

; Number Number -> Boolean
; is the area of a square with side x larger than c
(define (squared>? x c)
  (> (* x x) c))


; Exercise 237. Evaluate (squared>? 3 10) and (squared>? 4 10) in DrRacket.
; How about (squared>? 5 10)?

> (squared>? 5 10)
#true
> (squared>? 3 10)
#false
> (squared>? 4 10)
#true
> 