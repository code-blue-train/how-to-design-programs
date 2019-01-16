;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |165|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 165. Design the function subst-robot,
; which consumes a list of toy descriptions (one-word strings)
; and replaces all occurrences of "robot" with "r2d2";
; all other descriptions remain the same.

; Generalize subst-robot to substitute.
; The latter consumes two strings, called new and old, and a list of strings.
; It produces a new list of strings by substituting all occurrences of old with new.


; List-of-Strings contains one of:
; '()
; (cons String List-of-Strings)

; List-of-strings -> List-of-strings
; intepretation consumes a list of toy descriptions (one-word strings)
; and produces a list that replaces all occurrences of "robot" with "r2d2";
; all other descriptions remain the same.
(check-expect (subst-robot '()) '())
(check-expect (subst-robot (cons "robot" '())) (cons "r2d2" '()))
(check-expect (subst-robot (cons "robot" (cons "ball" (cons "robot" '()))))
              (cons "r2d2" (cons "ball" (cons "r2d2" '()))))
(check-expect (subst-robot (cons "ball" '())) (cons "ball" '()))
(define (subst-robot los)
  (cond
    [(empty? los) '()]
    [else
      (cons (replace (first los))
            (subst-robot (rest los)))]))

(define (replace s)
  (if (string=? s "robot")
      "r2d2"
      s))
                

(define (replace.v2 n o s)
  (if (string=? s o)
      n
      s))

; String String List-of-strings -> List-of-strings
; interpretation consumes two strings, called new and old, and a list of strings.
; It produces a new list of strings by substituting all occurrences of old with new.
(check-expect (subst-robot.v2 "new" "old" '()) '())
(check-expect (subst-robot.v2 "new" "old" (cons "old" '())) (cons "new" '()))
(check-expect (subst-robot.v2 "new" "old" (cons "test" (cons "old" '())))
              (cons "test" (cons "new" '())))
(check-expect (subst-robot.v2 "new" "old" (cons "new" (cons "test" '())))
              (cons "new" (cons "test" '())))

(define (subst-robot.v2 new old los)
  (cond
    [(empty? los) '()]
    [else
     (cons (replace.v2 new old (first los))
           (subst-robot.v2 new old (rest los)))]))
     


