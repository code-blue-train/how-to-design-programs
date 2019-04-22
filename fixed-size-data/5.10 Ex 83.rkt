;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.10 Ex 83|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)


; constants
(define CURSOR (rectangle 1 20 "solid" "red"))
(define MTSCN (empty-scene 200 20))

(define-struct editor [pre post])
(define ex1 (make-editor "hello " "world"))
; An Editor is a structure
;  (make-editor String String)
; intepretation (make-editor s t) describes an editor
; whose text is (string-append s t) with
; the cursor displayed between s and t


; Editor -> Image
; consumes editor structure and produces an image
; with the editor strings displayed on an empty scene
; with the cursor between the strings
(check-expect (render ex1) (overlay/align "left" "center"
                                          (beside (text "hello " 16 "black")
                                                  CURSOR
                                                  (text "world" 16 "black"))
                                          MTSCN))
                                          
(define (render a)
  (overlay/align "left" "center"
                 (beside (text (editor-pre a) 16 "black")
                         CURSOR
                         (text (editor-post a) 16 "black"))
                 MTSCN))