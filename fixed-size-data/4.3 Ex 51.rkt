;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.3 Ex 51|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; exercise 51
; Simulate a traffic light for a given duration

; constant
(define LIGHT
  (circle 10 "solid" "red"))

; TrafficLight -> Image
; Number -> Image
; renders state of TrafficLight as a solid circle
; interprets state tl to change the image
(define (render tl)
  (cond
    [(and (>= tl 0) (<= tl 100)) (circle 10 "solid" (traffic-light-next "yellow"))]
    [(and (>= tl 101) (<= tl 200)) (circle 10 "solid" (traffic-light-next "red"))]
    [(and (>= tl 201) (<= tl 300)) (circle 10 "solid" (traffic-light-next "green"))]
    ))

; TrafficLight -> Number
; Number -> Number
; inteprets number tl and adds 1 per clock tick
(define (tock tl)
  (+ tl 1))

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "yellow") "red")
(check-expect (traffic-light-next "green") "yellow")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; TrafficLight -> TrafficLight
; launches the program
(define (traffic-light tl)
  (big-bang tl
    [on-tick tock]
    [to-draw render]
    ))
                       