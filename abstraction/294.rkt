;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |294|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 294. Develop is-index?, a specification for index:
; X [List-of X] -> [Maybe N]
; determine the index of the first occurrence
; of x in l, #false otherwise
(check-satisfied (index 1 '(1 2)) (is-index? 1 '(1 2)))
(check-satisfied (index "a" '("b" "c")) (is-index? "a" '("b" "c")))
(check-satisfied (index #f '(#t #t)) (is-index? #f '(#t #t)))

(define (index x l)
  (cond
    [(empty? l) #false]
    [else (if (equal? (first l) x)
              0
              (local ((define i (index x (rest l))))
                (if (boolean? i) i (+ i 1))))]))


; [X] [List-of X] -> [[Maybe N] -> Boolean]
; if l0 is #f confirm that x is no a member of l
; if x is in list, than l0 is less than or equal to length of list l
; depending on x's data type, verify that x matches (list-ref l l0)
(check-expect [(is-index? 1 '()) #f] #f)
(check-expect [(is-index? 1 '(1 2)) 0] #t)
(check-expect [(is-index? "a" '("b" "c" "a")) 2] #t)
(check-expect [(is-index? #f '(#f #t)) 0] #t)
(define (is-index? x l)
  (lambda (l0)
    (cond
      [(empty? l) #f]
      [(false? l0) (not (member? x l))]
      [(> l0 (sub1 (length l))) #f]
      [else
       (cond
         [(boolean? x) (boolean=? x (list-ref l l0))]
         [(string? x) (string=? x (list-ref l l0))]
         [else
          (= x (list-ref l l0))])])))
