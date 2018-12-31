;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.2 Ex 107|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; constants

; scene constants
(define MTSCN-WIDTH 400)
(define MTSCN-HEIGHT 200)
(define MTSCN
  (empty-scene MTSCN-WIDTH MTSCN-HEIGHT))

; colored scene for chameleon
(define COLORED-SCENE
  (beside (empty-scene (/ MTSCN-WIDTH 3) MTSCN-HEIGHT "green")
          (empty-scene (/ MTSCN-WIDTH 3) MTSCN-HEIGHT "white")
          (empty-scene (/ MTSCN-WIDTH 3) MTSCN-HEIGHT "blue")))

; happiness gauge
(define GAUGE-WIDTH 180)
(define GAUGE-HEIGHT 50)
(define GAUGE
  (rectangle GAUGE-WIDTH GAUGE-HEIGHT "solid" "black"))
(define GAUGE-DECREASE-PIXEL 1)
(define GAUGE-INCREASE-PIXEL 5)

(define X-MOVE-PIXEL 1)
; chameleon
(define CHAM (bitmap "cham.png"))

(define CHAM-WIDTH (image-width CHAM))
(define CHAM-HEIGHT (image-height CHAM))
(define CHAM-X-MOVE-PIXEL 1)

(define CHAM-GAUGE-WIDTH 180)
(define CHAM-GAUGE-HEIGHT 50)
(define CHAM-GAUGE
  (rectangle CHAM-GAUGE-WIDTH CHAM-GAUGE-HEIGHT "solid" "black"))
(define CHAM-GAUGE-DEC-PIXEL 1)
(define CHAM-GAUGE-INC-PIXEL 5)
(define CHAM-LABEL (text "CHAM HAPPINESS GAUGE" 14 "red"))

; cat
(define CAT (bitmap "cat.png"))

(define CAT-WIDTH (image-width CAT))
(define CAT-HEIGHT (image-height CAT))
(define CAT-X-MOVE-PIXEL 1)
  
(define CAT-GAUGE-WIDTH 180)
(define CAT-GAUGE-HEIGHT 50)
(define CAT-GAUGE
  (rectangle CAT-GAUGE-WIDTH CAT-GAUGE-HEIGHT "solid" "black"))
(define CAT-GAUGE-DEC-PIXEL 1)
(define CAT-GAUGE-INC-PIXEL 5)
(define CAT-LABEL (text "CAT HAPPINESS GAUGE" 14 "red"))

(define GAUGES-MTSCN
  (place-image
   CAT-GAUGE
   100 50
   (place-image
    CHAM-GAUGE
    300 50
    MTSCN)))

(define GAUGES-LABELS-MTSCN
  (place-image
   CAT-LABEL
   100 9
   (place-image
    CHAM-LABEL
    300 9
    GAUGES-MTSCN)))

; VCham is a structure
;  (make-VCham Number Number)
; intepretation:
; VCham-x represents the x coordinate of the chameleon on the canvas
; VCam-h represents the chameleon's happiness level
; 0 unhappy
; max GAUGE-WIDTH very happy
(define-struct VCham [x h])
(define cham-ex1 (make-VCham 100 5))
(define cham-ex2 (make-VCham 0 100))
(define cham-ex3 (make-VCham 50 0))

; VCat is a structure
;  (make-VCat Number Number)
; intepretation:
; VCat-x represents the x coordinate of the cat on the canvas
; VCat-h represents the cat's happiness level and is a number between 0 and 100
; - 0 miserable
; - 50 soso
; - 100 ecstatic

(define-struct VCat [x h])

; a Zoo is a structure with a VCat and a VCham
; (make-zoo (make-VCat 0 100) (make-VCham 0 100))
(define-struct zoo [VCat VCham])

; design cat-cham world program. Given both a location and an animal, it walks the latter
; across the canvas, start from the given location

; wish list

; Number -> Number
; intepretation consumes number x which is the animal's x-position
; and moves the animal right across the scene by X-MOVE-PIXEL
; on the x-axis. if animal reaches right end of the scene, the animal restarts at 0 x-position
(check-expect (va-move 0) 1)
(check-expect (va-move 100) 101)
(check-expect (va-move MTSCN-WIDTH) 0)
(define (va-move x)
  (cond
    [(< x MTSCN-WIDTH) (+ x X-MOVE-PIXEL)]
    [else 0])
  )
   

; Number -> Image
; intepretation consumes number x and produces an image
; that overlay's a red retangle with x as its x-coordinate on the GAUGE image
(check-expect (decrease-gauge 100)
              (overlay/align "left" "middle"
                             (rectangle 100 GAUGE-HEIGHT "solid" "red")
                                        GAUGE))
(check-expect (decrease-gauge 0)
              (overlay/align "left" "middle"
                             (rectangle 0 GAUGE-HEIGHT "solid" "red")
                                        GAUGE))
(define (decrease-gauge x)
  (overlay/align "left" "middle"
                 (rectangle x GAUGE-HEIGHT "solid" "red")
                 GAUGE))

; Type X-pos Happiness Color -> Image
; intepretation consumes Type t (either CAT or CHAM), x-position x, happiness level h, and
; color (white for cat) and
(check-expect (render-vanimal "CAT" 100 100)
              (place-image
               (overlay/align "left" "middle"
                 (rectangle 100 GAUGE-HEIGHT "solid" "red")
                 GAUGE)
               200 35
               (place-image CAT 100 (- MTSCN-HEIGHT (/ CAT-HEIGHT 2)) MTSCN)))
(check-expect (render-vanimal "CHAM" 5 100)
              (place-image
               (overlay/align "left" "middle"
                 (rectangle 100 GAUGE-HEIGHT "solid" "red")
                 GAUGE)
               200 35
               (place-image CHAM 5 (- MTSCN-HEIGHT (/ CHAM-HEIGHT 2)) COLORED-SCENE)))

(define (render-vanimal t x h)
  (cond
    [(string=? t "CAT")
    (place-image (decrease-gauge h) 200 35
               (place-image CAT x (- MTSCN-HEIGHT (/ CAT-HEIGHT 2)) MTSCN))]
    [(string=? t "CHAM")
    (place-image (decrease-gauge h) 200 35
               (place-image CHAM x (- MTSCN-HEIGHT (/ CHAM-HEIGHT 2)) COLORED-SCENE))]
    ))
              
; Number -> Number
; intepretation consumes number h which is the current happiness level for the animal
; and returns number which is the happiness gauge increased by GAUGE-INCREASE-PIXEL
; stops happiness gauge when it reaches GAUGE-WIDTH
(check-expect (inc-h-gauge 10) 15)
(check-expect (inc-h-gauge GAUGE-WIDTH) GAUGE-WIDTH)
(check-expect (inc-h-gauge 0) 5)
(define (inc-h-gauge h)
  (if
   (>= h GAUGE-WIDTH) GAUGE-WIDTH
   (+ h GAUGE-INCREASE-PIXEL)
   ))

; Number -> Number
; intepretation consumes number h which is the current happiness level for the animal
; and returns number which is the happiness gauge decreased by GAUGE-DECREASE-PIXEL
; stops happiness gauge when it reaches 0
(check-expect (dec-h-gauge 10) 9)
(check-expect (dec-h-gauge GAUGE-WIDTH) (- GAUGE-WIDTH 1))
(check-expect (dec-h-gauge 0) 0)
(define (dec-h-gauge h)
  (if
   (= h 0) 0
   (- h GAUGE-DECREASE-PIXEL)
   ))

; scene rendering example
; VAnimal -> Image
; intepretation consumes a VAnimal va and produces an image
; with a CAT or a CHAM on the scene depending on the va
; image rendering testing happens in render-vanimal
              
(define (render va)
  (cond
    [(VCat? va) (render-vanimal "CAT" (VCat-x va) (VCat-h va))]                                    
    [(VCham? va) (render-vanimal "CHAM" (VCham-x va) (VCham-h va))]
    )
  )

; function for handling clock ticks, from VAnimal to VAnimal
; VAnimal -> VAnimal
; interpretation each clock tick moves the VAnimal va across the scene
(check-expect (tock (make-VCat 100 100))
              (make-VCat 101 99))
                    
(define (tock va)
  (cond
    [(VCat? va)
     (make-VCat (va-move (VCat-x va))
                   (dec-h-gauge (VCat-h va)))]
    [(VCham? va)
     (make-VCham (va-move (VCham-x va))
                 (dec-h-gauge (VCham-h va)))]
    )
  )

; a fuction for dealing with key events so that you can feed and pet and colorize your animal
; VAnimal -> VAnimal
; intepretation
; - up or down arrow increases animal's va happiness
; - pets cat or feeds chameleon
(define (key-events va ke)
  (cond
    [(or (string=? "up" ke) (string=? "down" ke))
     (cond
        [(VCat? va)
         (make-VCat (VCat-x va) (inc-h-gauge (VCat-h va)))]
        [(VCham? va)
         (make-VCham (VCham-x va) (inc-h-gauge (VCham-h va)))]
        )]
    [else va]
    ))

; VAnimal -> Boolean
; intepretation returns false when animal va happiness gauge is 0
; else returns true
(define (va-h-zero va)
  (if (or (and (VCham? va) (= (VCham-h va) 0)) (and (VCat? va) (= (VCat-h va) 0))) #true #false))
                
; WorldState is VCham vc
; (cat-cham (make-VCat 0 GAUGE-WIDTH))
(define (cat-cham va)
  (big-bang va
    [on-tick tock]
    [on-draw render]
    [on-key key-events]
    [stop-when va-h-zero]
    ))        
