;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |130|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; exercise 130. Create an element of List-of-names that contains five Strings. 4
; Sketch a box representation of the list
; similar to those found in figure 44.

(cons "Don Juan"
      (cons "Sally Fields"
            (cons "Ben Franklin"
                  (cons "Angela Merkel"
                        (cons "Barrak Obama"
                              '())))))


Explain why
(cons "1" (cons "2" '()))

is an element of List-of-names and why (cons 2 '()) isn’t.

List-of-names definitions requires elements in the list to be strings
 and 2 is a number