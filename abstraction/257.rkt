;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |257|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; [X Y] [X Y -> Y] Y [List-of X] -> Y
; f*oldl works just like foldl
(check-expect (f*oldl cons '() '(a b c))
              (foldl cons '() '(a b c)))
(check-expect (f*oldl / 1 '(6 3 2))
              (foldl / 1 '(6 3 2)))
(define (f*oldl f e l)
  (foldr f e (reverse l)))


; exercise 257 Design build-l*st, which works just like build-list.
; Constructs a list by applying f to the numbers between 0 and (- n 1):
; [X Y] [List-of X] [X Y -> Y] [List-of Y]
(check-expect (build-l*st 3 add1)
              '(1 2 3))
(check-expect (build-l*st 5 sub1)
              '(-1 0 1 2 3))
(define (build-l*st n f)
  (cond
    [(= n 0) '()]
    [else
     (add-at-end (f (sub1 n))
                 (build-l*st (sub1 n) f))]))



; [X] [List-of X] -> [List-of X]
; append x to the end of l
(define (add-at-end x l)
  (cond
    [(empty? l) (cons x '())]
    [else (cons (first l) (add-at-end x (rest l)))]))


         