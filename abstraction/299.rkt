;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |299|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 299. Design a data representation for finite and infinite sets
; so that you can represent the sets of all odd numbers,
; all even numbers, all numbers divisible by 10, and so on.

; Design the functions add-element, which adds an element to a set;
; union, which combines the elements of two sets;
; and intersect, which collects all elements common to two sets.

; Hint Mathematicians deal with sets as functions that consume a
; potential element ed and produce #true only if ed belongs to the set.

(check-expect [(mk-set 5 1) 0]  #f)
(define (mk-set d r)
  (lambda (ed)
    (= (modulo ed d) r)))

; [Number -> Boolean]
; intepretation function produces #true if ed belongs to a finite set
(check-expect ((mk-fs '(3 5 7)) 3) #true)
(check-expect ((mk-fs '(3 5 7)) 10) #false)
(define (mk-fs set)
  (lambda (ed)
    (member? ed set)))


; Constant sets
(define even-numbers (mk-set 2 0))
(define odd-numbers (mk-set 2 1))
(define tens (mk-set 10 0))
(define more-than-2 (mk-fs '(3 4 5)))

; N Set -> Set
; produces a new set with element N added
(check-expect ((add-element 5 tens) 0) #true)
(check-expect ((add-element 5 tens) 3) #false)
(check-expect [(add-element 5 (mk-set 25 5)) 5] #t)
(define (add-element n s)
  (lambda (ed)
    (or (= ed n)
        (s ed))))

; Set Set -> Set
; combines the elements of two sets;
(check-expect [(union (mk-set 2 0) (mk-set 2 0)) 0] #t)
(check-expect [(union odd-numbers even-numbers) 3] #t)
(check-expect [(union tens odd-numbers) 4] #f)
(define (union s1 s2)
  (lambda (ed)
    (or (s1 ed)
         (s2 ed))))

; Set Set -> Set
; collects all elements common to two sets
;(check-expect [(intersect
(check-expect [(intersect tens even-numbers) 10] #t)
(check-expect [(intersect tens odd-numbers) 1] #f)
(define (intersect s1 s2)
  (lambda (ed)
    (and
     (s1 ed)
     (s2 ed))))