;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |6.3 Exercises|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; exercise 110
(define (area-of-disk v)
  (* 3.14 (* v v)))

(define (checked-area-of-disk v)
  (cond
    [(and (number? v) (> v 0)) (area-of-disk v)]
    [else (error "area-of-disk: positive number expected")]))

; execise 111
(define-struct vec [x y])
; A vec is
;   (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector

(define (checked-make-vec x y)
  (cond
    [(and (> x 0) (> y 0)) (make-vec x y)]
    [else (error "make-vec: positive numbers expected")]))


; execise 112
(define (missile-or-not? v)
  (cond
    [(or (false? v) (posn? v)) #true]
    [else #false]))

; exercise 113

(define (SIGS? v)
  (cond
    [( or (make-aim? v) (make-fired? v)) #true]
    [else #false]))

(define (Coordinate? v)
  (cond
    [(or (< (posn-y v) 0) (> (posn-y v) 0) (make-posn? v)) #true]
    [else #false]))

(define (VAnimal? v)
  (cond
    [(or (VCat? v) (VCham? v)) #true]
    [else #false]))