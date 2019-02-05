;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |246|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Function Lon Number -> Lon
; consumes a function R, list-of-numbers l and a number t
; and produces a list-of-numbers that represents each item that
; satisfies the condition of R when compared to t
(check-expect (extract >
                       (list 0 1) -1)
              (list 0 1))
(define (extract R l t)
  (cond
    [(empty? l) '()]
    [else
     (cond
       [(R (first l) t)
       (cons
        (first l)
        (extract R (rest l) t))]
       [else
        (extract R (rest l) t)])]))

; Number Number -> Boolean
; is the area of a square with side x larger than c
(define (squared>? x c)
  (> (* x x) c))


;Exercise 246. Check step 1 of the last calculation
(extract < (cons 6 (cons 4 '())) 5)

  (cond
    [(empty? (cons 6 (cons 4 '()))) '()]
    [else
     (cond
       [(< (first (cons 6 (cons 4 '())) 5)
       (cons
        (first (cons 6 (cons 4 '()))
        (extract < (rest (cons 6 (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 6 (cons 4 '())) 5)])]))

  (cond
    (#false) '())
    [else
     (cond
       [(< (first (cons 6 (cons 4 '())) 5)
       (cons
        (first (cons 6 (cons 4 '()))
        (extract < (rest (cons 6 (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 6 (cons 4 '())) 5)])]))

     (cond
       [(< (first (cons 6 (cons 4 '())) 5)
       (cons
        (first (cons 6 (cons 4 '()))
        (extract < (rest (cons 6 (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 6 (cons 4 '())) 5)])]))

     (cond
       [(< 6 5)
       (cons
        (first (cons 6 (cons 4 '()))
        (extract < (rest (cons 6 (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 6 (cons 4 '())) 5)])]))

     (cond
       [#false
       (cons
        (first (cons 6 (cons 4 '()))
        (extract < (rest (cons 6 (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 6 (cons 4 '())) 5)])]))

     (cond (else (extract < (rest (list 6 4)) 5)))

     (extract < (rest (list 6 4)) 5)

  (cond
    [(empty? (cons 4 '()) '()]
    [else
     (cond
       [(< (first (cons 4 '()) 5)
       (cons
        (first (cons 4 '())
        (extract < (rest (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 4 '())) 5)])]))

  (cond
    [#false '()]
    [else
     (cond
       [(< (first (cons 4 '()) 5)
       (cons
        (first (cons 4 '())
        (extract < (rest (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 4 '())) 5)])]))

     (cond
       [(< (first (cons 4 '()) 5)
       (cons
        (first (cons 4 '())
        (extract < (rest (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 4 '())) 5)])]))


     (cond
       [(< 4 5)
       (cons
        (first (cons 4 '())
        (extract < (rest (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 4 '())) 5)])]))

     (cond
       [#true
       (cons
        (first (cons 4 '())
        (extract < (rest (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 4 '())) 5)])]))

     (cond
       [#true
       (cons
        (first (cons 4 '())
        (extract < (rest (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 4 '())) 5)])]))

     (cons (first (list 4)) (extract < (rest (list 4)) 5))

     (cons 4 (extract < (rest (list 4)) 5))



  (cond
    [(empty? '()) '()]
    [else
       (cons
        4
        (extract < (rest (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 4 '())) 5)])]))

  (cond
    [#true '()]
    [else
       (cons
        4
        (extract < (rest (cons 4 '()) ) 5))]
       [else
        (extract < (rest (cons 4 '())) 5)])]))

  (cons 4 '())