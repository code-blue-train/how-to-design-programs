;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |310|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct no-parent [])
(define-struct child [father mother name date eyes])
; An FT (short for family tree) is one of: 
; – (make-no-parent)
; – (make-child FT FT String N String)

(define NP (make-no-parent))
; An FT is one of: 
; – NP
; – (make-child FT FT String N String)

(define Carl (make-child NP NP "Carl" 1926 "green"))
(define Bettina (make-child NP NP "Betina" 1926 "green"))

(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child Carl Bettina "Fred" 1966 "pink"))

(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))


; FT -> Number
; consumes a family tree and counts the child structures in the tree
(check-expect (count-persons Carl) 1)
(check-expect (count-persons Eva) 3)
(define (count-persons an-ftree)
  (cond
    [(no-parent? an-ftree) ...]
    [else (... (count-persons
                (child-father an-ftree)) ...
           ... (count-persons
                (child-mother an-ftree)) ...
           ... (child-name an-ftree) ...
           ... (child-date an-ftree) ...
           ... (child-eyes an-ftree) ...)]))

