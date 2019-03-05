;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.7 Ex 62|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")

; A DoorState is one of:
; - LOCKED
; - CLOSED
; - OPEN

; DoorState -> DoorState
; closes an open door over the period of one tick
(check-expect (door-closer LOCKED) LOCKED)
(check-expect (door-closer CLOSED) CLOSED)
(check-expect (door-closer OPEN) CLOSED)

(define (door-closer state-of-door)
  (cond
    [(string=? state-of-door LOCKED) LOCKED]
    [(string=? state-of-door CLOSED) CLOSED]
    [(string=? state-of-door OPEN) CLOSED]))

; DoorState KeyEvent -> DoorState
; turns key event ke into an action on state state-of-door
(check-expect (door-action LOCKED "u") CLOSED)
(check-expect (door-action CLOSED " ") OPEN)
(check-expect (door-action CLOSED "l") LOCKED)
(check-expect (door-action OPEN "a") OPEN)
(check-expect (door-action CLOSED "a") CLOSED)

(define (door-action state-of-door ke)
  (cond
    [(and (string=? state-of-door LOCKED) (string=? ke "u")) CLOSED]
    [(and (string=? state-of-door CLOSED) (string=? ke " ")) OPEN]
    [(and (string=? state-of-door CLOSED) (string=? ke "l")) LOCKED]
    [else state-of-door]))

; DoorState -> Image
; translates the state state-of-door into a text image
(check-expect (door-render CLOSED)
              (text CLOSED 40 "red"))
(define (door-render state-of-door)
  (text state-of-door 40 "red"))

; DoorState -> DoorState
; simulates a door with an automatic door closer
(define (door-simulation initial-state)
  (big-bang initial-state
    [on-tick door-closer 3]
    [on-key door-action]
    [to-draw door-render]))