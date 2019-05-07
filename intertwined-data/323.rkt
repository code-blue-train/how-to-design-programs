;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |323|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct no-info [])
(define NONE (make-no-info))
 
(define-struct node [ssn name left right])
; A BT (short for BinaryTree) is one of:
; – NONE
; – (make-node Number Symbol BT BT)


(define BST-1
  (make-node  15  'd  NONE
              (make-node    24 'i NONE NONE)))

(define BST-2
  (make-node 20 'a
             (make-node 50 'b NONE
                        (make-node 80 'c NONE NONE))
             NONE))

(define BST-3
  (make-node  15  'd
              (make-node    87 'h NONE NONE)
              NONE))


; Binary Tree Number -> Boolean
; consumes a Binary Tree (bt) and produces #true if number n occurs in the bt
; otherwise produces #false
(check-expect (contains-bt? BST-1 20) #f)
(check-expect (contains-bt? BST-2 20) #t)
(check-expect (contains-bt? BST-3 87) #t)
(define (contains-bt? bt n)
  (cond
    [(no-info? bt) #f]
    [else
     (or
      (equal? n (node-ssn bt))
      (contains-bt? (node-left bt) n)
      (contains-bt? (node-right bt) n))]))

; Binary Tree (BT) Number -> Number
; consumes a BT and a ssn number n and if the BT contains a node structure
; whose ssn field is n, then produce the name field in that node; otherwise
; produce #false
(check-expect (search-bt BST-1 20) #false)
(check-expect (search-bt BST-2 50) 'b)
(check-expect (search-bt BST-3 87) 'h)
(define (search-bt BT n)
  (cond
    [(no-info? BT) #false]
    [(= (node-ssn BT) n) (node-name BT)]
    [else
     (if
      (contains-bt? (node-left BT) n)
      (search-bt (node-left BT) n)
      (search-bt (node-right BT) n))]))
     
     
       