;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |194|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; Exercise 194. Modify connect-dots so that it consumes an additional Posn
; to which the last Posn is connected. Then modify render-poly to use
; this new version of connect-dots.

; Image NELoP -> Image
; connects the dots in p by rendering lines in img
(check-expect (connect-dots MT triangle-p (first triangle-p))
              (scene+line
               (scene+line
                (scene+line MT 20 10 20 20 "red")
               20 20 30 20 "red")
               30 20 20 10 "red"))
(check-expect (connect-dots MT square-p (first square-p))
              (scene+line
               (scene+line
                (scene+line
                 (scene+line MT 10 10 20 10 "red")
                20 10 20 20 "red")
               20 20 10 20 "red")
               10 20 10 10 "red"))
(define (connect-dots img p pos)
  (cond
    [(empty? (rest p)) (render-line img (first p) pos)]
    [else (render-line
           (connect-dots img (rest p) pos)
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
  (connect-dots img p (first p)))
           

 
; NELoP -> Posn
; extracts the last item from p
(check-expect (last triangle-p)
              (make-posn 30 20))
(check-expect (last square-p)
              (make-posn 10 20))
(check-expect (last hexagon-p)
              (make-posn 20 30))
(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))
; NELoP -> NELoP
; adds the first item of p onto the end p
(check-expect (add-at-end (make-posn 20 10) triangle-p)
              (cons (make-posn 20 10)
                    (cons (make-posn 20 20)
                          (cons (make-posn 30 20)
                                (cons (make-posn 20 10) '())))))
(check-expect (add-at-end (make-posn 10 10) square-p)
              (cons (make-posn 10 10)
                    (cons (make-posn 20 10)
                          (cons (make-posn 20 20)
                                (cons (make-posn 10 20)
                                      (cons (make-posn 10 10) '()))))))
(define (add-at-end f p)
  (cond
    [(empty? (rest p)) (cons (first p) (cons f '()))]
    [else (cons (first p) (add-at-end f (rest p)))]))