;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |331|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Dir.v1 (short for directory) is one of: 
; – '()
; – (cons File.v1 Dir.v1)
; – (cons Dir.v1 Dir.v1)
 
; A File.v1 is a String

; Translate the directory tree in figure 123
; into a data representation according to model 1.

(define FILES '(("part1" "part2" "part3")
                "read!"
                (("hang" "draw")
                 "read!")))
                         
(define DIRS (cons "TS"
                   (cons
                    (cons "Text"
                          (cons "Libs"
                                (cons
                                 (cons "Text"
                                       (cons "Code" '())) '()))) '())))

; [List-of Strings] -> Number
; consumes a list of strings (files or directories) and returns the count of that list
(check-expect (how-many FILES) 7)
(check-expect (how-many DIRS) 5)
(check-expect (how-many '()) 0)
(define (how-many lof)
  (cond
    [(empty? lof) 0]
    [else
     (+ (if (string? (first lof))
            1
            (how-many (first lof)))
        (how-many (rest lof)))]))
      
 

             