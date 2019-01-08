;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |6.5 Exercises|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)


(define MESSAGE
  "traffic light expected, given some other value")


(define (light? x)
  (cond
    [(string? x) (or (string=? "red" x)
                     (string=? "green" x)
                     (string=? "yellow" x))]
    [else #false]))

; exercise 115
(define (light.v2=? a-value another-value)
  (and
    (and
     (if (light? a-value)
        #true
        (error "first argument isn't a traffic light"))
     (if (light? another-value)
        #true
        (error "second argument isn't a traffic light")))
    (string=? a-value another-value)))