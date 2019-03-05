;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |190|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 190. Design the prefixes function, which consumes
; a list of 1Strings and produces the list of all prefixes.
; A list p is a prefix of l if p and l are the same up through all items in p.
; For example, (list "a" "b" "c") is a prefix of itself and (list "a" "b" "c" "d").

; A List-of-1Strings is one of:
; (cons 1String)
; (cons 1String List-of-1Strings)

; List-of-1Strings List-of-1Strings -> List-of-1Strings
; produces prefixes
(check-expect (prefixes '())
              '())
(check-expect (prefixes (list "a"))
              (list (list "a")))
(check-expect (prefixes (list "a" "b"))
              (list (list "a")
                    (list "a" "b")))
(check-expect (prefixes (list "a" "b" "c"))
              (list (list "a")
                    (list "a" "b")
                    (list "a" "b" "c")))

(define (prefixes lo1s)
  (reverse (prefixes-proper (reverse lo1s))))

(define (prefixes-proper lo1s)
  (cond
    [(empty? lo1s) '()]
    [else
     (cons (reverse (cons (first lo1s) (rest lo1s)))
           (prefixes-proper (rest lo1s)))]))

; List-of-1Strings -> List-of-1Strings
; produces a list of all suffixes
; a list s is a suffix of l if p and l are the same from the end,
; up through all items in s
(check-expect (suffixes '()) '())
(check-expect
 (suffixes (list "a")) (list (list "a")))
(check-expect
 (suffixes (list "a" "b"))
 (list (list "b") (list "a" "b")))
(check-expect
 (suffixes (list "a" "b" "c"))
 (list (list "c") (list "b" "c") (list "a" "b" "c")))

(define (suffixes lo1s)
  (reverse (suffixes-proper lo1s)))

; List-of-1Strings -> List-of-1Strings
; produces suffixes
(define (suffixes-proper lo1s)
  (cond
    [(empty? lo1s) '()]
    [else
     (cons (cons (first lo1s) (rest lo1s))
           (suffixes-proper (rest lo1s)))]))


(suffixes (list "a" "b" "c"))