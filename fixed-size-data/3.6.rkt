;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A WorldState is a Number
; intepretation is the number of pixels between
; the left border of the scene and the car

; Wish list:
; WorldState -> WorldState
; for each tick of the clock, big-bang obtains the next 
; state of the world from (clock-tick-handler cw) 
(define (clock-tick-handler cw) ...)
 
; WorldState String -> WorldState 
; for each keystroke, big-bang obtains the next state 
; from (keystroke-handler cw ke); ke represents the key
(define (keystroke-handler cw ke) ...)
 
; WorldState Number Number String -> WorldState 
; for each mouse gesture, big-bang obtains the next state
; from (mouse-event-handler cw x y me) where x and y are
; the coordinates of the event and me is its description 
(define (mouse-event-handler cw x y me) ...)
 
; WorldState -> Boolean
; after each event, big-bang evaluates (end? cw) 
;(define (end? cw) ...)
; Wish list end

; constants to represent the car and scene
; changing WHEEL-RADIUS will change the dimensions of the CAR and SCENE
; exercise 39
(define WHEEL-RADIUS 21)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
 ; (rectangle 10 WHEEL-RADIUS "solid" "white"))
  (rectangle (* WHEEL-RADIUS 2) WHEEL-RADIUS "solid" "white"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CAR-OUTLINE "solid")
(define CAR-COLOR "red")

(define CAR-BODY
  ;(rectangle 40 10 CAR-OUTLINE CAR-COLOR))
  (rectangle (* WHEEL-RADIUS 8) (* WHEEL-RADIUS 2) CAR-OUTLINE CAR-COLOR))

(define CAR-TOP
  ;(rectangle 20 10 CAR-OUTLINE CAR-COLOR))
  (rectangle (* WHEEL-RADIUS 4) (* WHEEL-RADIUS 2) CAR-OUTLINE CAR-COLOR))

(define CAR
  ;(overlay/xy BOTH-WHEELS -5 -10
  ;            (overlay/xy CAR-TOP -10 5 CAR-BODY)))
  (overlay/xy BOTH-WHEELS (* WHEEL-RADIUS -1) (* WHEEL-RADIUS -2)
              (overlay/xy CAR-TOP (* WHEEL-RADIUS -2) WHEEL-RADIUS CAR-BODY)))

(define SCENE
  (empty-scene (* WHEEL-RADIUS 40) (* WHEEL-RADIUS 6)))

(define (BACKGROUND x)
   ;(place-image CAR (+ 20 x) 20 (empty-scene 200 30)))
  (place-image CAR (+ (* WHEEL-RADIUS 4)  x) (* WHEEL-RADIUS 4)
               ;(empty-scene (* WHEEL-RADIUS 40) (* WHEEL-RADIUS 6))))
               SCENE))




; WorldState -> Number
; stops the car when it reaches the end of the emtpy scene
(define (end? cw)
  (if (= cw (- (image-width SCENE) (image-width CAR)))
      #true
      #false))

; WorldState -> Image
; places the image of the car x pixels from
; the left margin of the BACKGROUND image
(define (render x)
  (BACKGROUND x))

; WorldState -> WorldState
; adds 3 to x to move the car right
(define (tock x)
  (+ x 2))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [stop-when end?]
    [to-draw render]
    ))