;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |174|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)
; Exercise 174. Design a program that encodes text files numerically.
; Each letter in a word should be encoded as a numeric three-letter string
; with a value between 0 and 256. Figure 69 shows our encoding function for single letters.
; Before you start, explain these functions.

; function encode-letter has case analysis on the input string that ensures
; that the encoding for the string returns a 3 letter code as a string
;    - encode-letter calls function code1 which converts the int representation
;      of the string back to a string

; Hints (1) Use read-words/line to preserve the organization of the file into lines and words.
; (2) Read up on explode again.

; List-of-list-of-strings (LLS) is one of:
; (cons list-of-strings)
; (cons lists-of-strings LLS)

; File -> File
; intepretation consumes a file and produces a file with each letter in a word
; encoded as a numeric three-letter string; line breaks in the file are maintained
(define (encode-file-f n)
  (write-file (string-append "encoded-file-" n)
              (encode-file (read-words/line n))))

; LLS -> String
; intepretation consumes LLS and returns a string with each letter
; encoded as a numeric three-letter string
(check-expect (encode-file
               (cons
                (cons "a" (cons "great" '()))
                (cons
                 (cons "day." '()) '())))
              (string-append (encode-letter "a") " "
                             (encode-letter "g") " "
                             (encode-letter "r") " "
                             (encode-letter "e") " "
                             (encode-letter "a") " "
                             (encode-letter "t") " " "\n"
                             (encode-letter "d") " "
                             (encode-letter "a") " "
                             (encode-letter "y") " "
                             (encode-letter ".") " " "\n"))
(define (encode-file lls)
  (cond
    [(empty? lls) ""]
    [else
     (string-append (los->los (first lls))
                    "\n"
                    (encode-file (rest lls)))]))

; List-of-strings -> List-of-strings
; interpretation consumes a los and produces a string with each letter
; in the word encoded as a numeric three-letter string
(check-expect (los->los (cons "a" (cons "b" '())))
              (string-append (encode-letter "a") " "
                             (encode-letter "b") " "))
(check-expect (los->los (cons "one." (cons "\n" '())))
              (string-append (encode-letter "o") " "
                             (encode-letter "n") " "
                             (encode-letter "e") " "
                             (encode-letter ".") " "
                             (encode-letter "\n") " "))

(define (los->los los)
  (cond
    [(empty? los) ""]
    [else
     (string-append (encode-letter/los (explode (first los))) ""
          (los->los (rest los)))]))


; List-of-1Strings -> String
; intepretation consumes a list of 1Strings and produces 
; encoded numeric three-letter string for each 1String
(check-expect (encode-letter/los
               (cons "a" (cons "b" '())))
              (string-append (encode-letter "a") " " (encode-letter "b") " "))
(check-expect (encode-letter/los
               (cons "." (cons "\n" '())))
              (string-append (encode-letter ".") " " (encode-letter "\n") " "))
(define (encode-letter/los los)
  (cond
    [(empty? los) ""]
    [else
     (string-append (encode-letter (first los)) " "
                    (encode-letter/los (rest los)))]))
                           
 
; 1String -> String
; converts the given 1String to a 3-letter numeric String
 
(check-expect (encode-letter "z") (code1 "z"))
(check-expect (encode-letter "\t")
              (string-append "00" (code1 "\t")))
(check-expect (encode-letter "a")
              (string-append "0" (code1 "a")))
 
(define (encode-letter s)
  (cond
    [(>= (string->int s) 100) (code1 s)]
    [(< (string->int s) 10)
     (string-append "00" (code1 s))]
    [(< (string->int s) 100)
     (string-append "0" (code1 s))]))
 
; 1String -> String
; converts the given 1String into a String
 
(check-expect (code1 "z") "122")
 
(define (code1 c)
  (number->string (string->int c)))