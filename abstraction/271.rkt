;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |271|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 271.

; Name [List-of Names] -> Boolean
; consumes a name and a list of names.
; It determines whether any of the names on the latter are equal to or an
; extension of the former.
(check-expect (find-name "Jim"
                         (list "Jacque" "Jam" "Joseph"))
              #false)
(check-expect (find-name "Jim"
                         (list "Jacque" "Jam" "Jim" "Joseph"))
              #true)
(check-expect (find-name "Jim"
                         (list "Jacque" "Jam" "Jimi" "Jo"))
              #true)
(define (find-name n l)
  (local (; String -> Boolean
          ; produces #true if s is equal to n or if n starts with s
          (define (starts-with? s)
            (and (<= (string-length n) (string-length s))
                 (string=?
                  n (substring s 0 (string-length n))))))
    (ormap starts-with? l)))

; [List-of Names] -> Boolean
; checks that all names on a list of names start with the letter "a"
(check-expect (starts-with-a? (list "Jack" "Jill")) #false)
(check-expect (starts-with-a? (list "Adam")) #false)
(check-expect (starts-with-a? (list "ace")) #true)
(define (starts-with-a? l)
  (local (; String -> Boolean
          (define (fn-starts-with-a? s)
            (string=? "a" (substring s 0 1))))
    (andmap fn-starts-with-a? l)))
            
; Should you use ormap or andmap to define a function
; that ensures that no name on some list exceeds a given width?
; use andmap as all items on the list must satisfy the "given width" predicate in this case