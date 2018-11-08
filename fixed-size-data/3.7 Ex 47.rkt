;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.7 Ex 47|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; exercise 47 "happiness gauge"
; WorldState -> Number
; inteprets WorldState as a number ws
;

; constants for scene and gauge

; background scene dimensions
(define BACKGROUND-HEIGHT 50)

(define BACKGROUND-WIDTH 100)

(define BACKGROUND
  (rectangle BACKGROUND-WIDTH BACKGROUND-HEIGHT "solid" "black"))

; gauge dimensions start the same as the background
(define GAUGE
  (rectangle BACKGROUND-WIDTH BACKGROUND-HEIGHT "solid" "red"))


; WorldState -> Number
; for each Number ws, decrease the gauge by .1

(define (tock ws)
  (- ws .1))

; WorldState -> Image

(define (render ws)
  (overlay/align
   "left"
   "middle"
   (rectangle
    (+ 0 ws)
    BACKGROUND-HEIGHT "solid" "red")
    BACKGROUND))

(define (kh ws ke)
  (cond
    [(string=? "down" ke) (if
                           (>= ws 80)
                           100
                           (* 1.2 ws))]
    [(string=? "up" ke) (if
                         (>= ws 66)
                         100
                         (* 1.3 ws))]
    ))

; WorldState -> WorldState
; launches the program from some initial state
(define (gauge-prog ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [on-key kh]
    ))

 