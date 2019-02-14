;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |262|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 262. Design the function identityM, which creates diagonal squares of 0s and 1s:
; Linear algebra calls these squares identity matrices.
; Use the structural design recipe and exploit the power of local.
; wish list:
; make a variable number of lists based on an input number
; given an input number make a list with that many items
; make one item in the list a 1 based on a natural number
; 

; List-of-list-of-Numbers is one of:
; (cons (cons Number '()) '()))
; (cons (cons Numbber '()  List-of-list-of-Numbers)

; Number -> List-of-list-of-Numbers
; comsumes a number n and creates a list-of-list-of-numbers of diagonal squares
; of 0s and 1s based on the n

(check-expect (identityM 1)
              (list (list 1)))
(check-expect (identityM 3)
              (list
               (list 1 0 0)
               (list 0 1 0)
               (list 0 0 1)))
(check-expect (identityM 5)
              (list
               (list 1 0 0 0 0)
               (list 0 1 0 0 0)
               (list 0 0 1 0 0)
               (list 0 0 0 1 0)
               (list 0 0 0 0 1)))
(define (identityM n)
  (local (
          ; Store n as local nn for reuse
          (define nn n)
          ; 1. create n # of sub-lists based n
          ; Number -> List-of-list-of numbers
          (define (generate-lists n)
            (if
             (> n 0)
             (cons (list-items nn n)
                   (generate-lists (sub1 n)))
             '()))
          ; 2. create list with n items and a 1 in position n in the list
          ; Number -> List-of-numbers
          (define (list-items n nn)
            (if
             (> n 0)
             (if
              (= n nn)
              (cons 1 (list-items (sub1 n) nn))
              (cons 0 (list-items (sub1 n) nn)))
             '())))
    (generate-lists n)))

; here is a simpler solution provided by another github repo
; https://github.com/code-blue-train/HtDP2e-workthrough
; i looked for a build-list type function but for some reason over looked it in the docs
(define (identityM.v2 n)
  (local [;; N -> [List-of N]
          ;; produces a list of 0s with 1 at position k
          (define (build-row k)
            (append (make-list k 0)
                    '(1)
                    (make-list (- n k 1) 0)))]
    (build-list n build-row)))

(check-expect (identityM.v2 20)
              (identityM 20))
