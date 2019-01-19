;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |176|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

; A Matrix is one of: 
;  – (cons Row '())
;  – (cons Row Matrix)
; constraint all rows in matrix are of the same length
 
; A Row is one of: 
;  – '() 
;  – (cons Number Row)

(define row1 (cons 11 (cons 12 '())))
(define row2 (cons 21 (cons 22 '())))
(define mat1 (cons row1 (cons row2 '())))
(define tam1 (cons
              (cons 11 (cons 21 '()))
              (cons
               (cons 12 (cons 22 '())) '())))
                    
(define mat2 (cons (cons 12 (cons 13 (cons 14 '())))
               (cons
                (cons 15 (cons 16 (cons 17 '()))) '())))

(define tam2 (cons
              (cons 12 (cons 15 '()))
              (cons
               (cons 13 (cons 16 '()))
               (cons
                (cons 14 (cons 17 '())) '()))))
               
(check-expect (transpose mat1) tam1)
(check-expect (transpose mat2) tam2)
 
(define (transpose lln)
  (cond
    [(empty? (first lln)) '()]
    [else (cons (first* lln) (transpose (rest* lln)))]))


; Matrix -> List-of-numbers
; intepretation consumes a matrix and produces the first column as a list of numbers; 
(check-expect (first* mat1) (cons 11 (cons 21 '())))
(check-expect (first* mat2) (cons 12 (cons 15 '())))
(define (first* lln)
  (cond
    [(empty? lln) '()]
    [else
     (cons (first (first lln))
           (first* (rest lln)))]))

; Matrix -> Matrix
; interpretation consumes a matrix and removes the first column.
(check-expect (rest* mat1)
              (cons
               (cons 12 '())
               (cons
                (cons 22 '()) '())))
        
(check-expect (rest* mat2)
             (cons
              (cons 13 (cons 14 '()))
              (cons
               (cons 16 (cons 17 '())) '())))
(define (rest* lln)
  (cond
    [(empty? lln) '()]
    [else
      (cons (rest (first lln))
           (rest* (rest lln)))]))
                 
   
