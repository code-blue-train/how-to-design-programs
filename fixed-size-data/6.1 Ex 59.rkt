;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.1 Ex 59|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; A SIGS is one of 2 structures:
;   (make-aim Posn Number)
;   (make-fired Posn Number Posn)
; intepretation represetnsthe complete state of a space invader game

; scene constants
(define WIDTH 300) ; distances in terms of pixels 
(define HEIGHT 200)
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))

; tank constants
(define TANK
  (rectangle (/ WIDTH 8) (/ HEIGHT 8) "solid" "black"))
(define TANK-START-POS 0)
(define TANK-WIDTH (image-width TANK))
(define TANK-HEIGHT (image-height TANK))
(define TANK-Y-POS (- HEIGHT (/ TANK-HEIGHT 2)))

; ufo constants
(define UFO
  (overlay/offset
   (circle (/ HEIGHT 18) "solid" "green")
   0 10
   (ellipse (/ WIDTH 8) (/ HEIGHT 8) "solid" "green")))
(define UF0-WIDTH (image-width UFO))
(define UFO-HEIGHT (image-height UFO))
(define UFO-START (make-posn (/ WIDTH 2) UFO-HEIGHT))

; missle contants
(define MISSLE
  (rectangle (/ TANK-WIDTH 8) (/ TANK-HEIGHT 2) "solid" "red"))

(define START-SCENE-EXAMPLE
   (place-image
    TANK
    50 (- HEIGHT (/ TANK-HEIGHT 2))
    (place-image
     UFO
     (/ WIDTH 2) 50
     (place-image
      MISSLE 
      50 50
      MTSCN))))

; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
 
(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 
 
; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place

; Aim is structure
; (define (make-aim Posn Number))
; intepretation:
; - aim-ufo is a posn that represents the x/y coordinates of the ufo
; - aim-tank is a number that represetns the x coordinate of the tank and the tank's velocity
(define-struct aim [ufo tank])

; Fired is structure
; (define (make-fired Posn Number Posn))
; intepretation:
; - fired-ufo is a posn that represents the x/y coordinates of the ufo
; - fired-tank is a number that represetns the x coordinate of the tank and the tank's velocity
; - fired-missle is a posn that represents the x/y coordinate of the missle
(define-struct fired [ufo tank missle])

; test data structures
(define ma1 (make-aim
             (make-posn 10 20)
             (make-tank 28 -3)))
(define mf1 (make-fired
             (make-posn 20 100)
             (make-tank 100 3)
             (make-posn 22 130)))
(define mf2 (make-fired
             (make-posn 10 20)
             (make-tank 28 -3)
             (make-posn 32 (- HEIGHT TANK-HEIGHT 10))))
; wish list
; tank-move
; ufo-move
; missle-fire
; missle-move
; missle-render

; tank-render
; Tank Image -> Image
; adds t to the given image im
(check-expect (tank-render
               (make-tank 28 -3) MTSCN)
              (place-image
               TANK
               28 TANK-Y-POS
               MTSCN))
(define (tank-render u im)
  (place-image
   TANK
   (tank-loc u) TANK-Y-POS
   im))

; ufo-render
; Ufo Image -> Image
; adds u to the given image im
(check-expect (ufo-render (make-posn 100 100) MTSCN)
               (place-image UFO 100 100 MTSCN))
(define (ufo-render u im)
  (place-image
   UFO
   (posn-x u) (posn-y u)
   im))

; missle-render
; Missle Image -> Image
; adds m to the given image im
(check-expect (missle-render (make-posn 50 50) MTSCN)
              (place-image MISSLE 50 50 MTSCN))
(define (missle-render m im)
  (place-image
   MISSLE
   (posn-x m) (posn-y m)
   im))

; Tank -> Tank
; consumes Tank and moves tank across the scene on the x-axis by the tank's velocity
(check-expect (move-tank (make-tank 150 -3)) (make-tank 147 -3))
(check-expect (move-tank (make-tank 0 3)) (make-tank 3 3))
(define (move-tank t) t)

; Posn -> Ufo
; consumes ufo pson and returns ufo pson
; with the ufo in the same pson-x moved and posn-y plus 1 pixel (down the scene)
(check-expect (move-ufo (make-posn 100 50)) (make-posn 100 49))
(check-expect (move-ufo (make-posn 50 HEIGHT)) (make-posn 50 HEIGHT))
(define (move-ufo u) u)

; SIGS -> Image
; adds TANK, UFO, and possibly MISSLE to
; the BACKGROUND scene
;(check-expect (si-render mf1)
(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                   (ufo-render (aim-ufo s) MTSCN))]
    [(fired? s)
     (tank-render (fired-tank s)
               (ufo-render (fired-ufo s)
               (missle-render (fired-missle s) MTSCN)))]))

; Ufo Missle -> Number
; consumes a ufo and missle returns a number repesenting how close
; the missle is to the ufo
(define (ufo-missle-proximity u m) 0)

; Ufo -> Number
; consumes a ufo and returns a number representing how close
; the ufo's y-coordinare is to the IMAGE-HEIGHT
(define (ufo-imh-proximity u) 0)

; SIGS -> Boolean
; Stops game if the UFO lands or if the missle hits the UFO
(define (si-game-over? s)
  (cond
    [(or (<= (ufo-missle-proximity
          (fired-ufo s)
          (fired-missle s)) 10)
         (= (ufo-imh-proximity (fired-ufo s)) HEIGHT)) #true]
    [else #false]))
; ufo reaches bottom of scene
; add line to force change
