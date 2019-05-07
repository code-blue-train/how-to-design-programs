;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |324|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct no-info [])
(define NONE (make-no-info))
 
(define-struct node [ssn name left right])
; A BT (short for BinaryTree) is one of:
; – NONE
; – (make-node Number Symbol BT BT)
(define BT-1
  (make-node 4 'a
             (make-node 2 'b
                        (make-node 1 'c NONE NONE)
                        (make-node 3 'd NONE NONE))
             (make-node 5 'e NONE NONE)))
                        
(define BT-2
  (make-node 4 'a
             (make-node 2 'b
                        (make-node 1 'c NONE NONE)
                        (make-node 3 'd NONE NONE))
             (make-node 6 'e
                        (make-node 5 'f NONE NONE)
                        (make-node 7 'g NONE NONE))))
(define BT-3
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
(define BT-0
  (make-node 4 'a
                      (make-node 2 'b NONE NONE)
                      (make-node 5 'c NONE NONE)))
                                   
; BT -> [List-of Numbers]
; consumes a binary tree and produces the sequence of all the
; ssn numbers in the tree as they show up from left to right when
; looking at a tree drawing.
(check-expect (inorder NONE) '())
(check-expect (inorder BT-1)
              (list 1 2 3 4 5))
(check-expect (inorder BT-2)
              (list 1 2 3 4 5 6 7))
(define (inorder BT)
  (cond
    [(no-info? BT) '()]
    [else
     (append (inorder (node-left BT))
             (list (node-ssn BT))
             (inorder (node-right BT)))]))
                   
(inorder BT-0)
              