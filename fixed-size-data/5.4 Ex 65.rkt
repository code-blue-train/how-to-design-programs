;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.4 Ex 65|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct movie [title producer year])
;constructor
(define (make-movie title producer year)
  (title producer year))
;selector
(define (movie-title title)
  title)
(define (moviep-roducer producer)
  producer)
(define (movie-year year)
  year)
;structure predicate
(define (movie? a)
  #true)

;(define-struct person [name hair eyes phone])
; constructor
(define (make-person name hair eyes phone)
  name hair eyes phone)
;selector
(define (person-name name)
  name)
(define (person-hair hair)
  hair)
(define (person-eyes eyes)
  eyes)
(define (person-phone phone)
  phone)
;structure predicate
(define (person? a)
  #true)

(define-struct pet [name number])
;constructor
(define (make-pet name number)
  name number)
;selector
(define (pet-name name)
  name)
(define (pet-number number)
  number)
; structure predicate
(define (pet? a)
  #true)

(define-struct CD [artist title price])
; constructor
(define (make-CD artist title price)
  artist title price)
; selector
(define (CD-artist artist)
  artist)
(define (CD-title title)
  title)
(define (CD-price price)
  price)
; structure predicate
(define (CD? a)
  #true)

(define-struct sweater [material size producer])
; constructor
(define (make-sweater material size producer)
  material size producer)
; selector
(define (sweater-material material)
  material)
(define (sweater-size size)
  size)
(define (sweater-producer producer)
  producer)
; structure predicate
(define (sweater? a)
  #true)
                         
                    