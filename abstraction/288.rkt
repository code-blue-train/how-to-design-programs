;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |288|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 270.

; Number -> [List-of Numbers]
; creates the list (list 0 ... (- n 1)) for any natural number n;
(check-expect (nn-list-0 5)
              (list 0 1 2 3 4))
(check-expect (nn-list-0 1)
              (list 0))

(define (nn-list-0 n)
  (build-list n (lambda (n) n)))

; Number -> [List-of Numbers]
; creates the list (list 1 ... n) for any natural number n;
(check-expect (nn-list-1 5)
              (list 1 2 3 4 5))
(check-expect (nn-list-1 1)
              (list 1))
(define (nn-list-1 n)
  (build-list n (lambda (n) (+ n 1))))

; Number -> [List-of Numbers]
; creates the list (list 1 1/2 ... 1/n) for any natural number n;
(check-expect (nn-ratio.v2 5)
              (list 1 1/2 1/3 1/4 1/5))
(check-expect (nn-ratio.v2 1)
              (list 1))
(define (nn-ratio.v2 n)
  (build-list n (lambda (n) (/ 1 (add1 n)))))

; Number -> Number
; creates the list of the first n even numbers
(check-expect (nn-even.v2 5)
              (list 0 2 4 6 8))
(check-expect (nn-even.v2 1)
              (list 0))
(define (nn-even.v2 n)
  (build-list n (lambda (n) (+ n n))))

; Number -> [List-of-list-of Numbers]
; creates a diagonal square of 0s and 1s; see exercise 262.
(check-expect (identityM.v2 1)
              (list (list 1)))
(check-expect (identityM.v2 3)
              (list
               (list 1 0 0)
               (list 0 1 0)
               (list 0 0 1)))
(define (identityM.v2 n)
  (build-list n (lambda (k)
                  (append (make-list k 0)
                          '(1)
                          (make-list (- n k 1) 0)))))
; [X] [X -> Y] -> [List-of Y]
; Finally, define tabulate from exercise 250 using build-list.
; consumes a number n and a function F and calculates F between
; n and 0 inclusive
(check-expect (tabulate.v2 4 add1)
              (list 1 2 3 4))
(check-expect (tabulate.v2 2 sub1)
              (list -1 0))
(define (tabulate.v2 n F)
  (build-list n F))