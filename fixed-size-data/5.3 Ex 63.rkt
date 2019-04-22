;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.3 Ex 63|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; computes the distance of ap to the origin
(check-expect (distance-to-0 (make-posn 3 4)) 5)
(check-expect (distance-to-0 (make-posn 8 6)) 10)
(check-expect (distance-to-0 (make-posn 5 12)) 13)


(define (distance-to-0 ap)
  (sqrt
   (+ (sqr (posn-x ap))
      (sqr (posn-y ap)))))

(distance-to-0 (make-posn 3 4))
; work for this function
(distance-to-0 (make-posn 6 (* 2 4)))

(sqrt
 (+ (sqr (posn-x (make-posn 6 (* 2 4))))
    (sqr (posn-y (make-posn 6 (* 2 4))))))

(sqrt
 (+ (sqr (posn-x (make-posn 6 8)))
    (sqr (posn-y (make-posn 6 (* 2 4))))))

(sqrt
 (+
  (sqr 6)
  (sqr (posn-y (make-posn 6 (* 2 4))))))

(sqrt
 (+
  36
  (sqr (posn-y (make-posn 6 8)))))

(sqrt
 (+
  36
  (sqr 8)))

(sqrt
 (+
  36
  64))

(sqrt 100)

;work for this function
(+ (distance-to-0 (make-posn 12 5)) 10)

(+
 (sqrt
  (+
   (sqr (posn-x (make-posn 12 5)))
   (sqr (posn-y (make-posn 12 5)))
   ))
 10)

(+
 (sqrt
  (+
   (sqr 12)
   (sqr (posn-y (make-posn 12 5)))
   ))
 10)

(+
 (sqrt
  (+
   144
   (sqr (posn-y (make-posn 12 5)))
   ))
 10)

(+
 (sqrt
  (+
   144
   (sqr 5)
   ))
 10)

(+
 (sqrt
  (+  144 25)
  )
 10)

(+
 (sqrt 169)
 10)

(+ 13 10)
  
    
     
