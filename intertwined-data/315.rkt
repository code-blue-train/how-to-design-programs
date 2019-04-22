;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |315|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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


; A FF (family forest) is one of: 
; – '()
; – (cons FT FF)
; interpretation a family forest represents several
; families (say, a town) and their ancestor trees

(define ff1 (list Carl Bettina))
(define ff2 (list Fred Eva))
(define ff3 (list Fred Eva Carl))

; FF Number -> Number
; consumes a family forest and a year (number) and produces the average age of all
; the child instances in the forest
(check-expect (average-age ff3 2019) 77.2)
(check-expect (average-age ff1 2000) 74)
(define (average-age ff n)
  (local (; FF -> Number
          ; returns the number of children in a family forest
          (define (count-children-ff ff)
            (cond
              [(empty? ff) 0]
              [else
               (+ (count-children-ft (first ff))
                  (count-children-ff (rest ff)))]))
          ; FT -> Number
          ; returns the number of chlidren in a family tree
          (define (count-children-ft ft)
            (cond
              [(no-parent? ft) 0]
              [else
               (+ 1
                  (count-children-ft (child-mother ft))
                  (count-children-ft (child-father ft)))]))
          ; FT -> Number
          ; returns the cumulative ages of all chilren in a family tree
          (define (cum-age-ft ft)
            (cond
              [(no-parent? ft) 0]
              [else
               (+
                (- n (child-date ft))
                (cum-age-ft (child-mother ft))
                (cum-age-ft (child-father ft)))]))
          ; FF -> Number
          ; returns the cumulative ages of all children in a family forest
          (define (cum-age-ff ff)
            (cond
              [(empty? ff) 0]
              [else
               (+
                (cum-age-ft (first ff))
                (cum-age-ff (rest ff)))])))
    (/ (cum-age-ff ff) (count-children-ff ff))))