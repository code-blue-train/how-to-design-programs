; Fixed Size Data section 3.2
(require 2htdp/image)
(require 2htdp/universe)

; exercise 34

; String -> String
; extract first letter from s
; given:
;   "first" for s
; expected:
;   "f"
(define (string-first s)
  (substring s 0 1))

; exercise 35

; String -> String
; extract last letter from s
; given:
;   "last" for s
; expect:
;   "t"
(define (string-last s)
  (substring s (- (string-length s) 1)))

; exercise 36

; Image -> Number
; compute the number of pixels in image img
; uses sqr function
; given:
;   (square 10 "solid" "orange")
; expect:
;   100
; given:
;   . (square 25 "solid" "red")
;expect:
;   625
(define (image-area img)
  (sqr (image-width img)))

; exercise 37

; String -> String
; compute a string with the first letter of string s removed
; given:
;   "test"
; expected:
;   "est"
(define (string-rest s)
  (substring s 1))

; exercise 38
; String -> String
; compute a string with the last letter of string s removed
; given:
;   "test"
;   "miles davis"
;expected:
;   "tes"
;   "miles davi"
(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))