;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.8 Ex 80|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; Function that computes the distance of objects
; in a 3D space to the origin
; Consumes a 3D position and computes the distance to the origin [0 0 0]


; A 3D-posn is a structure
;  (make-3D-posn Number Number Number)
; 3D-posn-x is a number between 0 (origin) and the max x-axis of the space
; 3D-posn-y is a number between 0 (origin) and the max y-axis of the space
; 3D-posn-x is a number between 0 (origin) and the max z-axis of the space
(define-struct 3D-posn [x y z])
; Examples:
(define ex1 (make-3D-posn 0 0 0))
(define ex2 (make-3D-posn 50 50 50))

; Function examples as unit tests:
; Constant: max dimesions of 3D space are [100 100 50]
(check-expect (3D-distance-to-0 (make-3D-posn 0 0 0)) 0)
(check-expect (3D-distance-to-0 (make-3D-posn 50 50 25)) 75)
(check-expect (3D-distance-to-0 (make-3D-posn 100 100 50)) 150)
(define (3D-distance-to-0 p)
  (sqrt (+ (sqr (3D-posn-x p)) (sqr (3D-posn-y p)) (sqr (3D-posn-z p)))))

; template examples for functions
(define-struct movie [title director year])
(define (consume-movie a)
  (... (movie-title a) ... (movie-director a) ... (movie-year a) ...))

(define-struct pet [name number])
(define (consume-pet a)
  (... (pet-name a) ... (pet-number a) ... ))

(define-struct CD [artist title price])
(define (consume-CD a)
  (... (CD-artist a) ... (CD-title a) ... (CD-price a) ...))

(define-struct sweater [material size color])
(define (consume-sweater a)
  (... (sweater-material a) ... (sweater-size a) ... (sweater-color a) ...))