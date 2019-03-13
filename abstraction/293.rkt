;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |293|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 293. Develop found?, a specification for the find function:
; X [List-of X] -> [Maybe [List-of X]]
; returns the first sublist of l that starts
; with x, #false otherwise
; i struggled with understanding functions that generate nameless functions
; and used the solution from https://github.com/code-blue-train/HtDP2e-workthrough
; for this exercise
(check-satisfied (find 2 '(1 2 3))
                 (found? 2 '(1 2 3)))

(define (find x l)
  (cond
    [(empty? l) #false]
    [else
     (if (equal? (first l) x)
         l
         (find x (rest l)))]))

(check-expect [(found? 2 '(1 2 3)) '(2 3)] #true)
(check-expect [(found? "a" '("b" "c")) #false] #false)
(define (found? x l)
  (lambda (lx)
    (cond
      [(false? lx) (not (member? x l))]
      [(< (length l) (length lx)) #false]
      [else
       (local (; [List-of X] -> String
               (define (char-list ls)
                 (map number->string ls))

               ; l and lx converted to strings
               (define lstr
                 (implode (char-list l)))
               (define lxstr
                 (implode (char-list lx))))
         (string=? lxstr
                   (substring lstr (sub1 (length lx)))))])))
                 
    