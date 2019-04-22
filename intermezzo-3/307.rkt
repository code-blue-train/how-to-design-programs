;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |307|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/abstraction)

; String [List-of Strings] -> String
; The function consumes a name and a list of names.
; It retrieves the first name on the latter that is equal to,
; or an extension of, the former.
(check-expect (find-name "Merrick"
                         '("Sarah"  "Merrick" "Jay" "Merri"))
              "Merrick")
(check-expect (find-name "Merrick"
                         '("Sarah" "Jay" "Merri" "Merrick"))
              "Merri")
(check-expect (find-name "Merrick"
                         '("Sarah" "Jay"))
              #false)
(define (find-name n lon)
  (for/or ([l lon]) (if (string-contains? l n) l #f)))

; [List-of Strings] Number -> Boolean
; consumes a list of names and a number w
; if any name on the list of names is greater than w characters,
; return #false otherwise return #true
(check-expect (name-width>? '("Merrick" "Sarah" "Jay") 2)
              #true)
(check-expect (name-width>? '("Merrick" "Sarah" "Jay") 8)
              #false)
(define (name-width>? lon w)
  (for/and ([l lon]) (> (string-length l) w)))