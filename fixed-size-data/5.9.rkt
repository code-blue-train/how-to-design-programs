;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A SpaceGame is a structure
;  (make-space-game Posn Number)
; intepretation (make-space-game (make-posn ux uy) tx)
; describes a configuration where the UFO is
; at (ux, uy) and the tank's x-coordinate is tx
; and a number that places the tank on the x-axis
(define-struct space-game [ufo tank])