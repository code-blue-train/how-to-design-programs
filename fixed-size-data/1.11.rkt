;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define (u-square x)
  (* x x))

(define (cube x)
  (* x x x))

; exercise 11
(define (compute-distance x y)
  (sqrt (+ (u-square x) (u-square y))))

; exercise 12
(define (cvolume x)
  (* (cube x)))

(define (csurface x)
  (* 6 (* x x)))

; exercise 13
(define (string-first x)
  (if (string? x)
      (substring x 0 1)
      "input must be a string"))

;exercise 14
(define (string-last x)
  (if (string? x)
      (substring x (- (string-length x) 1) (string-length x))
      "input must be a string"))

; exercise 15
(define (==> sunny friday)
  (if (or (equal? sunny #false) (equal? friday #true)) #true #false))

; exercise 16
(define (image-area x)
  (if (image? x)
      (* (image-height x) (image-width x))
      "input not an image"
      ))

; exercise 17
(define (image-classify x)
  (if (image? x)
      (cond
        ((equal? (image-height x) (image-width x)) "square")
        ((> (image-height x) (image-width x)) "tall")
        ((< (image-height x) (image-width x)) "wide")
        )
      "input not an image")
  )

; exercise 18
(define (string-join a b)
  (if
   (and (string? a) (string? b))
    (string-append a "_" b)
    "inputs must be strings"
    )
  )

; exercise 19
(define (string-insert str i)
  (string-append
   (substring str 0 i)
   "_"
   (substring str i)
   )
  )

; exercise 20
(define (string-delete str i)
  (string-append
   (substring str 0 (- i 1))
   (substring str i)
   )
  )
              