;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |158|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)
;Sample Problem Design a world program that simulates firing shots.
;Every time the “player” hits the space bar, the program adds a shot to the bottom of the canvas.
;These shots rise vertically at the rate of one pixel per tick.

(define HEIGHT 220) ; distances in terms of pixels 
(define WIDTH 30)
(define XSHOTS 10)
 
; graphical constants 
(define BACKGROUND (empty-scene WIDTH HEIGHT "green"))
(define SHOT (rectangle 10 20 "solid" "black"))


; A List-of-shots is one of
; '()
; (cons Shot List-of-shots)
; intepretation the collection of shots fired

; A Shot is a Number
; interpretation represents the shot's y-coordinate

; A ShotWorld is List-of-numbers. 
; interpretation each number on such a list
;   represents the y-coordinate of a shot

; ShotWorld -> Image
; adds the image of a shot for each  y on w 
; at (MID,y} to the background image
(check-expect (to-image (cons 9 '()))
              (place-image SHOT XSHOTS 9 BACKGROUND))
(check-expect (to-image (cons 9 (cons 50 '())))
             (place-image
              SHOT
              XSHOTS 9
              (place-image
               SHOT
               XSHOTS 50
               BACKGROUND)))

; ShotWorld -> ShotWorld
(define (main w0)
  (big-bang w0
    [on-tick tock]
    [on-key keyh]
    [to-draw to-image]))

; exercise 158 Design an alternative tock function that doesn’t just
; move shots one pixel per clock tick but also eliminates those whose
; coordinates place them above the canvas.

; ShotWorld -> ShotWorld
; removes shots from ShotWorld that are no longer
; within the scene (i.e. their y-coordinate is 0)
(check-expect (remove-shot (cons 5 (cons 0 (cons 10 '()))))
              (cons 5 (cons 10 '())))
(define (remove-shot w)
  (remove-all 0 w))


; ShotWorld -> ShotWorld 
; moves each shot up by one pixel
(check-expect (tock (cons 9 (cons 40 '())))
              (cons 8 (cons 39 '())))
(check-expect (tock '()) '())
(define (tock w)
  (cond
    [(empty? w) '()]
    [else (remove-shot (cons (sub1 (first w)) (tock (rest w))))]))
 
; ShotWorld KeyEvent -> ShotWorld 
; adds a shot to the world if the space bar is hit
(check-expect (keyh (cons 9 (cons 10 '())) " ")
              (cons HEIGHT (cons 9 (cons 10 '()))))
(check-expect (keyh '() "a") '())
(define (keyh w ke)
  (if (key=? ke " ") (cons HEIGHT w) w))
 
; ShotWorld -> Image 
; adds each shot y on w at (XSHOTS,y} to BACKGROUND
(define (to-image w)
  (cond
    [(empty? w) BACKGROUND]
    [else (place-image SHOT XSHOTS (first w)
                       (to-image (rest w)))]))
