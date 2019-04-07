;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |308|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/abstraction)

(define-struct phone [area switch four])

; [List-of Phone] Area -> [List-of Phone]
; consumes a list of phone lop and returns a list of phone
; with area replaced with 281 if area equals 713
(check-expect (replace
               (list
                (make-phone 713 123 3456)
                (make-phone 713 111 1234)
                (make-phone 512 555 5555)))
              (list
                (make-phone 218 123 3456)
                (make-phone 218 111 1234)
                (make-phone 512 555 5555)))
(define (replace lop)
   (for/list ((p lop))
     (match p
       [(phone x y z) (if (= x 713)
                          (make-phone 218 y z)
                          (make-phone x y z))])))
                             
                    
                 
                