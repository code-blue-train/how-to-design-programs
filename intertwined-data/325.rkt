;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |325|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct no-info [])
(define NONE (make-no-info))
 
(define-struct node [ssn name left right])
; A BT (short for BinaryTree) is one of:
; – NONE
; – (make-node Number Symbol BT BT)

(define BST-1
  (make-node 4 'a
             (make-node 2 'b NONE NONE)
             (make-node 5 'c NONE NONE)))
(define BST-2
  (make-node 4 'a
             (make-node 2 'b
                        (make-node 1 'c NONE NONE)
                        (make-node 3 'd NONE NONE))
             (make-node 5 'e NONE NONE)))
(define BST-3
  (make-node 63 'a
             (make-node 29 'b
                        (make-node 15 'c
                                   (make-node 10 'd NONE NONE)
                                   (make-node 24 'f NONE NONE))
                        NONE)
             (make-node 89 'g
                        (make-node 77 'h NONE NONE)
                        (make-node 95 'i NONE
                                   (make-node 99 'j NONE NONE)))))

; BST Number -> String
; consumes a Binary Search Tree (BST) and number n and if the tree contains
; a node whose ssn field is in n, then produce the value of the name field
; for that node otherwise produce NONE
(check-expect (search-bst BST-1 10) NONE)
(check-expect (search-bst BST-1 4) 'a)
(check-expect (search-bst BST-2 3) 'd)
(check-expect (search-bst BST-3 99) 'j)
(define (search-bst BST n)
  (cond
    [(no-info? BST) NONE]
    [(equal? (node-ssn BST) n) (node-name BST)]
    [else
     (if (< n (node-ssn BST))
         (search-bst (node-left BST) n)
         (search-bst (node-right BST) n))]))
         
      
 