;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname cross-append-list-examples) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; [List-of Symbols] [List-of Numbers] -> [List-of [List of Symbol Number]]
; consumes a list of symbols and a list of numbers and produces
; all possible ordered pairs of symbols and numbers
(check-expect (cross '() '()) '())
(check-expect (cross '() '(1 2)) '())
(check-expect (cross '(a) '(1 2))
              '((a 1) (a 2)))
(check-expect (cross '(a b) '(1 2))
              '((a 1) (b 1) (a 2) (b 2)))
(define (cross l1 l2)
  (local (; [List-of Symbol] Number -> [List-of Symbol Number]
          (define (cross-l1 l i)
            (cond
              [(empty? l) '()]
              [else
                (append (list (list (first l) i))
                (cross-l1 (rest l) i))])))
    (foldr (lambda (i el)
             (append (cross-l1 l1 i) el)) '() l2)))

; example of building a list of lists using append and cons
(append
   (cons
   (append (cons (first '(a b)) '()) (cons 2 '())) '())
   (cons
   (append (cons (first '(b)) '()) (cons 2 '())) '()) '())

; same output as above but uses append and list
(append
   (append (list (list (first '(a b)) 2)) '())
   (append (list (list (first '(b)) 2)) '()) '())
     