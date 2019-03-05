;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Fixed Size Data section 3.2
(require 2htdp/image)
(require 2htdp/universe)

; exercise 34

; String -> String
; extract first letter from s
; given:
;   "first" for s
; expected:
;   "f"
; stub:
;(define (string-first s) "")

(define (string-first s)
  (substring s 0 1))

; exercise 35

; String -> String
; extract last letter from s
; given:
;   "last" for s
; expect:
;   "t"
; stub:
; (define (string-last s) "")

(define (string-last s)
  (substring s (- (string-length s) 1)))

; exercise 36

; Image -> Number
; compute the number of pixels in image img
; uses sqr function
; given:
;   (square 10 "solid" "orange")
; expect:
;   100
; given:
;   . (square 25 "solid" "red")
; expect:
;   625
; stub:
; (define (image-area img) "")

(define (image-area img)
  (sqr (image-width img)))

; exercise 37

; String -> String
; compute a string with the first letter of string s removed
; given:
;   "test"
; expected:
;   "est"
; stub:
; (define (string-rest s) "")

(define (string-rest s)
  (substring s 1))

; exercise 38
; String -> String
; compute a string with the last letter of string s removed
; given:
;   "test"
;   "miles davis"
;expected:
;   "tes"
;   "miles davi"
; stub:
; (define (string-remove-last s) "")

(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))