;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |BSL Meaning|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; exercise 121. Evaluate the following expressions step-by-step:
(+ (* (/ 12 8) 2/3)
   (- 20 (sqrt 4)))
==
(+ (* 1.5 2/3)
   (- 20 (sqrt 4)))
==
(+ 1 (- 20 (sqrt 4)))
==
(+ 1 (- 20 2))
==
(+ 1 18)
==
19

(cond
  [(= 0 0) #false]
  [(> 0 1) (string=? "a" "a")]
  [else (= (/  1 0) 9)])
==
(cond
  [#true #false]
  [(> 0 1) (string=? "a" "a")]
  [else (= (/  1 0) 9)])
==#false
; all other cond expressions don't matter
; by rule cond true rule value is #false

(cond
  [(= 2 0) #false]
  [(> 2 1) (string=? "a" "a")]
  [else (= (/  1 2) 9)])
== / cond false
(cond
  [#false #false]
  [(> 2 1) (string=? "a" "a")]
  [else (= (/ 1 2) 9)])
==/ cond true
(cond
  [#true (string=? "a" "a")]
  [(else = (/ 1 2) 9)])
==/cond true
(string=? "a" "a")
== #true

; exercise 122. Suppose the program contains these definitions:
(define (f x y)
  (+ (* 3 x) (* y y)))
;Show how DrRacket evaluates the following expressions, step-by-step:
(+ (f 1 2) (f 2 1))
==
(+ (+ (* 3 1) (* 2 2)) (f 2 1))
==
(+ (+ 3 (* 2 2)) (f 2 1))
==
(+ (+ 3 4) (f 2 1))
==
(+ 7 (+ (* 3 2) (* 1 1)))
==
(+ 7 (+ 6 (* 1 1))
==
(+ 7 (+ 6 1))
==
(+ 7 7)
==
14

(f 1 (* 2 3))
==
(f 1 6)
==
(+ (* 3 1) (* 6 6))
==
(+ 3 (* 6 6))
==
(+ 3 36)
==
39

(f (f 1 (* 2 3)) 19)
==
(f (f 1 6) 19)
==
(f (+ (* 3 1) (* 6 6) 19))
==
(f (+ 3 (* 6 6)) 19)
==
(f (+ 3 36) 19)
==
(f 39 19)
==
(+ (* 3 39) (* 19 19))
==
(+ 117 (* 19 19))
==
(+ 117 361)
==
478


