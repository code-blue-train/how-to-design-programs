;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |313|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct no-parent [])
(define-struct child [father mother name date eyes])

(define NP (make-no-parent))
; An FT is one of: 
; – NP
; – (make-child FT FT String N String)

; Oldest Generation:
(define Carl (make-child NP NP "Carl" 1926 "blue"))
(define Bettina (make-child NP NP "Bettina" 1926 "green"))
 
; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child NP NP "Fred" 1966 "pink"))
 
; Youngest Generation: 
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))

; FT -> Boolean
; responds with #true only when a proper ancestor, not the given child itself,
; has blue eyes.
(check-expect (blue-eyed-ancestor? Eva) #true)
(check-expect (blue-eyed-ancestor? Fred) #false)
(define (blue-eyed-ancestor? an-ftree)
  (cond
    [(no-parent? an-ftree) #false]
    [else
     (or
       (blue-eyed-ancestor? (child-father an-ftree))
       (if (no-parent? (child-father an-ftree))
           #f
           (string=? "blue" (child-eyes (child-father an-ftree))))     
       (blue-eyed-ancestor? (child-mother an-ftree))
       (if (no-parent? (child-mother an-ftree))
           #f
           (string=? "blue" (child-eyes (child-mother an-ftree)))))]))

; first, the initial function doesn't check the ancestors eye colors for "blue" and
; second when it reaches the no-parent base case it returns #false every time