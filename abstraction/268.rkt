;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |268|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 268. An inventory record specifies the name of an item, a description,
; the acquisition price, and the recommended sales price.

(define-struct IR [name description a-price s-price])
; An IR is a structure:
; (make-IR String String Number Number)
; (make-IR "iPhone 8" "iPhone model 8" 500.00 550.00)

; Define a function that sorts a list of inventory records by the difference
; between the two prices (descending)
; [List-of IR} -> [List-of IR]
(check-expect (sort-IR
               (list
                (make-IR "Samsung S8" "S8 phone with case" 300.00 330.00)
                (make-IR "iPhone 10" "iPhone 10 with case" 600.00 690.00)
                (make-IR "Blackberry 9" "Blackberry with case" 250.00 260.00)))
               (list
                (make-IR "iPhone 10" "iPhone 10 with case" 600.00 690.00)
                (make-IR "Samsung S8" "S8 phone with case" 300.00 330.00)
                (make-IR "Blackberry 9" "Blackberry with case" 250.00 260.00)))
(define (sort-IR lir)
  (local (; IR -> Number
          ; consumes an IR and produces the profit
          (define (ir-profit ir)
            (- (IR-s-price ir) (IR-a-price ir)))
          ; IR IR -> Boolean
          ; ccnsumes 2 IRs and produces #true if profit of a is greater than b
          (define (compare a b)
            (> (ir-profit a) (ir-profit b))))
    (sort lir compare)))
            