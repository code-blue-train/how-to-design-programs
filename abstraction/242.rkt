;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |242|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 242. Here is one more parametric data definition:
; A [Maybe X] is one of: 
; – #false 
; – X

;Interpret these data definitions: [Maybe String], [Maybe [List-of String]]
; and [List-of [Maybe String]].

; a [Maybe String] is one of:
; #false
; String

; A [Maybe [List-of String]] is one of:
; (cons #false '())
; (cons String [List-of String])

; A [List-of [Maybe String]] is one of:
; (cons #false '())
; (cons String '())
; (cons #false [List-of [Maybe String])
; (cons String [List-of [Maybe String]]

; What does the following function signature mean:

; String [List-of String] -> [Maybe [List-of String]]
; returns the remainder of los starting with s 
; #false otherwise 
(check-expect (occurs "a" (list "b" "a" "d" "e"))
              (list "d" "e"))
(check-expect (occurs "c" (list "a" "c")) '())
(check-expect (occurs "a" (list "b" "c" "d")) #f)
(check-expect (occurs "a" '()) #false)
(define (occurs s los)
  (cond
    [(empty? los) #false]
    [else
     (if
      (not (string-in-list? s los))
      #false
      (los-post-s s los))]))


; String List-of-strings -> Boolean
; consumes strings and list-of-strings los and if s is a member of los return #true
; otherwise return #false
(check-expect (string-in-list? "s" (list "a" "b")) #false)
(check-expect (string-in-list? "s" (list "s" "a")) #true)
(define (string-in-list? s los)
  (member? s los))


; String List-of-strings -> List-of-strings
; consumes string s and list-of-strings los and returns los after s is found
(define (los-post-s s los)
  (cond
    [(empty? los) '()]
    [else
     (if
      (string-equals? s (first los))
      (print-rol (rest los))
      (los-post-s s (rest los)))]))
      

; String String -> Boolean
; if string s1 equals string s2 return #true otherwise return #false
(check-expect (string-equals? "a" "a") #true)
(check-expect (string-equals? "a" "b") #false)
(define (string-equals? s1 s2)
  (string=? s1 s2))


; NEList-of-String -> NEList-of-string
(check-expect (print-rol (list "c" "d"))
              (list "c" "d"))                 
(define (print-rol los)
  (cond
    [(empty? los) '()]
    [else
     (cons (first los)
           (print-rol (rest los)))]))

; i created an obscenely complicated solution
; here is a much better one:
(define (occurs.v2 s los)
  (cond
    [(empty? los) #f]
    [(string=? s (first los)) (rest los)]
    [else (occurs.v2 s (rest los))]))