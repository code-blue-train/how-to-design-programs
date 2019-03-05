;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |245|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 245. Develop the function=at-1.2-3-and-5.775? function.
; Given two functions from numbers to numbers, the function determines whether the two produce
; the same results for 1.2, 3, and -5.775.


; (Number -> Number) (Number -> Number) -> Boolean
; produces #true if a and b produce the same results
(check-expect (function=at-1.2-3-and-5.775? add0 id) #true)
(check-expect (function=at-1.2-3-and-5.775? add1 id) #false)

(define (function=at-1.2-3-and-5.775? a b)
  (and
   (equal? (a 1.2) (b 1.2))
   (equal? (a 3) (b 3))
   (equal? (a -5.775) (b -5.775))))


; Number -> Number
; return id of x
(define (id x)
  (* 1 x))

; Number -> Number
; add 0 to x
(define (add0 x)
  (+ 0 x))


; Can we hope to define function=?, which determines whether two functions
; from numbers to numbers are equal? If so, define the function.
; If not, explain why and consider the implication that you have encountered
; the first easily definable idea for which you cannot define a function. 

; this is too trivial to be accurate but works with a couple examples
(check-expect (function=? (sum-a-b 1 1) (product-a-b 1 1)) #false)
(check-expect (function=? (sum-a-b 1 0) (product-a-b 1 1)) #true)
(check-expect (function=? (+ (sum-a-b 3 3) 3) (product-a-b 3 3)) #true)

; (Number -> Number) (Number -> Number) -> Boolean
; compares the output of functions a and b for equality
(define (function=? a b)
  (= a b))

; Number -> Number
; returns the sum of a and b
(define (sum-a-b a b)
  (+ a b))

; Number -> Number
; returns the product of a and b
(define (product-a-b a b)
  (* a b))


; the reality is likely that having a function that processes all possible
; numbers and compares their equality isn't reasonable