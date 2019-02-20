;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |267|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 267. Use map to define the function convert-euro, which converts a list of
; US$ amounts into a list of € amounts based on an exchange rate of US$1.06 per €
; (on April 13, 2017).

(define XRATE 1.06)

; Number Number -> Number
; consumes a currency amount n and exchange rate x and produces converted currency y
(check-within (convert 1.00 XRATE) .94 .01)
(check-within (convert 2.00 XRATE) 1.88 .01)
(define (convert n x)
  (* (/ 1 x) n))

; [X Y] [X -> Y] [List-of X] -> [List-of Y]
; converts a list of US$ amounts into a list of € amounts based on an
; exchange rate of US$1.06 per €
(check-within (convert-euro
               (list 1.06 2.00 3.5) XRATE)
              (list 1.00 1.88 3.30) .01)
(define (convert-euro lon x)
  (local (; Number -> Number
          ; converts a currency value based on XRATE
          (define (helper n)
            (convert n XRATE)))
    (map helper lon))
  )

; Also use map to define convertFC, which converts a list of Fahrenheit
; measurements to a list of Celsius measurements.

; [X Y] [X -> Y] [List-of X] -> [List-of Y]
;  converts a list of Fahrenheit measurements to a list of Celsius measurements.
(check-within (convertFC
               (list -30 0 100))
               (list -34.4 -17.7 37.7) .1)
(define (convertFC lon)
  (local (; Number -> Number
          ; converts F to C
          (define (f->c n)
            (* (- n 32) 5/9)))
    (map f->c lon)))

; Finally, try your hand at translate, a function that translates a list
; of Posns into a list of lists of pairs of numbers.

;[X Y] [X -> Y] [List-of X]  -> [List-of Y]
; translates a list of Pons into a list of lists of pairs of numbers
(check-expect (translate
               (list (make-posn 0 0)
                     (make-posn 10 10)))
              (list
               (list 0 0)
               (list 10 10)))
(define (translate lop)
  (local (; Posn -> List X Y
          ; converts a Posn into list of pair X Y
          (define (po->pr p)
            (list (posn-x p) (posn-y p))))
    (map po->pr lop)))
          