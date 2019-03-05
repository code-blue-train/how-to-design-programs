;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |236|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 236. Create test suites for the following two functions:
; Lon -> Lon
; adds 1 to each item on l
(check-expect (add1*
               '()) '())
(check-expect (add1*
               (list 0))
              (list 1))
(check-expect (add1*
               '(0 1 2))
              '(1 2 3))
(define (add1* l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (add1 (first l))
       (add1* (rest l)))]))

; Lon -> Lon
; adds 5 to each item on l
(check-expect (plus5
               '()) '())
(check-expect (plus5
               (list 0))
              (list 5))
(check-expect (plus5
               '(10 20 30))
              '(15 25 35))
(define (plus5 l)
  (cond
    [(empty? l) '()]
    [else
     (cons
       (+ (first l) 5)
       (plus5 (rest l)))]))



; Lon -> Lon
; adds n to each item on l
(check-expect (add-n 0 '()) '())
(check-expect (add-n 1
                     (list 0 1 2))
              (list 1 2 3))
(check-expect (add-n 10
                     '(50 80))
              '(60 90))
               
(define (add-n n l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (+ (first l) n)
      (add-n n (rest l)))]))

; Lon -> Lon
; adds 1 to each item in the list
(check-expect (add1*.v2
               '()) '())
(check-expect (add1*.v2
               (list 0))
              (list 1))
(check-expect (add1*.v2
               '(0 1 2))
              '(1 2 3))
(define (add1*.v2 l)
  (add-n 1 l))

; Lon -> Lon
; adds 5 to each item in the list
(check-expect (plus5.v2
               '()) '())
(check-expect (plus5.v2
               (list 0))
              (list 5))
(check-expect (plus5.v2
               '(10 20 30))
              '(15 25 35))
(define (plus5.v2 l)
  (add-n 5 l))


; Lon -> Lon
; subtracts 2 from each number on the list l
(check-expect (sub2 '()) '())
(check-expect (sub2
               (list 5 4))
              (list 3 2))
(check-expect (sub2
               '(10 20))
              '(8 18))
(define (sub2 l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (- (first l) 2)
      (sub2 (rest l)))]))