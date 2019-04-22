;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |144|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;exercise 144

; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures 

; NEList-of-temperatures -> Number
; computes the average temperature
(check-expect (average (cons 1 (cons 2 (cons 3 '())))) 2)
(define (average ne-l)
  (/ (sum ne-l) (how-many ne-l)))
 
; NEList-of-temperatures -> Number 
; adds up the temperatures on the given list 
(define (sum ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (+ (first ne-l) (sum (rest ne-l)))]))
             
 
; NEList-of-temperatures -> Number 
; counts the temperatures on the given list
(check-expect (how-many (cons 1 '())) 1)
(check-expect (how-many (cons 1 (cons 2 (cons 3 '())))) 3)
(define (how-many ne-l)
  (cond
    [(empty? ne-l) 0]
    [(cons? ne-l) (length ne-l)]))

; yes how-many and sum will work for NEList-of-temperatures
; because they are designed to process lists whether they are empty or not
     