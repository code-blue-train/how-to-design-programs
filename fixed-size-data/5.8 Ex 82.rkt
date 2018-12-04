;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.8 Ex 82|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; 3L-word 3L-word -> 3L-word 3L-word OR #false
; consumes 2 three-letter words
; produces the 2 three-letter words if they are the same
; produces #false if the words are not the same

; 3L-word is a structure
;  (make-3L-word "tes")
; 3L-word-word is a String composed of 3 characters of [a-z]
(define-struct 3L-word [word])
(define ex1 (make-3L-word "tes"))
(define ex2 (make-3L-word "aaa"))
(define ex3 (make-3L-word "zzz"))

; Function examples as unit tests
(check-expect (compare-word ex1 ex1) "tes tes")
(check-expect (compare-word ex1 ex2) #false)
(define (compare-word a b)
  (if
   (string=? (3L-word-word a) (3L-word-word b)) (string-append (3L-word-word a) " " (3L-word-word b))
   #false
   ))