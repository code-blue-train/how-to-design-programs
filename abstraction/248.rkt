;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |248|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Function Lon Number -> Lon
; consumes a function R, list-of-numbers l and a number t
; and produces a list-of-numbers that represents each item that
; satisfies the condition of R when compared to t
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


; Exercise 248. Evaluate

(squared>? 3 10)

(> (* 3 3) 10)

(> 9 10)

#false