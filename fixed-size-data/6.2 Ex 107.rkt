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
(define CHAM-X-MOVE-PIXEL 5)

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

(define SCENE-TEMPLATE
  (place-image
   (overlay/xy
   (rectangle 175 CAT-GAUGE-HEIGHT "solid" "red")
   0 0
   (rectangle CAT-GAUGE-WIDTH CAT-GAUGE-HEIGHT "solid" "black"))
   100 50
   (place-image
    (overlay/xy
     (rectangle 175 CHAM-GAUGE-HEIGHT "solid" "red")
     0 0
     (rectangle CHAM-GAUGE-WIDTH CAT-GAUGE-HEIGHT "solid" "black"))
    300 50
    (place-image
     CAT
     0 (- MTSCN-HEIGHT (/ CAT-HEIGHT 2))
     (place-image
      CHAM
      100 (- MTSCN-HEIGHT (/ CHAM-HEIGHT 2))
      MTSCN))))
  )

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

; test structures
(define zoo-init (make-zoo
                  (make-VCat 0 CAT-GAUGE-WIDTH)
                  (make-VCham 100 CHAM-GAUGE-WIDTH)))

; design cat-cham world program. Given both a location and an animal, it walks the latter
; across the canvas, start from the given location

; wish list
; world program that takes zoo structure
; move cat and cham (clock tick)
; pet cat (key event)
; feed cham (key event)


; Number -> Number
; intepretation consumes animal type t (cat or cham) and number x which is the animal's x-position
; and moves the animal right across the scene by CAT-X-MOVE-PIXEL or CHAM-X-MOVE-PIXEL
; on the x-axis. if animal reaches right end of the scene, the animal restarts at 0 x-position
(check-expect (va-move "cat" 0) 1)
(check-expect (va-move "cham" 100) 101)
(check-expect (va-move "cat" MTSCN-WIDTH) 0)
(define (va-move t x)
  (cond
    [(string=? t "cat")
     (cond
       [(< x MTSCN-WIDTH) (+ x CAT-X-MOVE-PIXEL)]
       [else 0])]
    [(string=? t "cham")
     (cond
       [(< x MTSCN-WIDTH) (+ x CHAM-X-MOVE-PIXEL)]
       [else 0])]
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


; scene rendering

; Zoo -> Image
; intepretation consumes a zoo structure and renders cat and cham images based on
; their x position and the happiness gauge values on the MTSCN
(check-expect (render zoo-init)
              (place-image
               (overlay/xy
                (rectangle CAT-GAUGE-WIDTH CAT-GAUGE-HEIGHT "solid" "red")
                0 0
                (rectangle CAT-GAUGE-WIDTH CAT-GAUGE-HEIGHT "solid" "black"))
               100 50
               (place-image
                (overlay/xy
                 (rectangle CHAM-GAUGE-WIDTH CHAM-GAUGE-HEIGHT "solid" "red")
                 0 0
                 (rectangle CHAM-GAUGE-WIDTH CHAM-GAUGE-HEIGHT "solid" "black"))
                300 50
                (place-image
                 CAT
                 0 (- MTSCN-HEIGHT (/ CAT-HEIGHT 2))
                 (place-image
                  CHAM
                  100 (- MTSCN-HEIGHT (/ CHAM-HEIGHT 2))
                  MTSCN)))))
       
(define (render zoo)
  (place-image
   (overlay/xy
   (rectangle (VCat-h (zoo-VCat zoo)) CAT-GAUGE-HEIGHT "solid" "red")
   0 0
   (rectangle CAT-GAUGE-WIDTH CAT-GAUGE-HEIGHT "solid" "black"))
   100 50
   (place-image
    (overlay/xy
     (rectangle (VCham-h (zoo-VCham zoo)) CHAM-GAUGE-HEIGHT "solid" "red")
     0 0
     (rectangle CHAM-GAUGE-WIDTH CAT-GAUGE-HEIGHT "solid" "black"))
    300 50
    (place-image
     CAT
     (VCat-x (zoo-VCat zoo)) (- MTSCN-HEIGHT (/ CAT-HEIGHT 2))
     (place-image
      CHAM
      (VCham-x (zoo-VCham zoo)) (- MTSCN-HEIGHT (/ CHAM-HEIGHT 2))
      MTSCN)))))
                     

; function for handling clock ticks, from VAnimal to VAnimal
; Zoo -> Zoo
; interpretation consumes zoo structure and returns zoo structure
; calls va-move which moves animals on x-axis and calls dec-h-gauge which
; decreases happiness gauge
(check-expect (tock (make-zoo (make-VCat 50 100) (make-VCham 40 50)))
              (make-zoo (make-VCat 51 99) (make-VCham 41 49)))
(define (tock zoo)
  (make-zoo
   (make-VCat (va-move "cat" (VCat-x (zoo-VCat zoo)))
              (dec-h-gauge (VCat-h (zoo-VCat zoo))))
   (make-VCham (va-move "cham" (VCham-x (zoo-VCham zoo)))
              (dec-h-gauge (VCham-h (zoo-VCham zoo))))
   ))
                      

; a fuction for dealing with key events so that you can feed and pet and colorize your animal
; Zoo KeyEvent -> VAnimal
; intepretation
; - up or down arrow increases animals in zoo's happiness
; - pets cat or feeds chameleon
(define (key-events zoo ke)
  (cond
    [(or (string=? "up" ke) (string=? "down" ke))
     (make-zoo
      (make-VCat (VCat-x (zoo-VCat zoo)) (inc-h-gauge (VCat-h (zoo-VCat zoo))))
      (make-VCham (VCham-x (zoo-VCham zoo)) (inc-h-gauge (VCham-h (zoo-VCham zoo)))))]
     [else zoo]
     ))
   

; Zoo -> Boolean
; intepretation returns true when either animal in zoos happiness gauge is 0
; else returns false
(check-expect (zoo-h-zero (make-zoo (make-VCat 100 0) (make-VCham 200 100))) #true)
(check-expect (zoo-h-zero (make-zoo (make-VCat 100 10) (make-VCham 200 100))) #false)
(define (zoo-h-zero zoo)
  (or (= (VCham-h (zoo-VCham zoo)) 0) (= (VCat-h (zoo-VCat zoo)) 0))
  )
                
; WorldState is VCham vc
; (cham-and-cat (make-zoo (make-VCat 0 CAT-GAUGE-WIDTH) (make-VCham 100 CHAM-GAUGE-WIDTH)))
(define (cham-and-cat zoo)
  (big-bang zoo
    [on-tick tock]
    [on-draw render]
    [on-key key-events]
    [stop-when zoo-h-zero]
    ))        
