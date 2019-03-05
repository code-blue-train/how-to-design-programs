;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |186|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 186
; Use sorted>? from exercise 145 to reformulate the tests for sort> with check-satisfied.

; List-of-numbers -> List-of-numbers
; rearranges alon in descending order

(check-satisfied (sort> (list 3 2 1)) sorted>?)
(check-satisfied (sort> (list 1 2 3)) sorted>?)
(check-satisfied (sort> (list 12 20 -5)) sorted>?)
(define (sort> alon)
  (cond
   [(empty? alon) '()]
   [(cons? alon) (insert (first alon) (sort> (rest alon)))]))


; Number List-of-numbers -> List-of-numbers
; inserts n into the sorted list of numbers alon
(check-expect (insert 5 '()) (list 5))
(check-expect (insert 5 (list 6)) (list 6 5))
(check-expect (insert 5 (list 4)) (list 5 4))
(check-expect (insert 5 (list 10 -2))
              (list 10 5 -2))
(check-expect (insert 5 (list 3 2 1)) (list 5 3 2 1))
(check-expect (insert 0 (list 12 3 -2)) (list 12 3 0 -2))                               
(define (insert n alon)
  (cond
    [(empty? alon) (cons n '())]
    [else
     (if
      (>= n (first alon))
      (cons n alon)
      (cons (first alon) (insert n (rest alon))))]))


(define (sorted>? ne-l)
  (cond
    [(empty? (rest ne-l)) #true]
    [else
     (and (> (first ne-l) (first (rest ne-l)))
             (sorted>? (rest ne-l)))]))


; Now consider this function definition:
; List-of-numbers -> List-of-numbers
; produces a sorted version of l
(check-expect (sort>/bad (list 13 12)) (list 13 12))
(define (sort>/bad l)
  (list 9 8 7 6 5 4 3 2 1 0))

; Can you formulate a test case that shows that sort>/bad is not a sorting function?
; Can you use check-satisfied to formulate this test case?
; no because sort>/bad always produces a sorted list 

