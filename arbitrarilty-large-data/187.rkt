;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |187|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 187. Design a program that sorts lists of game players by score:
(define-struct gp [name score])
; A GamePlayer is a structure: 
;    (make-gp String Number)
; interpretation (make-gp p s) represents player p who 
; scored a maximum of s points 
; Hint Formulate a function that compares two elements of GamePlayer.

; List-of-game-players is one of:
; '()
; (cons GamePlayer List-of-game-players)

; List-of-game-players -> List-of-game-players
; sorts lists of game players by score in descending order
(check-expect (sort-gp> (list '()))
              (list '()))
(check-expect (sort-gp> (list
                        (make-gp "Guy" 100)))
              (list (make-gp "Guy" 100)))
(check-expect (sort-gp> (list
                        (make-gp "Star" 200)
                        (make-gp "Guy" 100)))
              (list (make-gp "Star" 200)
                    (make-gp "Guy" 100)))

(check-expect (sort-gp> (list
                        (make-gp "Guy" 100)
                        (make-gp "Star" 200)))
              (list
               (make-gp "Star" 200)
               (make-gp "Guy" 100)))
(check-expect (sort-gp> (list
                        (make-gp "Guy" 100)
                        (make-gp "Mars" 500)
                        (make-gp "Star" 200)))
              (list
               (make-gp "Mars" 500)
               (make-gp "Star" 200)
               (make-gp "Guy" 100)))
(define (sort-gp> logp)
  (cond
    [(empty? logp) '()]
    [(cons? logp)
     (insert-gp (first logp) (sort-gp> (rest logp)))]))


; GamePlayer List-of-game-players -> List-of-game-players
; inserts gp into sorted list-of-game-players
(check-expect (insert-gp (make-gp "Guy" 100) '())
              (list (make-gp "Guy" 100)))
(check-expect (insert-gp (make-gp "Guy" 100)
                      (list (make-gp "Mars" 500)
                            (make-gp "Star" 200)))
              (list
               (make-gp "Mars" 500)
               (make-gp "Star" 200)
               (make-gp "Guy" 100)))
(check-expect (insert-gp (make-gp "Star" 200)
                     (list (make-gp "Mars" 500)
                           (make-gp "Guy" 100)))
              (list
               (make-gp "Mars" 500)
               (make-gp "Star" 200)
               (make-gp "Guy" 100)))
(check-expect (insert-gp (make-gp "Guy" 100)
                      (list (make-gp "Star" 200)))
              (list
               (make-gp "Star" 200)
               (make-gp "Guy" 100)))
(check-expect (insert-gp (make-gp "Guy" 100) '())
              (list (make-gp "Guy" 100)))

(define (insert-gp gp logp)
  (cond
    [(empty? logp) (cons gp '())]
    [(cons? logp)
     (if
      (gp-score>? gp (first logp))
      (cons gp logp)
      (cons (first logp) (insert-gp gp (rest logp))))]))


; GamePlayer GamePlayer -> Boolean
; compares 2 gameplayers' scores and returns #true if the first gp score is
; greater than or equal to the seconds
; returns #false otherwise
(check-expect (gp-score>?
               (make-gp "Guy" 100)
               (make-gp "Star" 200))
              #false)
(check-expect (gp-score>?
               (make-gp "Star" 200)
               (make-gp "Guy" 100))
               #true)
(check-expect (gp-score>?
               (make-gp "Guy" 100)
               (make-gp "Geechy" 100))
              #true)
(define (gp-score>? gp1 gp2)
  (>= (gp-score gp1) (gp-score gp2)))






     
     
      
  