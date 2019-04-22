;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |305|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/abstraction)

; [List-of Numbers] Number -> [List-of Numbers]
; converts a list of US$ amounts into a list of € amounts
; based on an exchange rate of US$1.06 per € (on April 13, 2017)
(define EXR 1.06)
(check-within (convert-euro
               (list 1.06 2.00 3.5) EXR)
              (list 1.12 2.12 3.71) .01)
(check-within (convert-euro
               '(10.96 1250.83) EXR)
              '(11.61 1325.87) .01)
(check-expect (convert-euro '() EXR) '())
(define (convert-euro loa er)
  (if (empty? loa)
      '()
       (for/list ([l loa]) (* er l))))

               

