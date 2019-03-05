;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |139|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 139

(check-expect (sum '()) 0)
(check-expect (sum (cons 1 '())) 1)
(check-expect (sum (cons 2 (cons 5 '()))) 7)
;header
(define (header-sum loa)
  (cond
    [(empty? loa) ...]
    [(cons? loa) ...]))

;template
(define (template-sum loa)
  (cond
    [(empty? loa) ...]
    [(cons? loa)
     (... (first loa) ...
          (template-sum (rest loa)) ...)]))

; List-of-numbers -> Boolean
; intepretation if loa are all positive numbers returns #true else returns #false
(check-expect (pos? '()) #true)
(check-expect (pos? (cons 5 '())) #true)
(check-expect (pos? (cons -1 '())) #false)
(check-expect (pos? (cons 5 (cons -1 '()))) #false)
(check-expect (pos? (cons 5 (cons 1 '()))) #true)
(define (pos? lon)
  (cond
    [(empty? lon) #true]
    [else
     (and (positive? (first lon))
          (pos? (rest lon)))]))

(define (sum loa)
  (cond
    [(empty? loa) 0]
    [(cons? loa)
     (+ (first loa) (sum (rest loa)))]))

; List-of-Numbers -> Number
; intepretation consumes lon and if input belongs to loa it produces a sum
; otherwise produces an error
(check-error (checked-sum (cons -1 '())) "input doesn't belong to list-of-amounts")
(check-expect (checked-sum (cons 1 '())) 1)
(check-expect (checked-sum (cons 2 (cons 3 '()))) 5)
(check-error (checked-sum (cons 2 (cons -2 '()))) "input doesn't belong to list-of-amounts")
(define (checked-sum lon)
  (cond
    [(pos? lon) (sum lon)]
    [else (error "input doesn't belong to list-of-amounts")]))

;what does sum compute for an element of list-of-number?
; produces the sum of the list