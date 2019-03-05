;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |180|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; graphical constants

(define HEIGHT 20) ; the height of the editor 
(define WIDTH 200) ; its width 
(define FONT-SIZE 16) ; the font size 
(define FONT-COLOR "black") ; the font color 
 
(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red"))

(define PROTO-RENDER
  (place-image/align
  (beside (text "pre" FONT-SIZE FONT-COLOR)
          CURSOR
          (text "post" FONT-SIZE FONT-COLOR))
  1 1
  "left" "top"
  MT))

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S) 
; An Lo1S is one of: 
; – '()
; – (cons 1String Lo1S)

; test editor
(define ted
  (make-editor (cons "h" (cons "e" (cons "l" (cons "l" (cons "o" '())))))
               (cons "w" (cons "o" (cons "r" (cons "l" (cons "d" '())))))))
   
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

; String String -> Editor
; consumes strings pre and post and makes an editor
(check-expect (create-editor "" "")
              (make-editor '() '()))
(check-expect (create-editor "good" "one")
              (make-editor (rev (explode "good")) (rev (explode "one"))))

(define (create-editor pre post)
  (make-editor (rev (explode pre)) (rev (explode post))))
 
; Editor KeyEvent -> Editor
; deals with a key event, given some editor

(define (editor-kh ed k)
  (cond
    [(key=? k "left") (editor-lft ed)]
    [(key=? k "right") (editor-rgt ed)]
    [(key=? k "\b") (editor-del ed)]
    [(key=? k "\t") ed]
    [(key=? k "\r") ed]
    [(= (string-length k) 1) (editor-ins ed k)]
    [else ed]))

; Editor -> Editor
; moves the cursor position one 1String left,
; if possible
(check-expect (editor-kh
               (make-editor '() (cons "a" '())) "left")
              (make-editor '() (cons "a" '())))
(check-expect (editor-kh
               (make-editor (cons "a" (cons "b" '()))
                            (cons "c" (cons "d" '()))) "left")
              (make-editor (cons "a" '())
                           (cons "b" (cons "c" (cons "d" '())))))
(define (editor-lft ed)
  (cond
    [(empty? (editor-pre ed)) ed]
    [else
     (make-editor
      (select-list-n (editor-pre ed) (- (length (editor-pre ed)) 1))
      (cons (select-last (editor-pre ed)) (editor-post ed)))]))

; List-of-1Strings Number -> List-of-1Strings
; consumes a lo1s and a number n and returns a list-of-1strings of that number
(check-expect (select-list-n
               (cons "a" (cons "b" (cons "c" '()))) 1)
              (cons "a" '()))
(check-expect (select-list-n
               (cons "a" (cons "b" (cons "c" '()))) 2)
               (cons "a" (cons "b" '())))
(define (select-list-n l n)
  (cond
    [(zero? n) '()]
    [(positive? n)
     (cons (first l)
           (select-list-n (rest l) (sub1 n)))]))

; List-of-1Strings -> String
; consumes a list-of-1strings and returns the last value in the list as a string
(check-expect (select-last (cons "a" (cons "b" '())))
              "b")
(check-expect (select-last (cons "a" '()))
              "a")
(define (select-last l)
  (cond
    [(empty? l) ""]
    [(cons? l)
     (if
      (= (length l) 1)
      (first l)
      (select-last (rest l)))]))
     
  
; Editor -> Editor
; moves the cursor position one 1String right, 
; if possible
(check-expect (editor-rgt
               (make-editor (cons "a" '()) '()))
               (make-editor (cons "a" '()) '()))
(check-expect (editor-rgt
               (make-editor (cons "a" (cons "b" '()))
                            (cons "c" (cons "d" '()))))
               (make-editor (cons "a" (cons "b" (cons "c" '())))
                            (cons "d" '())))
(define (editor-rgt ed)
  (if
   (empty? (editor-post ed))
   ed
   (make-editor
    (append (editor-pre ed) (cons (first (editor-post ed)) '()))
    (remove (first (editor-post ed)) (editor-post ed)))))
    

; Editor -> Editor
; deletes a 1String to the left of the cursor,
; if possible
(check-expect (editor-del
               (make-editor '() (cons "a" '())))
              (make-editor '() (cons "a" '())))
(check-expect (editor-del
               (make-editor (cons "a" (cons "b" '()))
                            (cons "c" (cons "d" '()))))
               (make-editor (cons "a" '())
                            (cons "c" (cons "d" '()))))
(define (editor-del ed)
  (if
   (empty? (editor-pre ed))
   ed
   (make-editor
    (select-list-n (editor-pre ed) (- (length (editor-pre ed)) 1))
    (editor-post ed))))
   

; Editor 1String -> Editor
; insert the 1String k between pre and post
(check-expect (editor-ins (make-editor '() '()) "e")
              (make-editor (cons "e" '()) '()))
(check-expect (editor-ins
               (make-editor (cons "d" '())
                            (cons "f" (cons "g" '())))
               "e")
              (make-editor (cons "e" (cons "d" '()))
                           (cons "f" (cons "g" '()))))
(define (editor-ins ed k)
  (make-editor (cons k (editor-pre ed))
               (editor-post ed)))

; Editor -> Image
(check-expect (editor-render
               (make-editor '() '()))
              (place-image/align
               (beside (text "" FONT-SIZE FONT-COLOR)
                       CURSOR
                       (text "" FONT-SIZE FONT-COLOR))
               1 1
               "left" "top"
               MT))
(check-expect (editor-render
               (make-editor '() (cons "a" '())))
              (place-image/align
               (beside (text "" FONT-SIZE FONT-COLOR)
                       CURSOR
                       (text "a" FONT-SIZE FONT-COLOR))
               1 1
               "left" "top"
               MT))
(check-expect (editor-render
               (make-editor (cons "a" '()) '()))
              (place-image/align
               (beside (text "a" FONT-SIZE FONT-COLOR)
                       CURSOR
                       (text "" FONT-SIZE FONT-COLOR))
               1 1
               "left" "top"
               MT))
(check-expect (editor-render
               (make-editor (cons "h" (cons "i" '()))
                            (cons "y" (cons "o" (cons "u" '())))))
              (place-image/align
               (beside (text "hi" FONT-SIZE FONT-COLOR)
                       CURSOR
                       (text "you" FONT-SIZE FONT-COLOR))
               1 1
               "left" "top"
               MT))
; Editor -> Image
; renders an editor as an image of the two texts 
; separated by the cursor
             
(define (editor-render e)
  (place-image/align
   (beside (editor-text (rev (editor-pre e)))
           CURSOR
           (editor-text (rev (editor-post e))))
   1 1
   "left" "top" 
   MT))

; Lo1s -> String
; renders a list of 1Strings as a string

(check-expect (editor-text
               (cons "p" (cons "o" (cons "s" (cons "t" '())))))
               (text "post" FONT-SIZE FONT-COLOR))
(define (editor-text s)
  (text (lo1s->text s) FONT-SIZE FONT-COLOR))

; Lo1s -> String
; consumes a lo1s and converts it to a string
(check-expect (lo1s->text (cons "a" (cons "b" '())))
              "ab")
(check-expect (lo1s->text '())
              "")
(define (lo1s->text s)
  (cond
    [(empty? s) ""]
    [else
     (string-append (first s)
                    (lo1s->text (rest s)))]))
; main : String -> Editor
; launches the editor given some initial string 
(define (main s)
   (big-bang (create-editor s "")
     [on-key editor-kh]
     [to-draw editor-render]))

   