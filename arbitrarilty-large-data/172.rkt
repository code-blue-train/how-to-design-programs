;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |172|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

; Exercise 172. Design the function collapse, which converts a list of lines into a string.
; The strings should be separated by blank spaces (" ").
; The lines should be separated with a newline ("\n")

; this example requires that the function read a list of list of lines not just a list of lines:
; To make sure the two files "ttt.dat" and "ttt.txt" are identical,
; remove all extraneous white spaces in your version of the T.T.T. poem.


(define L0 (cons
            (cons "1" '()) '()))
(define L1 (cons
            (cons "1" (cons "2" '()))
            (cons
             (cons "3" '()) '())))
(define L2 (cons
            (cons "Title:" '())
            (cons
             (cons "First sentence." '()) '())))
; List-of-list-of-lines -> String
; intepretation consumes a list of list of lines and produces a string
; with the strings separated by blank spaces (" ") and lines separated with a newline ("\n")
(check-expect (collapse
               (cons
                (cons "1" '()) '()))
              "1")
(check-expect (collapse
               (cons
                (cons "1" (cons "2" '()))
                (cons
                 (cons "3" '()) '())))
              "1 2\n3")
(check-expect (collapse '()) "")

(define (collapse lll)
  (cond
    [(empty? lll) ""]
    [(cons? lll)
     (if
      (and (> (length lll) 1) (not (empty? (rest lll))))
      (string-append (los->str (first lll)) "\n" (collapse (rest lll)))
      (string-append (los->str (first lll)) (collapse (rest lll))))]))
                      
                      
; List-of-strings -> String
; interpretation consumes a list of strings and produces a string with blank spaces " "
; between the words
(check-expect (los->str (cons "1" (cons "2" '())))
              "1 2")
(check-expect (los->str '()) "")
(define (los->str los)
  (cond
    [(empty? los) ""]
    [(cons? los)
     (if (= (length los) 1)
         (string-append (first los)
                        (los->str (rest los)))
         (string-append (first los) " "
                        (los->str (rest los))))]))
                        
  








                                                                                                                                                                                            
                                                                          
                                            

              