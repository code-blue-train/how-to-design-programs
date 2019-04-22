;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |160|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 160. Design the functions set+.L and set+.R,
; which create a set by adding a number x to some given
; set s for the left-hand and right-hand data definition, respectively.

; Son
(define es '())

(define set123-version1
  (cons 1 (cons 2 (cons 3 '()))))

(define set123-version2
  (cons 1 (cons 3 (cons 2 '()))))


; Number Son.L -> Son.L
; interpretation consumes a number and a set
; and produces a set with the number added
(check-expect (set+.L 4 set123-version1)
              (cons 4 (cons 1 (cons 2 (cons 3 '())))))
(check-expect (set+.L 1 set123-version2)
              (cons 1 (cons 1 (cons 3 (cons 2 '())))))
(define (set+.L x s)
  (cons x s))

; Number Son.R -> Son.R
; interpretation consumes a number and a set
; and produces a set with the number added if the number isn't already in the set
(check-expect (set+.R 1 set123-version1)
              (cons 1 (cons 2 (cons 3 '()))))
(check-expect (set+.R 4 set123-version1)
              (cons 4 (cons 1 (cons 2 (cons 3 '())))))
(define (set+.R x s)
  (if
   (member? x s)
   s
   (cons x s)))
