;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.10 Ex 84|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
                                          (beside (text "hello" 16 "black")
                                                  CURSOR
                                                  (text "world" 16 "black"))
                                          MTSCN))
                                          
(define (render a)
  (overlay/align "left" "center"
                 (beside (text (editor-pre a) 16 "black")
                         CURSOR
                         (text (editor-post a) 16 "black"))
                 MTSCN))

; Editor KeyEvent -> Editor
; intepretation consumes an editor and a keyevent
; and produces another editor
; Examples and unit tests
(define ex2 (make-editor "hell" "world"))
(check-expect (edit ex2 "o") (make-editor "hello " "world"))
(define ex3 (make-editor "hello " "world"))
(check-expect (edit ex3 "\b") (make-editor "hello" "world"))
(define ex4 (make-editor "hello" "world"))
(check-expect (edit ex4 " ") (make-editor "hello " "world"))
(define ex5 (make-editor "hello " "world"))
(check-expect (edit ex5 "\t") (make-editor "hello " "world"))
(define ex6 (make-editor "hello " "world"))
(check-expect (edit ex6 "\r") (make-editor "hello " "world"))
(define ex7 (make-editor "" ""))
(check-expect (edit ex7 "a") (make-editor "a" ""))
(define ex8 (make-editor "a" ""))
(check-expect (edit ex8 "b") (make-editor "a" "b"))
(define ex9 (make-editor "hey" ""))
(check-expect (edit ex9 "!") (make-editor "hey!" ""))
(define ex10 (make-editor "12345" "7"))
(check-expect (edit ex10 "6") (make-editor "123456" "7"))

(define (edit ed ke)
  (cond
    ... (ed-pre ed) ... (ed-post ed) ...))