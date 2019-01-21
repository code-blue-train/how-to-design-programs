;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |177|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S) 
; An Lo1S is one of: 
; – '()
; – (cons 1String Lo1S)

; Lo1s -> Lo1s 
; produces a reverse version of the given list 
 
(check-expect
  (rev (cons "a" (cons "b" (cons "c" '()))))
  (cons "c" (cons "b" (cons "a" '()))))
 
(define (rev l)
  (cond
    [(empty? l) '()]
    [else (add-at-end (rev (rest l)) (first l))]))

; Lo1s 1String -> Lo1s
; creates a new list by adding s to the end of l
(check-expect (add-at-end '() "b") (cons "b" '()))
(check-expect (add-at-end (cons "b" (cons "c" '())) "a")
              (cons "b" (cons "c" (cons "a" '()))))
(check-expect (add-at-end (cons "b" '()) "a")
              (cons "b" (cons "a" '())))
(define (add-at-end l s)
  (cond
    [(empty? l) (cons s '())]
    [else
     (cons (first l)
          (add-at-end (rest l) s))]))

; Exercise 177. Design the function create-editor.
; The function consumes two strings and produces an Editor.
; The first string is the text to the left of the cursor and the
; second string is the text to the right of the cursor.
; The rest of the section relies on this function.

; String String -> Editor
; consumes string s1 and string s2 and makes an editor
; s1 is left of the cursor and s2 is right of the cursor
(check-expect (create-editor "hello" "world")
              (make-editor "hello" "world"))
(check-expect (create-editor "" "?")
              (make-editor "" "?"))
(define (create-editor sl sr)
  (make-editor sl sr))

   