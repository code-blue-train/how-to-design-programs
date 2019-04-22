;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |197|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

(define LOCATION "C:/Users/jheydt/Documents/Computer Science/Programming/words")

(define AS-LIST (read-lines LOCATION))

; Exercise 197. Design most-frequent. The function consumes a Dictionary.
; It produces the Letter-Count for the letter that occurs most often as
; the first one in the given Dictionary.

; What is the most frequently used letter in your computer’s dictionary
; and how often is it used?

; A Letter is one of the following 1Strings: 
; – "a"
; – ... 
; – "z"
; or, equivalently, a member? of this list: 
(define LETTERS
 (explode "abcdefghijklmnopqrstuvwxyz"))

(define T-LIST
  (list "ace" "arch" "base" "case" "chase" "choose"
        "date" "taste" "yeast" "zest"))

; Letter-counts is a structure
; (make-letter-counts 1String Number)
; letter is a letter of the alphabet and count is the number of times the letter
; appears in a dictionary
(define-struct letter-counts [letter count])

; List-of-letter-counts is one of:
; (cons letter-counts)
; (cons letter-counts List-of-letter-counts)

; List-of-letters is one of:
; (cons 1String)
; (cons 1String List-of-letters)

; Dictionary -> Letter-count
; consumes a Dictionary and produces the Letter-Count for the letter
; that occurs most often as the first one in the given Dictionary.
(check-expect (most-frequent T-LIST)
              (make-letter-counts "c" 3))
(define (most-frequent dict)
  (first (lolc-sort> (count-by-letter LETTERS dict))))

;(most-frequent AS-LIST)
;(make-letter-counts "s" 9933)
; i prefer to use a sorted list and selecting the first item from the sorted list of pairs
; i prefer this because having a sort function is reusable

; List-of-letter-counts -> List-of-letter-counts
; produces a list-of-letter-counts sorted descending by letter-counts-count
(check-expect (lolc-sort> '()) '())
(check-expect (lolc-sort>
               (list (make-letter-counts "a" 1)))
               (list (make-letter-counts "a" 1)))
(check-expect (lolc-sort>
               (list (make-letter-counts "a" 1)
                     (make-letter-counts "b" 10)))
              (list (make-letter-counts "b" 10)
                    (make-letter-counts "a" 1)))
(check-expect (lolc-sort>
               (list (make-letter-counts "a" 1)
                     (make-letter-counts "b" 10)
                     (make-letter-counts "c" 5)))
              (list (make-letter-counts "b" 10)
                    (make-letter-counts "c" 5)
                    (make-letter-counts "a" 1)))               
(define (lolc-sort> lolc)
  (cond
    [(empty? lolc) '()]
    [else
     (insert (first lolc)
             (lolc-sort> (rest lolc)))]))

; Letter-count List-of-letter-counts -> List-of-letter-counts
; inserts lc letter-count into the sorted list-of-letter-counts lolc
(check-expect (insert (make-letter-counts "a" 1) '())
              (list (make-letter-counts "a" 1)))
(check-expect (insert (make-letter-counts "a" 1)
                      (list (make-letter-counts "b" 10)))
              (list (make-letter-counts "b" 10)
                    (make-letter-counts "a" 1)))
(check-expect (insert (make-letter-counts "a" 1)
                      (list (make-letter-counts "b" 10)
                            (make-letter-counts "c" 5)))
              (list (make-letter-counts "b" 10)
                    (make-letter-counts "c" 5)
                    (make-letter-counts "a" 1)))
(check-expect (insert (make-letter-counts "b" 10)
                      (list (make-letter-counts "c" 5)
                            (make-letter-counts "a" 1)))
              (list (make-letter-counts "b" 10)
                    (make-letter-counts "c" 5)
                    (make-letter-counts "a" 1)))
                      
(define (insert lc lolc)
  (cond
    [(empty? lolc) (cons lc '())]
    [else
     (if
      (lc>=? lc (first lolc))
      (cons lc lolc)
      (cons (first lolc) (insert lc (rest lolc))))]))


; Letter-counts Letter-counts -> Boolean
; compares 2 letter-counts and returns #true if the count of lc1 is greater than
; or equal to the count of lc2; otherwise returns #false
(check-expect (lc>=?
               (make-letter-counts "a" 1)
               (make-letter-counts "c" 10))
              #false)
(check-expect (lc>=?
               (make-letter-counts "a" 1)
               (make-letter-counts "d" 1))
               #true)
(check-expect (lc>=?
               (make-letter-counts "a" 1)
               (make-letter-counts "f" 0))
              #true)
(define (lc>=? lc1 lc2)
  (>= (letter-counts-count lc1)
      (letter-counts-count lc2)))

; Dictionary List-of-letters -> List-of-letter-counts
; consumes a dictionary and list-of-letters and produces a list-of-letter-counts
(check-expect (count-by-letter
               (list "a") T-LIST)
              (list (make-letter-counts "a" 2)))
(check-expect (count-by-letter
               (list "e") T-LIST)
              (list (make-letter-counts "e" 0)))
(check-expect (count-by-letter
               (list "a" "c" "e") T-LIST)
              (list (make-letter-counts "a" 2)
                    (make-letter-counts "c" 3)
                    (make-letter-counts "e" 0)))
(define (count-by-letter lol dict)
  (cond
    [(empty? (rest lol)) (cons (make-letter-counts
                                (first lol)
                                (starts-with# (first lol) dict)) '())]
    [else (cons (make-letter-counts
                 (first lol)
                 (starts-with# (first lol) dict))
          (count-by-letter (rest lol) dict))]))

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

; produces list-of-letter-counts
; which is the number of words in the dictionary that start with each letter of the alphabet
;(count-by-letter LETTERS AS-LIST)