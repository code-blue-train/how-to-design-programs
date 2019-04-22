;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Constant Definitions|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)


; exercise 124. Evaluate the following program, step-by-step:
(define PRICE 5)
(define SALES-TAX (* 0.08 PRICE))
(define TOTAL (+ PRICE SALES-TAX))

==
(define PRICE 5)
(define SALES-TAX (* 0.08 5))
(define TOTAL (+ PRICE SALES-TAX))
==
(define PRICE 5)
(define SALES-TAX 0.4)
(define TOTAL (+ PRICE SALES-TAX))
==
(define PRICE 5)
(define SALES-TAX 0.4)
(define TOTAL (+ 5 SALES-TAX))
==
(define PRICE 5)
(define SALES-TAX 0.4)
(define TOTAL (+ 5 0.4))
==
(define PRICE 5)
(define SALES-TAX 0.4)
(define TOTAL 5.4)

;Does the evaluation of the following program signal an error?

(define COLD-F 32)
(define COLD-C (fahrenheit->celsius COLD-F))
(define (fahrenheit->celsius f)
 (* 5/9 (- f 32)))
; yes because the function fahrenheit->celsius referenced in constant defition COLD-C
; precedes the definition of the function

;How about the next one?

(define LEFT -100)
(define RIGHT 100)
(define (f x) (+ (* 5 (expt x 2)) 10))
(define f@LEFT (f LEFT))
(define f@RIGHT (f RIGHT))
==
(define f@LEFT (f -100))
==
(+ (* 5 (expt -100 2) 10))
==
(+ (* 5 10000) 10)
==
(+ 50000 10)
==
50010

(define f@RIGHT (f 100))
==
(+ (* 5 (expt 100 2) 10))
==
(+ (* 5 10000) 10)
==
(+ 50000 10)
==
50010

; no, this program does not result in an error


