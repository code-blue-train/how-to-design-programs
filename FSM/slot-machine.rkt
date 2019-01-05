;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname slot-machine) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; World Program - slot machine
; machine that, when space bar is pressed,
; randomly selects a number between 0 and 9 and renders
; that number on an image
; there are 3 random numbers generated
; render a WINNER! message if all 3 numbers match and LOSER! if numbers don't match

; constants
; images

(define MTSQR
  (square 50 "outline" "red"))

(define TEXT-BOX
  (text "8" 36 "red"))

(define TEMPLATE
  (overlay/align "center" "middle"
                 TEXT-BOX
                 MTSQR))

(define TEMPLATE-WIDTH (image-width TEMPLATE))
(define TEMPLATE-HEIGHT (image-height TEMPLATE))

(define DISPLAY
  (overlay/xy
   TEMPLATE
   TEMPLATE-WIDTH 0
   (overlay/xy
    TEMPLATE
    TEMPLATE-WIDTH 0
    TEMPLATE)))

(define MESSAGE-BOX
  (rectangle (image-width DISPLAY) (/ (image-height DISPLAY) 2) "solid" "red"))

(define MESSAGE-TEXT
  (text "LOSER!" 16 "black"))

(define MESSAGE
  (overlay/align
   "center" "center"
   MESSAGE-TEXT
   MESSAGE-BOX))

(define SLOT-MACHINE
  (overlay/xy
   DISPLAY
   0 (image-height DISPLAY)
   MESSAGE))

; slot symbol constants

(define RANDOM-ITER 100)

; wish list
; data structure(s) for slot-machine
; function that takes a message and renders it
; function that takes a number and renders it in a a square
; function that takes a space bar and starts the slot-machine
; randomly select a number within a range for x iterations for each clock tick
; - default clock tick for big-bang is 28 times per second
; - maybe 100 random number iterations to start


; Slot is a structure
; (make-slot Number Number String)
; (make-slot [s i state])
; where s is a number between 1 and 3 that represents the number symbol display
; and i is the number of random number generator iterations
; and s is the state of the machine: ready and running
(define-struct slot [s i state])
(define slot-0 (make-slot 0 RANDOM-ITER "ready"))
(define slot-1 (make-slot 1`RANDOM-ITER "executing"))
(define slot-2 (make-slot 2`RANDOM-ITER "executing"))
(define slot-3 (make-slot 3`RANDOM-ITER "executing"))

; Slot -> Slot
; interpretation consumes slot s and returns a random number
(define (gen-random s)
  (... (slot-s s) ... (slot-i s) ...))

; Slot String -> Slot
(define (key-event s k) s)

; Slot -> Slot
; intepretation consumes slot s and when state is executing returns a random number
; for the slot i
(define (tock s)
  (cond
    [(string=? (slot-state s) "executing")
    (cond
      [(and (= (slot-s s) 1) (> (slot-i s) 0)) (gen-random s)]
      [(and (= (slot-s s) 2) (> (slot-i s) 0)) (gen-random s)]
      [(and (= (slot-s s) 3) (> (slot-i s) 0)) (gen-random s)]
      )]
    [else (make-slot 0 RANDOM-ITER "ready")]
  ))

; Slot -> Image
(define (render s) SLOT-MACHINE)

(define (slot-machine s)
  (big-bang s
    [to-draw render]
    [on-tick tock]
    [on-key key-event]
    ))
