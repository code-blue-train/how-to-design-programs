;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |297|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; Sample problem
; Navy strategists represent fleets of ships  as rectangles 
; (the ships themselves) and circles (their weapons’ reach).
; The coverage of a fleet of ships is the combination of all these shapes.
; Design a data representation for rectangles, circles, and combinations of shapes.
; Then design a function that determines whether some point is within a shape.

(define-struct ship [length width outline color])
(define-struct reach [radius outline color])
(define-struct ship-coverage [ship reach])

; A Shape is a function: 
;   [Posn -> Boolean]
; interpretation if s is a shape and p a Posn, (s p) 
; produces #true if p is in s, #false otherwise

; Shape Posn -> Boolean
; represents a point (x,y)
(check-expect (inside? (mk-point 3 4) (make-posn 3 4)) #t)
(check-expect (inside? (mk-point 3 4) (make-posn 3 0)) #f)
(define (inside? s p)
  (s p))

; Posn -> Boolean 
(lambda (p) (and (= (posn-x p) 3) (= (posn-y p) 4)))

; Number Number -> Shape
(define (mk-point x y)
  (lambda (p)
    (and (= (posn-x p) x) (= (posn-y p) y))))

(define a-sample-shape (mk-point 3 4))

; Number Number Number -> Shape
; creates a representation for a circle of radius r
; located at (center-x, center-y)
(check-expect (inside? (mk-circle 3 4 5) (make-posn 0 0)) #t)
(check-expect (inside? (mk-circle 3 4 5) (make-posn 0 9)) #f)
(check-expect (inside? (mk-circle 3 4 5) (make-posn -1 3)) #t)
(define (mk-circle center-x center-y r)
  ; [Posn -> Boolean]
  (lambda (p)
    (<= (distance-between center-x center-y p) r)))

; Number Number Posn -> Number
; interpretation consumes 2 numbers x, y and a posn p
; computes the distance between the points (x, y) and p
(check-within (distance-between 3 4 (make-posn 0 0)) 5 .1)
(check-within (distance-between 3 4 (make-posn -1 3)) 4.1 .1)
(check-within (distance-between 3 4 (make-posn 0 10)) 6.7 .1)
(define (distance-between x y p)
  (sqrt (+ (sqr (- x (posn-x p))) (sqr (- y (posn-y p))))))

; Number Number Number Number -> Shape
; represents a width by height rectangle whose
; upper-left corner is located at (ul-x, ul-y)
(check-expect (inside? (mk-rect 0 0 10 3)
                       (make-posn 0 0))
              #true)
(check-expect (inside? (mk-rect 2 3 10 3)
                       (make-posn 4 5))
              #true)
(check-expect (inside? (mk-rect 0 0 10 3)
                       (make-posn 15 5))
              #false)
(define (mk-rect ul-x ul-y width height)
  (lambda (p)
    (and (<= ul-x (posn-x p) (+ ul-x width))
         (<= ul-y (posn-y p) (+ ul-y height)))))
                                
                       
; Shape Shape -> Shape
; combines the two shapes into one
(define (mk-combination s1 s2)
  ; Posn -> Boolean
  (lambda (p)
    (or (inside? s1 p)
        (inside? s2 p))))

(define circle1 (mk-circle 3 4 5))
(define rectangle1 (mk-rect 0 3 10 3))
(define union1 (mk-combination circle1 rectangle1))

(check-expect (inside? union1 (make-posn 0 0)) #true)
(check-expect (inside? union1 (make-posn 0 9)) #false)
(check-expect (inside? union1 (make-posn -1 3)) #true)





