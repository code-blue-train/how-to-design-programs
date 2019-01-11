;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |142|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; exercise 142

; List-of-images PositiveNumber -> Image
; intepretation consumes list-of-images (loi) and a positive number n
; and produces the first image on loi that is not an n by n square
; if it cannot find such an image it produces #false

; ImageOrFalse is one of:
; - Image
; - #false


(define MTSCN (empty-scene 50 50))
(define SQR1 (square 100 "solid" "red"))
(define SQR2 (square 100 "outline" "green"))
(define REC (rectangle 50 80 "solid" "red"))

(define (image-square? img n)
  (and (= (image-width img) n)
       (= (image-height img) n)))


(check-expect (ill-sized? (cons SQR1 (cons REC '())) 50) SQR1)
(check-expect (ill-sized? (cons REC (cons SQR2 '())) 80) REC)
(check-expect (ill-sized? (cons SQR1 (cons SQR2 '())) 100) #false)
(check-expect (ill-sized? (cons SQR1 '()) 100) #false)
(define (ill-sized? loi n)
  (cond
    [(empty? loi) #false]
    [else
     (if (false? (image-square? (first loi) n))
         (first loi)
         (ill-sized? (rest loi) n))]))


   
(ill-sized? (cons SQR1 (cons SQR2 '())) 100)
    