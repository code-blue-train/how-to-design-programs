;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.5 Ex 70|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct centry [name home office cell])

;(centry-name (make-centry n0 h0 o0 c0)) ;== n0
;(centry-home (make-centry n0 h0 o0 c0)) ;== h0
;(centry-office (make-centry n0 h0 o0 c0)) ;== o0
;(centry-cell (make-centry n0 h0 o0 c0)) ;==c0

(define-struct phone [area number])

;(phone-area (make-phone a0 n0)) ; == a0
;(phone-number (make-phone a0 n0)); == n0

