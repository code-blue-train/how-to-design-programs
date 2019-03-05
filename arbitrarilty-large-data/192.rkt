;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |192|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Exercise 193. Here are two more ideas for defining render-poly:
; render-poly could cons the last item of p onto p and then call connect-dots.
; render-poly could add the first item of p to the end of p
; via a version of add-at-end that works on Polygons.
; Use both ideas to define render-poly; make sure both definitions pass the test cases.

; Design a function that adds a polygon to a given scene
; A polygon is a planar figure with at least three points (not on a straight line)
; connected by three straight sides.

; a NELoP is one of:
; - (cons Posn '())
; - (cons Posn NELoP)

(define triangle-p
  (list
   (make-posn 20 10)
   (make-posn 20 20)
   (make-posn 30 20)))

(define square-p
  (list
   (make-posn 10 10)
   (make-posn 20 10)
   (make-posn 20 20)
   (make-posn 10 20)))

(define hexagon-p
  (list
    (make-posn 10 20)
    (make-posn 20 10)
    (make-posn 40 10)
    (make-posn 50 20)
    (make-posn 40 30)
    (make-posn 20 30)))

; a plain background image
(define MT (empty-scene 50 50))

; Image NELoP -> Image
; connects the dots in p by rendering lines in img
(check-expect (connect-dots MT triangle-p)
              (scene+line
               (scene+line MT 20 10 20 20 "red")
               20 20 30 20 "red"))
(check-expect (connect-dots MT square-p)
              (scene+line
               (scene+line
                (scene+line MT 10 10 20 10 "red")
                20 10 20 20 "red")
               20 20 10 20 "red"))
(define (connect-dots img p)
  (cond
    [(empty? (rest p)) MT]
    [else (render-line
           (connect-dots img (rest p))
          (first p)
          (second p))]))

; Image Posn Posn -> Image
; draws a red line from Posn p to Posn q into im
(define (render-line img p q)
  (scene+line
   img
   (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))

; Image Polygon -> Image
; adds an image of p to img
(define (render-polygon img p)
  (render-line (connect-dots img p)
               (first p)
               (last p)))
; Exercise 192. Argue why it is acceptable to use last on Polygons.
; because the data definition for polygons ensures that we always have a last item in the list
; Also argue why you may adapt the template for connect-dots to last:
; adding last to connect-dots would generalize the process to connect dots for all shapes in NELoP
; and not just polygons
; NELoP -> Posn
; extracts the last item from p
(define (last p)
  (first p))