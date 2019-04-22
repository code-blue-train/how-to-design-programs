;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |295|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 295. Develop n-inside-playground?, a specification of the random-posns
; function below. 

; distances in terms of pixels 
(define WIDTH 300)
(define HEIGHT 300)
 
; N -> [List-of Posn]
; generates n random Posns in [0,WIDTH) by [0,HEIGHT)
(check-satisfied (random-posns 3)
                 (n-inside-playground? 3))
(define (random-posns n)
  (build-list
    n
    (lambda (i)
      (make-posn (random WIDTH) (random HEIGHT)))))

; The function generates a predicate that ensures that:
; n is the length of list l0
; and that all Posns in list l0 are within a WIDTH by HEIGHT rectangle
(define (n-inside-playground? n)
  (lambda (l0)
    (and
     (= (length l0) n)
     (andmap
      (lambda (p)
        (and
         (<= 0 (posn-x p) WIDTH)
         (<= 0 (posn-y p) HEIGHT))) l0))))

; Define random-posns/bad that satisfies n-inside-playground?
; and does not live up to the expectations implied by the above purpose statement. 
(check-satisfied (random-posns/bad 3) (n-inside-playground? 3))
(define (random-posns/bad n)
    (build-list
    n
    (lambda (i)
      (make-posn WIDTH HEIGHT))))



             


