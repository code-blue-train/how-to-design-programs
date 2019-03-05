;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.4 Ex 68|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct ball [location velocity])

(define-struct vel [deltax deltay])

(define ball1
  (make-ball (make-posn 30 40) (make-vel -10 5)))

(define-struct ballf [x y deltax deltay])

(define ballf1
  (make-ballf 30 40 -10 5))

(define-struct ballc [a b])

(define ballc1
  (make-ballc 30+40i -10+5i))

