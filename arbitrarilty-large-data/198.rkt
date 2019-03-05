;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |198|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

(define LOCATION "C:/Users/jheydt/Documents/Computer Science/Programming/words")

(define AS-LIST (read-lines LOCATION))

; Exercise 198. Design words-by-first-letter. The function consumes a Dictionary
; and produces a list of Dictionarys, one per Letter.

; Redesign most-frequent from exercise 197 using this new function.
; Call the new function most-frequent.v2. Once you have completed the design,
; ensure that the two functions compute the same result on your computer’s dictionary

; A Letter is one of the following 1Strings: 
; – "a"
; – ... 
; – "z"
; or, equivalently, a member? of this list: 
(define LETTERS
(explode "abcdefghijklmnopqrstuvwxyz"))

(define T-LETTERS
  (explode "abcdetyz"))

(define T-LIST
  (list "ace" "arch" "base" "case" "chase" "choose"
        "date" "taste" "yeast" "zest"))

(define T-DICT
                (list
               (list "ace" "arch")
               (list "base")
               (list "case" "chase" "choose")
               (list "date")
               (list "taste")
               (list "yeast")
               (list "zest")))

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

; List-of-dictionaries is one of:
; (cons Dictionary)
; (cons Dictionary List-of-dictionaries)

; Dictionary -> Letter-count
; consumes a Dictionary and produces the Letter-Count for the letter
; that occurs most often as the first one in the given Dictionary.

(define (most-frequent.v2 dict)
  (first (lolc-sort> (list-letter-counts (words-by-first-letter LETTERS dict)))))
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

; List-of-dictionaries -> List-of-letter-counts
; consumes a lod and produces a list-of-letter-counts
(check-expect (list-letter-counts
               (list
                (list "ace" "arrow")))
              (list
               (make-letter-counts "a" 2)))
(define (list-letter-counts lod)
  (cond
    [(empty? lod) '()]
    [else
     (cons (make-letter-counts
            (1s-letter-counts (first lod))
            (len-letter-counts (first lod)))
           (list-letter-counts (rest lod)))]))


; Dictionary -> Letter-counts
; consumes a dictionary and produces a letter-counts struct

(check-expect (len-letter-counts (list "ace")) 1)
(check-expect (len-letter-counts (list "ace" "arc" "arrow")) 3)
(define (len-letter-counts dict)
  (length dict))

; Dictionary -> 1String
; consumes a dictionary dict and produces a 1String that represents the 1st letter
; of the words in the dictionary
(check-expect (1s-letter-counts (list "ace")) "a")
(check-expect (1s-letter-counts (list "best" "borrow")) "b")
(define (1s-letter-counts dict)
  (substring (first dict) 0 1))

; Dictionary -> List-of-dictionaries
;  consumes a Dictionary and produces a list of Dictionarys, one per Letter
(check-expect (words-by-first-letter (list "a") (list "apple" "ace"))
              (list
               (list "apple" "ace")))
(check-expect (words-by-first-letter (list "a" "b")
               (list "apple" "ace" "beast" "borrow"))
              (list
               (list "apple" "ace")
               (list "beast" "borrow")))
(check-expect (words-by-first-letter T-LETTERS T-LIST)
              (list
               (list "ace" "arch")
               (list "base")
               (list "case" "chase" "choose")
               (list "date")
               (list "taste")
               (list "yeast")
               (list "zest")))

(define (words-by-first-letter letters dict)
  (cond
   [(empty? letters) '()]
    [else
     (if
      (not (empty-dict? (dict-first-letter (first letters) dict)))
      (cons (dict-first-letter (first letters) dict)
            (words-by-first-letter (rest letters) dict))
      (words-by-first-letter (rest letters) dict))]))

; Dictionary -> Boolean
; consumes a dictionary and produces #true if dictionary is empty '()
; otherwise returns #false
(check-expect (empty-dict? '()) #true)
(check-expect (empty-dict? (list "ace")) #false)
(check-expect (empty-dict? (list "ace" "also" "ask")) #false)
(define (empty-dict? dict)
  (= (length dict) 0))

; 1String Dictionary -> Dictionary
; conumes a 1String l and dictionary dict and produces a dictionary of
; all words that have the same first letter as l
; no matches return an empty string
(check-expect (dict-first-letter "z" (list "ace" "best" "zero"))
              (list "zero"))
(check-expect (dict-first-letter "a" T-LIST)
              (list "ace" "arch"))
(check-expect (dict-first-letter "e" T-LIST) '())
(define (dict-first-letter l dict)
  (cond
    [(empty? dict) '()]
    [else
     (if
      (1String-string-match? l (first dict))
      (cons (first dict) (dict-first-letter l (rest dict)))
      (dict-first-letter l (rest dict)))]))
                                 
; 1String String -> Boolean
; consumes a 1String 1s and a string s and if the first letter of s matches 1s
; return #true otherwise return #false
(check-expect (1String-string-match? "a" "apple") #true)
(check-expect (1String-string-match? "a" "best") false)
(define (1String-string-match? 1s s)
  (string=? 1s (substring s 0 1)))

   