;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |145|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 145. Design the sorted>? predicate,
;which consumes a NEList-of-temperatures and produces
;#true if the temperatures are sorted in descending order.
;That is, if the second is smaller than the first,
;the third smaller than the second, and so on. Otherwise it produces #false.

; NEList-of-temperatures -> Boolean
; interpretation consumes ne-l and produces #true if the temperatures
; are sorted in descending order; returns #false otherwise
(check-expect (sorted>? (cons 1 (cons 2 '()))) #false)
(check-expect (sorted>? (cons 3 (cons 2 '()))) #true)
(check-expect (sorted>? (cons 0 (cons 3 (cons 2 '())))) #false)
(define (header-sorted>? ne-l)
  (cond
    [(empty? (rest ne-l)) ...]
    [else ...]))
; template
(define (template-sorted>? ne-l)
  (cond
    [(empty? (rest ne-l)) (... (first ne-l) ...)]
    [else ( ... (first ne-l) ... (template-sorted>? (rest ne-l)) ...)]))

(define (sorted>? ne-l)
  (cond
    [(empty? (rest ne-l)) #true]
    [else
     (and (> (first ne-l) (first (rest ne-l)))
             (sorted>? (rest ne-l)))]))

