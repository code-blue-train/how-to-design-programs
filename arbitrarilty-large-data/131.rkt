;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |131|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 131. Provide a data definition for representing lists of Boolean values.
;The class contains all arbitrarily long lists of Booleans.

; A List-of-booleans
; - '()
; - (cons Boolean List-of-booleans)
; intepretation a list of booleans