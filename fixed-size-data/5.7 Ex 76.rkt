;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.7 Ex 76|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; Movie is (make-movie String String String)
(define-struct movie [title producer year])

; Person is (make-person String String String String)
(define-struct person [name hair eyes phone])

; Pet is (make-pet String String)
(define-struct pet [name number])

; A CD is (make-CD String String Number)
(define-struct CD [artist title price])

; A Sweather is (make-sweater String String String)
(define-struct sweater [material size producer])