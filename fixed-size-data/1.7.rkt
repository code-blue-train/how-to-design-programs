;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define in #false)

(define (ex-9 in)
(cond
  ((number? in) (if (= in 0) 0 (- (abs in) 1)))
  ((string? in) (string-length in))
  ((image? in) (* (image-height in) (image-width in)))
  ((boolean? in) (if (equal? in #true) 10 20))
  ))

(ex-9 in)