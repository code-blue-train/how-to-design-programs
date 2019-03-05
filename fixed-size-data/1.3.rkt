;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define str "helloworld")
(define i 10)

;1.3
;Exercise 3
(string-append (substring str 0 i) "_"
               (substring str i (string-length str)))

;Exercise 4
(string-append (substring str 0 (- i 1))
               (substring str i (string-length str)))

;Exercise 5
(overlay/xy (circle 20 "solid" "green")
            15 25
            (rectangle 10 50 "solid" "brown"))
