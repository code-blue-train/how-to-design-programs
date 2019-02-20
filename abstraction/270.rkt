;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |270|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 270.

; Number -> [List-of Numbers]
; creates the list (list 0 ... (- n 1)) for any natural number n;
(check-expect (nn-list-0 5)
              (list 0 1 2 3 4))
(check-expect (nn-list-0 1)
              (list 0))
(define (nn-list-0 n)
  (local (; Number -> Number
          ; consumes a number n and returns n
          (define (nn n)
            n))
    (build-list n nn)))

; Number -> [List-of Numbers]
; creates the list (list 1 ... n) for any natural number n;
(check-expect (nn-list-1 5)
              (list 1 2 3 4 5))
(check-expect (nn-list-1 1)
              (list 1))
(define (nn-list-1 n)
  (local (; Number -> Number
          ; consumes a number n and returns (+ n 1)
          (define (add1+ n)
            (+ n 1)))
    (build-list n add1+)))

; Number -> [List-of Numbers]
; creates the list (list 1 1/2 ... 1/n) for any natural number n;
(check-expect (nn-ratio 5)
              (list 1 1/2 1/3 1/4 1/5))
(check-expect (nn-ratio 1)
              (list 1))
(define (nn-ratio n)
  (local (; Number -> Number
          ; consumes a number, adds 1 to it, and divides 1 by that number
          (define (div-n n)
            (/ 1 (add1 n))))
    (build-list n div-n)))

; Number -> Number
; creates the list of the first n even numbers
(check-expect (nn-even 5)
              (list 0 2 4 6 8))
(check-expect (nn-even 1)
              (list 0))
(define (nn-even n)
  (local (; Number -> Number
          ; consumes a number n and produces (+ n n)
          (define (even n)
            (+ n n)))
    (build-list n even)))

; Number -> [List-of-list-of Numbers]
; creates a diagonal square of 0s and 1s; see exercise 262.
(check-expect (identityM 1)
              (list (list 1)))
(check-expect (identityM 3)
              (list
               (list 1 0 0)
               (list 0 1 0)
               (list 0 0 1)))
(define (identityM n)
  (local (; Number -> List-of Numbers
          ; produces a list of 0s with 1 at position k
          (define (build-row k)
            (append (make-list k 0)
                    '(1)
                    (make-list (- n k 1) 0))))
    (build-list n build-row)))
; [X] [X -> Y] -> [List-of Y]
; Finally, define tabulate from exercise 250 using build-list.
; consumes a number n and a function F and calculates F between
; n and 0 inclusive
(check-expect (tabulate 4 add1)
              (list 1 2 3 4))
(check-expect (tabulate 2 sub1)
              (list -1 0))
(define (tabulate n F)
  (build-list n F))