;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |311|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct no-parent [])
(define-struct child [father mother name date eyes])

(define NP (make-no-parent))
; An FT is one of: 
; – NP
; – (make-child FT FT String N String)

; Oldest Generation:
(define Carl (make-child NP NP "Carl" 1926 "green"))
(define Bettina (make-child NP NP "Bettina" 1926 "green"))
 
; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child NP NP "Fred" 1966 "pink"))
 
; Youngest Generation: 
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))

; FT CurrentYear -> Number
; consumes a family tree and the current year and produces the average age
; of all the child structures in the family tree
; wish list
;1. count children
;2. calculate children's age from current year
;3. sum all chilren's age from current year
;4. calculate average age (/ (+ 2 3) 1)
(check-expect (average-age Adam 2019) 85)
(check-expect (average-age Carl 2019) 93)
(define (average-age ft cy)
  (local (; Number -> Number
          ; Add all the ages of the children from the current year
          (define (cum-ages ft)
            (cond
              [(no-parent? ft) 0]
              [else
               (+ (- cy (child-date ft))
               (cum-ages (child-mother ft))
               (cum-ages (child-father ft))
                )]))
          (define (count-children ft)
            (cond
              [(no-parent? ft) 0]
              [else
               (+ 1
                  (count-children (child-mother ft))
                  (count-children (child-father ft)))])))
    (/ (cum-ages ft) (count-children ft))))


      