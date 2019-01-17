;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |168|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 168. Design the function translate.
; It consumes and produces lists of Posns.
; For each (make-posn x y) in the former, the latter contains (make-posn x (+ y 1)).
; We borrow the word “translate” from geometry, where the movement of a
; point by a constant distance along a straight line is called a translation.

; List-of-posns -> List-of-posns
; intepretation consumes a lop and produces a lop with the y coordinate
; translated 1 point
(check-expect (translate '()) '())
(check-expect (translate (cons (make-posn 1 1)
                               (cons (make-posn 2 2) '())))
              (cons (make-posn 1 2)
                    (cons (make-posn 2 3) '())))
(define (translate lop)
  (cond
    [(empty? lop) '()]
    [(cons? lop)
     (cons (move-y (first lop))
           (translate (rest lop)))]))

; Posn -> Posn
; intepretation consumes a posn and translates the y coordinate by 1
(define (move-y p)
  (make-posn (posn-x p) (+ 1 (posn-y p))))


                 
            