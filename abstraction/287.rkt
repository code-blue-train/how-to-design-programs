;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |287|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 269.



(define-struct IR [name description a-price s-price])
; An IR is a structure:
; (make-IR String String Number Number)
; (make-IR "iPhone 8" "iPhone model 8" 500.00 550.00)

(define LoIR
  (list
                (make-IR "Samsung S8" "S8 phone with case" 300.00 330.00)
                (make-IR "iPhone 10" "iPhone 10 with case" 600.00 690.00)
                (make-IR "Blackberry 9" "Blackberry with case" 250.00 260.00)))

; Number [List-of IR] -> [List-of IR]
; consumes a number, ua, and a list of inventory records, l,
; and it produces a list of all those structures whose sales price is below ua
(check-expect (eliminate-exp 500.00
                                   LoIR)
              (list
               (make-IR "Samsung S8" "S8 phone with case" 300.00 330.00)
               (make-IR "Blackberry 9" "Blackberry with case" 250.00 260.00)))
(define (eliminate-exp ua l)
  (filter (lambda (ir) (< (IR-s-price ir) ua)) l))


; Then use filter to define recall, which c
; String [List-of IR] -> [List-of IR]
; consumes the name of an inventory item, called ty, and a list of inventory records, l, 
; and produces a list of inventory records that do not use the name ty.
(check-expect (recall "iPhone 10" LoIR)
              (list
               (make-IR "Samsung S8" "S8 phone with case" 300.00 330.00)
               (make-IR "Blackberry 9" "Blackberry with case" 250.00 260.00)))
(define (recall ty l)
  (filter (lambda (ir) (not (string=? (IR-name ir) ty))) l))

; [List-of Names] [List-of Names] -> [List-of Names]
; consumes two lists of names and selects all
; those from the second one that are also on the first.
(check-expect (selection
               (list "Samsung S8" "iPhone 10" "Blackberry Pi")
               (list "iPhone 10" "Google Pixel"))
              (list
               "iPhone 10"))
(define (selection a b)
  (filter (lambda (s) (member? s a)) b))
                        