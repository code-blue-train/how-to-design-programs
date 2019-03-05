;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.7 Ex 61|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; An N-TrafficLight is one of:
; - 0 interpretation the traffic light shows red
; - 1 interpretation the traffic light shows green
; - 2 interpretation the traffic light shows yellow

; constants for TrafficLight image
(define MTSCN (empty-scene 90 30))
(define MTSCN-WIDTH (image-width MTSCN))
(define MTSCN-WIDTH-THIRDS (/ (image-width MTSCN) 3))
(define MTSCN-HEIGHT-HALF (/ (image-height MTSCN) 2))


; String -> Image
; produces a circle image with a mode of outline or solid based on x
(define (red-light x)
  (circle 10 x "red"))
(define (yellow-light x)
  (circle 10 x "yellow"))
(define (green-light x)
  (circle 10 x "green"))

(define RED-LIGHT
       (place-image
        (red-light "solid")
        (- MTSCN-WIDTH-THIRDS (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
        (place-image
         (yellow-light "outline")
         (+ MTSCN-WIDTH-THIRDS (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
         (place-image
          (green-light "outline")
          (- MTSCN-WIDTH (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
          MTSCN))))

(define YELLOW-LIGHT
       (place-image
        (red-light "outline")
        (- MTSCN-WIDTH-THIRDS (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
        (place-image
         (yellow-light "solid")
         (+ MTSCN-WIDTH-THIRDS (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
         (place-image
          (green-light "outline")
          (- MTSCN-WIDTH (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
          MTSCN))))

(define GREEN-LIGHT
       (place-image
        (red-light "outline")
        (- MTSCN-WIDTH-THIRDS (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
        (place-image
         (yellow-light "outline")
         (+ MTSCN-WIDTH-THIRDS (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
         (place-image
          (green-light "solid")
          (- MTSCN-WIDTH (/ MTSCN-WIDTH-THIRDS 2)) MTSCN-HEIGHT-HALF
          MTSCN))))

(define RED 0)
(define GREEN 1)
(define YELLOW 2)

; An S-TrafficLight is one of:
; - RED
; - GREEN
; - YELLOW

; TrafficLight -> TrafficLight
; yield the next state, give current state cs
(check-expect (tl-next "red") "green")
(check-expect (tl-next "green") "yellow")
(check-expect (tl-next "yellow") "red")

(define (tl-next cs)
  (cond
    [(string=? cs "red") "green"]
    [(string=? cs "green") "yellow"]
    [(string=? cs "yellow") "red"]))

; N-TrafficLight -> N-TrafficLight
; yield the next state, given current state cs
(check-expect (tl-next-numeric 0) 1)
(check-expect (tl-next-numeric 1) 2)
(check-expect (tl-next-numeric 2) 0)
(check-expect (tl-next-numeric 100) 2)

(define (tl-next-numeric cs)
  (modulo (+ cs 1) 3))

; S-TrafficLight -> S-TrafficLight
; yields the next state, given current state cs
(define (tl-next-symbolic cs)
  (cond
    [(equal? cs RED) GREEN]
    [(equal? cs GREEN) YELLOW]
    [(equal? cs YELLOW) RED]))



; TrafficLight -> Image
; renders the current state cs as an image
(check-expect (tl-render "red") RED-LIGHT)
(check-expect (tl-render "yellow") YELLOW-LIGHT)
(check-expect (tl-render "green") GREEN-LIGHT)

(define (tl-render current-state)
  (cond
    [(string=? current-state "red") RED-LIGHT]
    [(string=? current-state "yellow") YELLOW-LIGHT]
    [(string=? current-state "green") GREEN-LIGHT]))


; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))

