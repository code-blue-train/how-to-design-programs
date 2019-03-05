;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |289|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 271.

; Name [List-of Names] -> Boolean
; consumes a name and a list of names.
; It determines whether any of the names on the latter are equal to or an
; extension of the former.
(check-expect (find-name.v2 "Jim"
                         (list "Jacque" "Jam" "Joseph"))
              #false)
(check-expect (find-name.v2 "Jim"
                         (list "Jacque" "Jam" "Jim" "Joseph"))
              #true)
(check-expect (find-name.v2 "Jim"
                         (list "Jacque" "Jam" "Jimi" "Jo"))
              #true)
(define (find-name.v2 n l)
  (ormap (lambda (s)
           (and (<= (string-length n) (string-length s))
                (string=? n (substring s 0 (string-length n)))))
         l))

; [List-of Names] -> Boolean
; checks that all names on a list of names start with the letter "a"
(check-expect (starts-with-a?.v2 (list "Jack" "Jill")) #false)
(check-expect (starts-with-a?.v2 (list "Adam")) #false)
(check-expect (starts-with-a?.v2 (list "ace")) #true)
(define (starts-with-a?.v2 l)
  (andmap (lambda (s) (string=? "a" (substring s 0 1))) l))
            