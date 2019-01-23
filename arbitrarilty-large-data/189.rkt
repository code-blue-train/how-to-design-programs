;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |189|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 189. Here is the function search:
; Number List-of-numbers -> Boolean
(define (search n alon)
  (cond
    [(empty? alon) #false]
    [else (or (= (first alon) n)
              (search n (rest alon)))]))
; It determines whether some number occurs in a list of numbers.
; The function may have to traverse the entire list to find out that
; the number of interest isn’t contained in the list.
; Develop the function search-sorted, which determines whether a
; number occurs in a sorted list of numbers.
; The function must take advantage of the fact that the list is sorted.

(check-expect (search-sort> 1 '()) #false)
(check-expect (search-sort> 5 (list 5 2 1)) #true)
(check-expect (search-sort> 5 (list 4 2 -1)) #true)
(check-expect (search-sort> 5 (list 100 20)) #false)
              
(define (search-sort> n alon)
  (cond
    [(empty? alon) #false]
    [(>= n (first (sort> alon))) #true]
    [else (search-sort> n (rest alon))]))


; List-of-numbers -> List-of-numers
; sorts a list-of-numbers descending
(check-expect (sort> '())
               '())
(check-expect (sort> (list 1))
               (list 1))
(check-expect (sort> (list 3 1))
              (list 3 1))
(check-expect (sort> (list 1 3))
              (list 3 1))
(check-expect (sort> (list -4 8 3))
              (list 8 3 -4))
  
(define (sort> alon)
  (cond
    [(empty? alon) '()]
    [else
     (insert (first alon) (sort> (rest alon)))]))


; Number List-of-numbers -> List-of-numbers
; inserts number n into the list
(check-expect (insert 1 '())
              (list 1))
(check-expect (insert 1 (list 3))
              (list 3 1))
(check-expect (insert 4 (list 9 -1))
              (list 9 4 -1))
(define (insert n alon)
  (cond
    [(empty? alon) (cons n '())]
    [else
     (if
      (>= n (first alon))
      (cons n alon)
      (cons (first alon) (insert n (rest alon))))]))


(search-sort> 5 (list 4 2))