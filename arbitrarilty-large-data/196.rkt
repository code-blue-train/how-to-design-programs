;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |196|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

(define LOCATION "C:/Users/jheydt/Documents/Computer Science/Programming/words")

(define AS-LIST (read-lines LOCATION))

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

; Exercise 196. Design count-by-letter.
; The function consumes a Dictionary and counts how often each letter is used
; as the first one of a word in the given dictionary. Its result is a list of
; Letter-Counts, a piece of data that combines letters and counts.

; Once your function is designed, determine how many words appear for all
; letters in your computer’s dictionary.

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
(count-by-letter LETTERS AS-LIST)