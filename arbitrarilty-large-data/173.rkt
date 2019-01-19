;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |173|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)


; Exercise 173. Design a program that removes all articles from a text file.
; The program consumes the name n of a file, reads the file, removes the articles,
; and writes the result out to a file whose name is the result of concatenating "no-articles-" with n.
; For this exercise, an article is one of the following three words: "a", "an", and "the".

; Use read-words/line so that the transformation retains the organization
; of the original text into lines and words.
; When the program is designed, run it on the Piet Hein poem.

; Text File -> Text File
; intepretation consumes a text file and produces a text file
; with articles removed

(define (remove-articles-f n)
 (write-file (string-append "no-articles-" n)
             (remove-articles (read-words/line n))))

; List-of-list-of-lines -> String
; intepretation consumes a list of list of lines and produces a string
; with the strings separated by blank spaces (" ") and lines separated with a newline ("\n")
; also removes the articles ("a", "an", and "the") from the resulting string

(define L1 (cons "hello" (cons "world" '())))
(define L2 (cons "the" (cons "world" '())))
(define L3 '())

(define LLS1 (cons L1 (cons L2 '())))

          
(define (remove-articles lls)
  (cond
    [(empty? lls) ""]
    [else
      (string-append (remove-articles-words (first lls))
                     "\n"
                     (remove-articles (rest lls)))]))
                      
                      
; List-of-strings -> String
; interpretation consumes a list of strings and produces a string with blank spaces " "
; between the words

(define (remove-articles-words los)
  (cond
    [(empty? los) ""]
    [else
     (string-append (replace-articles (first los))
                    (remove-articles-words (rest los)))]))

; String -> String
; intepretation consumes string s and if s is one of "a", "an", or "the"
; produce an empty string ""
(check-expect (replace-articles "a") "")
(check-expect (replace-articles "an" ) "")
(check-expect (replace-articles "the") "")
(check-expect (replace-articles "test") "test ")
(define (replace-articles s)
  (cond
    [(or (string=? s "a") (string=? s "an") (string=? s "the")) ""]
    [else (string-append s " ")]))








                                                                                                                                                                                            
                                                                          
                                            

              