;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.10 Ex 84|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; constants
(define CURSOR (rectangle 1 20 "solid" "red"))
(define MTSCN (empty-scene 200 20))

; An Editor is a structure
;  (make-editor String String)
; intepretation (make-editor s t) describes an editor
; whose text is (string-append s t) with
; the cursor displayed between s and t
(define-struct editor [pre post])
(define ex1 (make-editor "hello " "world"))

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

; wish list
; string-first - consumes string and returns first character
; string-last - consumes string and returns last character

; Editor KeyEvent -> Editor
; intepretation consumes an editor ed and a keyevent ke
; and produces another editor
; KeyEvent definition:
;  - left arrow ke "left" moves cursor one character to the left if any
;  - right arrow ke "right" moves cursor one character to the right if any
;  - if ke string-length is 1:
;    tab "\t" is ignored
;    return "\r" is ignored
;    backspace "\b" deletes character immediately to the left of cursor if there is any
;    all other single string characters are appended to the pre field
; Adds a single character ke to the end of the pre field,
; unless ke denotes backspace then it deletes the character immediately
; to the left of the cursor. The function ignores keys tab ("\t") and return ("\r").
; strings 
; Examples and unit tests
(define ex2 (make-editor "hell" "world"))
(check-expect (edit ex2 "o") (make-editor "hello" "world"))
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
(check-expect (edit ex8 "b") (make-editor "ab" ""))
(define ex9 (make-editor "hey" ""))
(check-expect (edit ex9 "!") (make-editor "hey!" ""))
(define ex10 (make-editor "12345" "7"))
(check-expect (edit ex10 "6") (make-editor "123456" "7"))
(define ex11 (make-editor "hello" "1"))
(check-expect (edit ex11 "left") (make-editor "hell" "o1"))
(define ex12 (make-editor "hello" "world"))
(check-expect (edit ex12 "right") (make-editor "hellow" "orld"))

(define (edit ed ke)
  (if (< (image-width (text (editor-pre ed) 16 "black")) 100)
  (cond

        
    [(or (string=? ke "\t") (string=? ke "\r")) ed]
    [(string=? ke "\b")
     (make-editor
       (substring (editor-pre ed) 0 (- (string-length (editor-pre ed)) 1)) (editor-post ed))]
    [(= (string-length ke) 1)
     (make-editor (string-append (editor-pre ed) ke) (editor-post ed))]
    [(string=? ke "left")
        (make-editor
         (substring (editor-pre ed) 0 (- (string-length (editor-pre ed)) 1))
         (string-append
          (substring (editor-pre ed) (- (string-length (editor-pre ed)) 1)) (editor-post ed)))]
    [(string=? ke "right")
     (make-editor
      (string-append
       (editor-pre ed) (substring (editor-post ed) 0 1))
       (substring (editor-post ed) 1 (string-length (editor-post ed))))]
    [else ed]
    ) ed))

; Editor -> Editor
; (run (make-editor String String))
; ex: (run (make-editor "hello" "world"))
 (define (run a)
   (big-bang a
     [on-key edit]
     [on-draw render]
     ))

              