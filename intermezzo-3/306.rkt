;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |306|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/abstraction)


; Number -> [List-of Numbers]
; creates the list (list 0 ... (- n 1)) for any natural number n;
(check-expect (create-lon-0 1) (list 0))
(check-expect (create-lon-0 5) (list 0 1 2 3 4))
(define (create-lon-0 n)
  (for/list ([i n]) i))

; Number -> [List-of Numbers]
; creates the list (list 0 ... (- n 1)) for any natural number n;
(check-expect (create-lon-1 1) (list 1))
(check-expect (create-lon-1 5) (list 1 2 3 4 5))
(define (create-lon-1 n)
  (for/list ([i n]) (+ i 1)))

; Number ->[List-of Numbers]
; creates the list (list 1 1/2 ... 1/n) for any natural number
(check-expect (create-lon-div 1) (list 1))
(check-expect (create-lon-div 5) (list 1 1/2 1/3 1/4 1/5))
(define (create-lon-div n)
  (for/list ([i n]) (/ 1 (+ i 1))))

; Number -> [List-of Numbers]
; creates the list of the first n even numbers
(check-expect (create-even 1) (list 0))
(check-expect (create-even 5) (list 0 2 4 6 8))
(define (create-even n)
  (for/list ([i n]) (* i 2)))

; Number -> [List-of [List-of Numbers]]
; consumes a number and produces diagonal squars of 0s and 1s
(check-expect (identityM 2)
              (list
               (list 1 0)
               (list 0 1)))
(check-expect (identityM 3)
              (list
               (list 1 0 0)
               (list 0 1 0)
               (list 0 0 1)))

(define (identityM n)
  (local (; Number -> [List-of [List-of Numbers]]
          ; returns n lists of (- n 1) 0s along with
          ; the number 1 moving 1 position left in each
          ; subsequent list
          (define (helper k)
            (for/list ([i n])
              (append (make-list i 0)
                    '(1)
                    (make-list (- n i 1) 0)))))
    (helper n)))


;[X] [X -> Y] -> [List-of Y]
; consumes a number n and a function F and calculates F between
; n and 0 inclusive
; constant for check-within delta parameter
(define CI .01)
(check-within (tabulate 2 sin)
              (tabulate-sin 2) CI)
(check-within (tabulate 2 sqrt)
              (tabulate-sqrt 2) CI)
(define (tabulate n F)
  (for/list ([i n]) (F i)))
; Number -> Number
; consumes a number and returns the square root of the number
(define (tabulate-sqrt n)
  (tabulate n sqrt))

; Number -> Number
; consumes a number and returns the sin of that number
(define (tabulate-sin n)
  (tabulate n sin))



