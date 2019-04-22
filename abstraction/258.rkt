;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |258|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

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

(define MT (empty-scene 50 50))

; Polygon -> Posn
; extracts the last item from p
(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))

; Imgage Polygon -> Image
; adds an image of p to MT
(define (render-polygon img p)
  (local (; 1. connect the Posns in p in an image
          ; Image NeLop -> Image
          (define (connect-dots img p)
           (cond
             [(empty? (rest p)) MT]
             [else (render-line (connect-dots img (rest p))
                       (first p)
                       (second p))]))
          ; 2. draws a red line from Posn p to Posn q into im
          ; Image Posn Posn -> Image
          (define (render-line im p q)
            (scene+line
             im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red")))
  (render-line (connect-dots img p) (first p) (last p))))