;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |162|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 163. Design convertFC. The function converts a list of measurements
; in Fahrenheit to a list of Celsius measurements. 

; List-of-numbers is one of:
; '()
; (cons Number List-of-numbers)

; List-of-numbers -> List-of-numbers
; interpretation consumes a list of measurements in Fahrenheit
; and produces a list of measurements in Celcius
; (* (- f 32) 5/9)
(check-expect (convertFC '()) '())
(check-expect (convertFC (cons 10 '())) (cons -12 '()))
(check-expect (convertFC (cons 32 (cons 10 '()))) (cons 0 (cons -12 '())))
(define (convertFC f-lon)
  (cond
    [(empty? f-lon) '()]
    [else
     (cons (round (* (- (first f-lon) 32) 5/9))
           (convertFC (rest f-lon)))]))
  



