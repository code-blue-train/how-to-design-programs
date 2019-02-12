;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |261|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 261. Consider the function definition in figure 101. Both clauses in the nested
; cond expression extract the first item from an-inv and both compute
; (extract1 (rest an-inv)). Use local to name this expression.
; Does this help increase the speed at which the function computes its result?
; Significantly? A little bit? Not at all?

(define-struct ir [name price])
; An IR is a structure:
;   (make-ir String Number)

(define IRL
  (list
   (make-ir 'x' .24)
   (make-ir 'y' .25)
   (make-ir 'z' .26)
   (make-ir 'a' 1.00)
   (make-ir 'b' 1.01)
   (make-ir 'c' 1.02)
   (make-ir 'd' 3.00)
   (make-ir 'e' .50)
   (make-ir 'f' .55)
   (make-ir 'g' .56)
   (make-ir 'h' .27)
   (make-ir 'j' .28)
   (make-ir 'i' .60)
   (make-ir 'k' .65)
   (make-ir 'l' .70)
   (make-ir 'm' 2.00)
   (make-ir 'n' 4.00)
   (make-ir 'o' 5.00)
   (make-ir 'p' .80)
   (make-ir 'q' .85)
   (make-ir 's' .90)
   (make-ir 't' .95)
   (make-ir 'u' .96)
   (make-ir 'v' 12.00)
   (make-ir 'w' 13.00)))
   

; Inventory -> Inventory
; creates an Inventory from an-inv for all
; those items that cost less than a dollar
; 31 or 32 ms
(define (extract1 an-inv)
  (cond
    [(empty? an-inv) '()]
    [else
     (cond
       [(<= (ir-price (first an-inv)) 1.0)
        (cons (first an-inv) (extract1 (rest an-inv)))]
       [else (extract1 (rest an-inv))])]))

; 31 ms
(define (extract1.v2 an-inv)
    (cond
    [(empty? an-inv) '()]
    [else
     (local ((define less-than-1.0 (extract1.v2 (rest an-inv))))
     (cond
       [(<= (ir-price (first an-inv)) 1.0)
        (cons (first an-inv) less-than-1.0)]
       [else (extract1.v2 less-than-1.0)]))]))

; no improvement in execution time by adding a local constant for the rest expression
; in extract1 rest is only called once depending on the result of the initial cond expression