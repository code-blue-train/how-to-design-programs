;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |238|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Nelon -> Number
; determines the smallest 
; number on l
(define (inf l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (< (first l)
            (inf (rest l)))
         (first l)
         (inf (rest l)))]))

; Nelon -> Number
; determines the largest 
; number on l
(define (sup l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (> (first l)
            (sup (rest l)))
         (first l)
         (sup (rest l)))]))


; Nelon R -> Number
(check-expect (inf-sup > (list 1)) 1)
(check-expect (inf-sup < (list 1)) 1)
(check-expect (inf-sup > (list 0 2 10)) 10)
(check-expect (inf-sup < (list 0 2 10)) 0)
(define (inf-sup R l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (R (first l)
             (inf-sup R (rest l)))
          (first l)
          (inf-sup R (rest l)))]))

; Number Lon -> Lon
; subtracts n from each item in lon
(check-expect (sub* 1 '()) '())
(check-expect (sub* 1 '(0 4)) '(-1 3))
(define (sub* n l)
  (cond
    [(empty? l) '()]
    [else
     (cons
      (- (first l) n)
      (sub* n (rest l)))]))

(check-expect (inf-1 '(1 5)) 0)
(define (inf-1 l)
  (inf-sup < (sub* 1 l)))

(check-expect (sup-1 '(1 5)) 4)
(define (sup-1 l)
  (inf-sup > (sub* 1 l)))


(check-expect (min-max min (list 1)) 1)
(check-expect (min-max max (list 1)) 1)
(check-expect (min-max min (list 0 2 10)) 0)
(check-expect (min-max max (list 0 2 10)) 10)
(define (min-max R l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (R (first l)
        (min-max R (rest l)))]))

(define (inf-2 l)
  (min-max min (sub* 2 l)))

(define (sub-2 l)
  (min-max max (sub* 2 l)))

(inf-1 '(4 3 2 1))
; slower because the function's recursive procedure has to process
; the lists using a boolean comparison and the # of executions to reach
; a #true result are extensive
 
(inf-2 '(4 3 2 1))
; faster because the min function in the recursive procedure
; returns a number instead of a boolean so the # of fucntion executions
; is equal to the number of items in the list