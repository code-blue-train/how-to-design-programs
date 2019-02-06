;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |253|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 253. Each of these signatures describes a class of functions:
; [Number -> Boolean]
; the signature describes the class of all functions that consume
; a number and yield a boolean
(string? 42)


; [Boolean String -> Boolean]
; the signature describes the class of all functions that consume
; a boolean and a string and yield a boolean
(define (bs? b s) #false)

(bs? #true "yahtzee!")

; [Number Number Number -> Number]
; the signature describes the class of all functions that consume
; 3 numbers and yield a number
(min 10 20 30)

; [Number -> [List-of Number]]
; the signature describes the class of all functions that consume
; a number and yield a [List-of Number]
(define (tab-sqrt n)
  (cond
    [(= n 0) (list (sqrt 0))]
    [else
     (cons
      (sqrt n)
      (tab-sqrt (sub1 n)))]))



; [[List-of Number] -> Boolean]
; the signature describes the class of all functions that consume
; a [List-of Number] and yield a boolean
(define (contains-1? l)
  (cond
    [(empty? l) #false]
    [else
      (or (= 1 (first l))
          (contains-1? (rest l)))]))


; Describe these collections with at least one example from ISL.


