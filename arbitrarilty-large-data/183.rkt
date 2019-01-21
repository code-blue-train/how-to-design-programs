;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |183|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 183. On some occasions lists are formed with cons and list.

(check-expect
 (list "a" 0 #false)
 (cons "a" (list 0 #false)))

(check-expect
 (cons
  (cons 1 (cons 13 '())) '())
(list (cons 1 (cons 13 '()))))

(check-expect
 (list
  (list 1
        (list 13 '())))
 (cons (list 1 (list 13 '())) '()))

(check-expect (cons '() (cons '() (cons (cons 1 '()) '())))
 (list '() '() (cons 1 '())))

(check-expect
 (list "a"
       (list 1)
             #false '())                 
 (cons "a" (cons (list 1) (list #false '()))))

;Reformulate each of the following expressions using only cons or only list.