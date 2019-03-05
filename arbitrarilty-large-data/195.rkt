;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |195|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

(define LOCATION "C:/Users/jheydt/Documents/Computer Science/Programming/words")

(define AS-LIST (read-lines LOCATION))

; A Letter is one of the following 1Strings: 
; – "a"
; – ... 
; – "z"
; or, equivalently, a member? of this list: 
;(define LETTERS
 ; (explode "abcdefghijklmnopqrstuvwxyz"))

; Exercise 195. Design the function starts-with#, which consumes a Letter
; and Dictionary and then counts how many words in the given Dictionary
; start with the given Letter. Once you know that your function works,
; determine how many words start with "e" in your computer’s dictionary
; and how many with "z".

;> (starts-with# "e" AS-LIST)
;3275
;> (starts-with# "z" AS-LIST)
;143
 

; 1String Dictionary -> Number
; consumes a letter and dictionary and produces the number of
; words that start with that letter

(check-expect (starts-with# "a"
                            (cons "ace" '()))
              1)
(check-expect (starts-with# "a"
                            (cons "ace"
                                  (cons "bass" '())))
              1)
(check-expect (starts-with# "a"
                            (cons "ace"
                                  (cons "apple"
                                        (cons "bass" '()))))
              2)
(check-expect (starts-with# "a"
                            (cons "bass"
                                  (cons "car" '())))
              0)

(define (starts-with# l dict)
  (cond
    [(empty? (rest dict)) (string-match l (first dict)) ]
    [else
     (+ (string-match l (first dict)) (starts-with# l (rest dict)) 0)]))

; 1String String -> Number
; consumes a 1String s and a string s2 and if s matches the first lettter of s2 return 1
; otherwise return 0
(check-expect (string-match "a" "ace") 1)
(check-expect (string-match "a" "bass") 0)

(define (string-match s1 s2)
  (if
   (string=? s1 (substring s2 0 1))
   1
   0))
