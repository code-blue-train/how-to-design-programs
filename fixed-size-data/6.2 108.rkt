;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |6.2 108|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)


; pedestrian crossing light world program
; world program that implements a pedestrian traffic light
; default state is a pedestrian light that shows an orange person standing on red background
; alternate state is a green person walking which lasts for 10 seconds; once 10 seconds is reached
; the light displays the digits 9, 8, ... 0 with odd numbers colored orange and even numbers colored
; green. when the countdown reaches 0, the light switches to its default state.
; the light switches from its default state when you press the space bar on your keyboard;
; all other transitions are reactions to clock ticks

; image constants
(define WALK (bitmap "walk-person.png"))
(define STOP (bitmap "stop-person-1.png"))

(define COUNTDOWN 20)

(define BLACK-BACKGROUND
  (rectangle 68 80 "solid" "black"))

(define BB-WIDTH
  (image-width BLACK-BACKGROUND))

(define RED-BACKGROUND
  (rectangle 68 80 "solid" "red"))

(define STOP-BACKGROUND
  (place-image
   STOP
   35 40
   RED-BACKGROUND))

; WALK image overlayed on the BLACK-BACKGROUND
(define WALK-BB
  (overlay/align
    "center" "middle"
    WALK
    BLACK-BACKGROUND))

; Ped-xing-light is a structure
; state is STRING stop or walk and a number that indicates the countdown to change state
; walk has a countdown = COUNTDOWN and stop doesn't have a countdown so set to 0
; (make-ped-xing-light String Number)
; (make-ped-xing-light "walk" 20)
(define-struct ped-xing-light [state countdown])
; test structures
(define struct-walk (make-ped-xing-light "walk" COUNTDOWN))
(define struct-stop (make-ped-xing-light "stop" 0))

; Ped-xing-light -> Image
; intepretation consumes structure ped-xing-light pxl and produces an image
; either rendering the stop state's image or the walk state's image
(check-expect (render struct-walk)
  (overlay/xy
   (overlay/align
    "center" "middle"
    WALK
    BLACK-BACKGROUND)
   (image-width BLACK-BACKGROUND) 0
   (overlay/align
    "center" "middle"
    WALK
    BLACK-BACKGROUND)))
(check-expect (render struct-stop)
              (overlay/xy
               STOP-BACKGROUND
               (image-width STOP-BACKGROUND) 0
               STOP-BACKGROUND))
              
(define (render pxl)
  (cond
    [(string=? (ped-xing-light-state pxl) "walk") (render-walk pxl)]
    [(string=? (ped-xing-light-state pxl) "stop") (render-stop pxl)]
    ))

; Number Color -> Image
; intepreation consumes a number and color and renders a text image with that number
; in that color on a black background
(check-expect (render-number "8" "orange")
                (overlay/align
                 "center" "middle"
                 (text "8" 48 "orange")
                 BLACK-BACKGROUND))

(define (render-number n color)
  (overlay/align
   "center" "middle"
   (text n 48 color)
   BLACK-BACKGROUND))
  

; Ped-xing-light KeyEvent -> Ped-xing-light
; intepretation consumes a ped-xing-light pxl and keyevent ke and returns a ped-xing-light
; if pxl is stop and key event is space bar " " then return ped-xing-light walk COUNTDOWN
; else return pxl
(check-expect (key-event (make-ped-xing-light "stop" 0) "a")
              (make-ped-xing-light "stop" 0))
(check-expect (key-event (make-ped-xing-light "stop" 0) " ")
              (make-ped-xing-light "walk" COUNTDOWN))
(check-expect (key-event (make-ped-xing-light "walk" 19) " ")
              (make-ped-xing-light "walk" 19))
(check-expect (key-event (make-ped-xing-light "walk" 10) "a")
              (make-ped-xing-light "walk" 10))

(define (key-event pxl ke)
  (cond
    [(and (string=? " " ke) (string=? (ped-xing-light-state pxl) "stop"))
     (make-ped-xing-light "walk" COUNTDOWN)]
    [else pxl]
    ))

; Ped-xing-light -> Image
; intepretation consumes ped-xing-light pxl struct and returns an image that
; renders a person walking
; when state change is 10 seconds away, render walk and countdown image, with
; odd numbers colored orange and even numbers color3ed green
(check-expect (render-walk (make-ped-xing-light "walk" 20))
              (overlay/xy
               WALK-BB
               BB-WIDTH 0
               WALK-BB))
(check-expect (render-walk (make-ped-xing-light "walk" 9))
              (overlay/xy
               WALK-BB
               BB-WIDTH 0
               (render-number
                (number->string (ped-xing-light-countdown (make-ped-xing-light "walk" 9))) "orange")
               ))
(check-expect (render-walk (make-ped-xing-light "walk" 6))
              (overlay/xy
               WALK-BB
               BB-WIDTH 0
               (render-number
                (number->string (ped-xing-light-countdown (make-ped-xing-light "walk" 6))) "green")
               ))
(define (render-walk pxl)
  (if (and (>= (ped-xing-light-countdown pxl) 10)
         (<= (ped-xing-light-countdown pxl) COUNTDOWN))
        (overlay/xy
         WALK-BB
         BB-WIDTH 0
         WALK-BB)
        (cond
         [(= (modulo (ped-xing-light-countdown pxl) 2) 1)
          (overlay/xy
           WALK-BB
           BB-WIDTH 0
           (render-number (number->string (ped-xing-light-countdown pxl)) "orange"))
          ]
         [(= (modulo (ped-xing-light-countdown pxl) 2) 0)
          (overlay/xy
           WALK-BB
           BB-WIDTH 0
           (render-number (number->string (ped-xing-light-countdown pxl)) "green"))
          ]
         )
        ))
         
; Ped-xing-light -> Image
; intepretation consumes ped-xing-light pxl struct and returns an image
; that renders a person stopped against a red background
(check-expect (render-stop struct-stop)
              (overlay/xy
               STOP-BACKGROUND
               (image-width STOP-BACKGROUND) 0
               STOP-BACKGROUND))

(define (render-stop pxl)
  (overlay/xy
   STOP-BACKGROUND
   (image-width STOP-BACKGROUND) 0
   STOP-BACKGROUND))

; Ped-xing-light -> Ped-xing-light
; intepretation consumes ped-xing-light pxl struct and when
; input struct is walk, subtract 1 from the countdown for each clock tick
; when the countdown is below 10 render countdown on walk image
(check-expect (tock (make-ped-xing-light "walk" 20))
              (make-ped-xing-light "walk" 19))
(check-expect (tock (make-ped-xing-light "walk" 0))
              (make-ped-xing-light "stop" 0))
(check-expect (tock (make-ped-xing-light "walk" 1))
              (make-ped-xing-light "walk" 0))
                    
(define (tock pxl)
  (cond
    [(and
      (string=? (ped-xing-light-state pxl) "walk")
      (> (ped-xing-light-countdown pxl) 0))
     (make-ped-xing-light "walk" (- (ped-xing-light-countdown pxl) 1))]
    [else (make-ped-xing-light "stop" 0)]
    ))

; WorldState is Ped-xing-light pxl
; (ped-xing (make-ped-xing-light "stop" 0))
(define (ped-xing pxl)
  (big-bang pxl
    [on-tick tock 1]
    [on-draw render]
    [on-key key-event]
    ))
     