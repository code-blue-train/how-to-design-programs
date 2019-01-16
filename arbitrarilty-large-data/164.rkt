;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |164|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 164. Design the function convert-euro,
; which converts a list of US$ amounts into a list of € amounts.
; Look up the current exchange rate on the web.
; 1 USD = 0.88 EU

; Generalize convert-euro to the function convert-euro*,
; which consumes an exchange rate and a list of US$ amounts
; and converts the latter into a list of € amounts.

; List-of-numbers is one of:
; '()
; (cons Number List-of-numbers)
; List-of-numbers -> List-of-numbers
; intepretation consumes a list of US$ amounts and produces a list of € amounts.
(check-expect (convert-euro (cons 1 (cons 20 '()))) (cons 0.88 (cons 17.6 '())))
(check-expect (convert-euro '()) '())
(define (convert-euro lon-usd)
  (cond
    [(empty? lon-usd) '()]
    [else
     (cons (* (first lon-usd) 0.88)
          (convert-euro (rest lon-usd)))]))

; Exchange Rate List-of-numbers -> List-of-numbers
; intepreation consumes and exchange rate and a list of US$ amounts
; and produces a list of € amounts.
(check-expect (convert-euro* .88 '()) '())
(check-expect (convert-euro* .88 (cons 1 (cons 20 '()))) (cons 0.88 (cons 17.6 '())))
(define (convert-euro* er lon-usd)
  (cond
    [(empty? lon-usd) '()]
    [else
     (cons (* (first lon-usd) er)
           (convert-euro* er (rest lon-usd)))]))






