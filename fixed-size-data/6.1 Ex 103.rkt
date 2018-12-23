;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.1 Ex 103|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; Za-dim is a structure to define 3 dimensional space for zoo animals
; (make-space Number Number Number)
(define-struct za-dim [h w l])

; Cage is a structure to define the 3 dimensions (height h, width w, and length l)
; of a cage
(define-struct cage [h w l])
; (make-cage Number Number Number)
(define cage-1 (make-cage 10 10 10))

; Spider is a structure
; (make-spider Space)
(define-struct spider [legs za-dim])
(define spider-1 (make-spider 4 (make-za-dim 1 1 1)))

; Elephant is a structure
; (make-elephant Space)
(define-struct elephant [za-dim])
(define elephant-1 (make-elephant (make-za-dim 8 5 6)))

; Boa-constrictor is a structure
; (make boa-constrictor Space)
(define-struct boa-constrictor [za-dim])
(define boa-constrictor-1 (make-boa-constrictor (make-za-dim 1 1 10)))

; Armadillo is a structure
; (make-armadillo Space]
(define-struct armadillo [za-dim])
(define armadillo-1 (make-armadillo (make-za-dim 1 1 2)))

; Zoo Animals -> Zoo Animals
; template for a function that consumes azoo animals and returns a zoo animal
(define (zoo-animals za)
  (cond
    [(spider? za) za]
    [(elephant? za) za]
    [(boa-constrictor? za) za]
    [(armadillo? za) za]))

; za-dim -> Number
; consumes za-dim and returns a number
; calculates the volume of the zoo animal (h * w * l)
(check-expect (za-volume (make-za-dim 1 1 1)) 1)
(check-expect (za-volume (make-za-dim 1 2 3)) 6)
(check-expect (za-volume (make-za-dim 10 5 2)) 100)
(define (za-volume c)
  (* (za-dim-h c) (za-dim-w c) (za-dim-l c)))

; Za-dim Cage -> Boolean
; intepretation compares the dimensions of a zoo animals dimensions za-dim and
; a cage
; if any of the dimensions of the zoo animal are less than the dimensions of
; the cage than return #false
; otherwise return #true
(check-expect (za-cage-fits? (make-za-dim 1 1 1) (make-cage 1 1 1)) #false)
(check-expect (za-cage-fits? (make-za-dim 4 3 2) (make-cage 5 4 3)) #true)
(check-expect (za-cage-fits? (make-za-dim 1 2 3) (make-cage 1 2 2)) #false)
(define (za-cage-fits? zad c)
  (or
   (< (za-dim-h zad) (cage-h c))
   (< (za-dim-w zad) (cage-w c))
   (< (za-dim-l zad) (cage-l c))))

; Zoo Animal Cage -> Boolean
; intepretation consumes zoo animal za and cage c
; and returns #true if the zoo animals dimensions are less than
; the dimensions of the cage
; to determine volume of container required for animal
; (* h w l)
(check-expect (fits? spider-1 (make-cage 5 5 5)) #true)
(check-expect (fits? elephant-1 (make-cage 100 100 100)) #true)
(check-expect (fits? boa-constrictor-1 (make-cage 1 1 1)) #false)
(check-expect (fits? armadillo-1 (make-cage 1 1 1)) #false)
(define (fits? za c)
  (cond
    [(spider? za) (za-cage-fits? (spider-za-dim za) c)]
    [(elephant? za) (za-cage-fits? (elephant-za-dim za) c)]
    [(boa-constrictor? za) (za-cage-fits? (boa-constrictor-za-dim za) c)]
    [(armadillo? za) (za-cage-fits? (armadillo-za-dim za) c)]))

