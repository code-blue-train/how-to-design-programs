;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.2 Ex 106|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; constants

; scene constants
(define W-WIDTH 400)
(define W-HEIGHT 200)
(define MTSCN
  (empty-scene W-WIDTH W-HEIGHT))

(define MTSCN-HEIGHT (image-height MTSCN))
(define MTSCN-WIDTH (image-width MTSCN))

; colored scene for chameleon
(define COLORED-SCENE
  (beside (empty-scene (/ MTSCN-WIDTH 3) MTSCN-HEIGHT "green")
          (empty-scene (/ MTSCN-WIDTH 3) MTSCN-HEIGHT "white")
          (empty-scene (/ MTSCN-WIDTH 3) MTSCN-HEIGHT "blue")))

; gauge dimensions
(define GAUGE-WIDTH (/ (image-width MTSCN) 2))
(define GAUGE-HEIGHT (/ (image-height MTSCN) 3))
(define GAUGE
  (rectangle GAUGE-WIDTH GAUGE-HEIGHT "solid" "black"))

(define MTSCN-GAUGE
  (overlay/align "middle" "top"
                 GAUGE
                 MTSCN))

; chameleon
(define CHAM (bitmap "cham.png"))

(define Y-CHAM
  (image-height CHAM))

(define CHAM-COLOR-START "g")

(define CHAM-WIDTH (image-width CHAM))
(define CHAM-HEIGHT (image-height CHAM))

; cat
(define CAT (bitmap "cat.png"))

(define Y-CAT
  (image-height CAT))

(define CAT-WIDTH (image-width CAT))
(define CAT-HEIGHT (image-height CAT))

; VCham is a structure
;  (make-VCham Number Number String)
; intepretation:
; VCham-x represents the x coordinate of the chameleon on the canvas
; VCam-h represents the chameleon's happiness level
; 0 unhappy
; max GAUGE-WIDTH very happy
; VCham-c represents the chameleon's color
; - "r" for red, "b" for blue, and "g" for green
(define-struct VCham [x h c])
(define cham-ex1 (make-VCham 100 5 "r"))
(define cham-ex2 (make-VCham 0 100 "b"))
(define cham-ex3 (make-VCham 50 0 "g"))

; VCat is a structure
;  (make-VCat Number Number String)
; intepretation:
; VCat-x represents the x coordinate of the cat on the canvas
; VCat-h represents the cat's happiness level and is a number between 0 and 100
; - 0 miserable
; - 50 soso
; - 100 ecstatic
; VCat-d represents direction on MTSCN
; "right" or "left"
(define-struct VCat [x h d])
(define cat-ex1 (make-VCat 100 5 "left"))
(define cat-ex2 (make-VCat 0 100 "right"))
(define cat-ex3 (make-VCat 50 0 "right"))

; A VAnimal is either
; – a VCat
; – a VCham

(define VA1 cat-ex1)
(define VA2 cham-ex1)

; design cat-cham world program. Given both a location and an animal, it walks the latter
; across the canvas, start from the given location

; wish list
; rendering function from VAnimal to Image
; function for handling clock ticks, from VAnimal to VAnimal
; a fuction for dealing with key events so that you can feed and pet and colorize your animal

; scene rendering example
; VAnimal -> Image
; intepretation consumes a VAnimal va and produces an image
; with a CAT or a CHAM on the scene depending on the va
(check-expect (render VA1)
              (place-image CAT
               100
               (- MTSCN-HEIGHT (/ CAT-HEIGHT 2))
               (overlay/align "middle" "top"
                              (overlay/align "left" "middle"
                                             (rectangle 5 GAUGE-HEIGHT "solid" "red")
                                             GAUGE)
                              MTSCN)))
(check-expect (render VA2)
              (place-image CHAM
               100
               (- MTSCN-HEIGHT (/ CHAM-HEIGHT 2))
               (overlay/align "middle" "top"
                              (overlay/align "left" "middle"
                                             (rectangle 5 GAUGE-HEIGHT "solid" "red")
                                             GAUGE)
                              COLORED-SCENE)))
              
(define (render va)
  (cond
    [(VCat? va)
     (place-image CAT
               (VCat-x va)
               (- MTSCN-HEIGHT (/ CAT-HEIGHT 2))
               (overlay/align "middle" "top"
                              (overlay/align "left" "middle"
                                             (rectangle (VCat-h va) GAUGE-HEIGHT "solid" "red")
                                             GAUGE)
                              MTSCN))]
                                    
    [(VCham? va)
     (place-image CHAM
               (VCham-x va)
               (- MTSCN-HEIGHT (/ CHAM-HEIGHT 2))
               (overlay/align "middle" "top"
                              (overlay/align "left" "middle"
                                             (rectangle (VCham-h va) GAUGE-HEIGHT "solid" "red")
                                             GAUGE)
                              COLORED-SCENE))]
    )
  )

