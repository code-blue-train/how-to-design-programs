;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |135|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


; A List-of-names is one of: 
; – '()
; – (cons String List-of-names)
; interpretation a list of invitees, by last name

; List-of-names -> Boolean
; determines whether a given String is in alon (a-list-of-names)
(define (contains-flatt? alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (or (string=? "Flatt" (first alon))
         (contains-flatt? (rest alon)))]))

;(contains-flatt? (cons "Flatt" (cons "C" '())))
(contains-flatt?
  (cons "A" (cons "Flatt" (cons "C" '()))))

; what happens when "Flatt" is replaced with "B"?
; the function returns #false