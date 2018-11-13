;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A WorldState is a Number.
; interpretation number of pixels between the top and the UFO
 
(define WIDTH 300) ; distances in terms of pixels 
(define HEIGHT 100)
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))
(define UFO (overlay (circle 10 "solid" "green") (ellipse 60 20 "solid" "black")))
 
; WorldState -> WorldState
(define (main y0)
  (big-bang y0
     [on-tick nxt]
     [to-draw render]))

; a StatusLine is a String
; intepretation displays String depending on y location on canvas of UFO
; when y is above 1/3 of canvas display "Descending"
; when y is below 1/3 of canvas display "Closing in"
; when y is other display "Landed"
(check-expect (status-line 5) (text "Descending" 12 "green"))
(check-expect (status-line 50) (text "Closing in" 12 "orange"))
(check-expect (status-line 101) (text "Landed" 12 "red"))
(define (status-line y)
  (cond
    [(<= 0 y CLOSE) (text "Descending" 12 "green")]
    [(and (< CLOSE y) (<= y HEIGHT)) (text "Closing in" 12 "orange")]
    [(> y HEIGHT) (text "Landed" 12 "red")]
    ))
   

; WorldState -> WorldState
; computes next location of UFO 
(check-expect (nxt 11) 14)
(define (nxt y)
  (+ y 3))
 
; WorldState -> Image
; places UFO at given height into the center of MTSCN
;(check-expect (render 11) (place-image UFO (/ (image-width MTSCN) 2) 11 MTSCN))
(define (render y)
  (place-image UFO (/ (image-width MTSCN) 2) y
               (overlay/xy (status-line y) 20 20 MTSCN)))