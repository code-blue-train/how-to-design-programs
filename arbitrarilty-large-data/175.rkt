;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |175|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

; Exercise 175. Design a BSL program that simulates the Unix command wc.
; The purpose of the command is to count the number of 1Strings, words,
; and lines in a given file. That is, the command consumes the name of a file
; and produces a value that consists of three numbers.

; A list-of-list-of-strings (LLS) is one of:
; (cons List-of-strings) (aka Los)
; (cons Los LLS)

(define line1 (cons "happy" (cons "days" '())))
(define line2 (cons "are" (cons "here!" '())))

(define lls (cons line1 (cons line2 '())))

; wish list
; function to count 1Strings
; function to count words
; function to count lines

; LLS -> String
; intepretation consumes a LLS and returns a string that consists of
; three numbers that represent the number of 1Strings, words and lines
;(check-expect (counter-summary lls)
 ;             (string-append (number->string 17) " "
  ;                           (number->string 4) " "
   ;                          (number->string 2) " "))


; Counts is a structure
; (make-counts [Number Number Number])
; (make-counts 17 4 2)
(define-struct counts [1strings words lines])

(define (count-summary-f n)
  (string-append "1String count: "
                 (number->string (counts-1strings (count-summary (read-words/line n))))
                 "\n"
                 "Word count: "
                 (number->string (counts-words (count-summary (read-words/line n))))
                 "\n"
                 "Line count: "
                 (number->string (counts-lines (count-summary (read-words/line n))))))
         

(define (count-summary lls)
  (make-counts (count-1strings/los lls) (count-words/los lls) (count-lines lls)))


;;;;;;;;;;;
; processing functions for LLS line counter

; LLS -> Number
; intepretation consumes LLS and produces a number that represents the number of
; lines
(check-expect (count-lines lls) 2)

(define (count-lines lls)
  (cond
    [(empty? lls) 0]
    [(cons? lls)
     (+ (count-lines (rest lls)) 1)]))

;;;;;;;;;;;
; processing functions for LLS word counter

; LLS-> Number
; intepretation consumes an LLS and produces a number that represents the number of
; words in the LLS
(define (count-words/los lls)
  (cond
    [(empty? lls) 0]
    [else
     [+ (count-words (first lls))
                     (count-words/los (rest lls))]]))

; Los -> Number
; intepretation consumes a los and produces a number that represents the number of
; words in each los
(check-expect (count-words line1) 2)
(check-expect (count-words
               (cons "one" (cons "two" (cons "three" '())))) 3)
(define (count-words los)
  (cond
    [(empty? los) 0]
    [(cons? los)
     (+ (count-words (rest los)) 1)]))

;;;;;;;;;;;
; processing functions for LLS 1String counter

; LLS -> Los
; interpretation consumes an LLS and produces an los
(check-expect (count-1strings/los lls) 17)
(check-expect (count-1strings/los '()) 0)
(define (count-1strings/los lls)
  (cond
    [(empty? lls) 0]
    [else
     (+ (count-1strings/string (first lls))
          (count-1strings/los (rest lls)))]))

; Los -> Number
; interpretation consumes a los and produces a number that represents the number
; of 1Strings in the los
(check-expect (count-1strings/string line1) 9)
(check-expect (count-1strings/string '()) 0)
(define (count-1strings/string los)
  (cond
    [(empty? los) 0]
    [else
     (+ (count-1strings (explode (first los)))
                        (count-1strings/string (rest los)))]))

(check-expect (count-1strings (cons "o" (cons "n" (cons "e" '())))) 3)

(define (count-1strings los)
  (cond
    [(empty? los) 0]
    [(cons? los)
      (+ (count-1strings (rest los)) 1)]))

