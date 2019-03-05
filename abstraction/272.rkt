;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |272|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
; Exercise 272. Recall that the append function in ISL concatenates the items of two lists or,
; equivalently, replaces '() at the end of the first list with the second list:
; (equal? (append (list 1 2 3) (list 4 5 6 7 8))
;         (list 1 2 3 4 5 6 7 8))

; Use foldr to define append-from-fold. What happens if you replace foldr with foldl?

; [List-of X] [List-of X]  -> [List-of X]
; append list a and b using foldrr
(check-expect (append-from-fold
               (list 1 2) (list 3 4))
              (list 1 2 3 4))
(define (append-from-fold a b)
  (foldr cons b a))

; {X] [List-of X] [X -> Y] -> Y
; compute the sum of a list of numbers
(check-expect (sum-list (list 0 1)) 1)
(check-expect (sum-list (list 5 6)) 11)
(define (sum-list l)
  (foldr + 0 l))
; compute the product of a list of numbers
(check-expect (product-list (list 1 2)) 2)
(check-expect (product-list (list 4 10 2)) 80)
(check-expect (product-list (list 5 3 0)) 0)
(define (product-list l)
  (foldr * 1 l))

; With one of the fold functions, you can define a function that horizontally composes
; a list of Images. Hints (1) Look up beside and empty-image.
; empty-image: h and w are 0 so nothing is drawn
(define IMG-1 (circle 10 "solid" "red"))
(define IMG-2 (rectangle 20 20 "outline" "blue"))
(define SCENE
  (place-image
   (triangle 32 "solid" "red")
   24 24
   (rectangle 48 48 "solid" "gray")))

; [List-of Images] -> Image
; places list of images l in a horizontal row aligned on their centers
(check-expect (render-h
               (list IMG-1 IMG-2 IMG-1 IMG-2))
               (beside IMG-1 IMG-2 IMG-1 IMG-2))
(define (render-h l)
  (foldr beside empty-image l))
                
; Can you use the other fold function? Also define a function that stacks a list
; of images vertically. (2) Check for above in the libraries.
; [List-of Images] -> Image
; stacks a list of images vertically on their centers
(check-expect (render-v
               (list SCENE IMG-1 IMG-2))
              (above SCENE IMG-1 IMG-2))
(define (render-v l)
  (foldr above empty-image l))

