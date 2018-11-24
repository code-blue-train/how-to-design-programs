;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.6 Ex 72|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct phone# [area switch num])
; A phone# is a structure:
;  (make-phone# String String String)
; intepretation a phone number with an area code (000-999),
; the exchange (000-999) and number (0000-9999)