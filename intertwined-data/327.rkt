;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |327|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; BST Number Symbol -> BST
; consumes a BST B, a number N, and a symbol S.
; produces a BST that is just like B and that in place of one NONE subtree
; contains the node structure (make-node N S NONE NONE)
(check-expect (create-bst BST-1 6 'x)
              (make-node 4 'a
                         (make-node 2 'b NONE NONE)
                         (make-node 5 'c
                                    NONE
                                    (make-node 6 'x NONE NONE))))
(check-expect (create-bst BST-1 3 'x)
              (make-node 4 'a
                         (make-node 2 'b
                                    (make-node 3 'x NONE NONE)
                                    NONE)
                        (make-node 5 'c NONE NONE)))
(define (create-bst B N S)
  (cond
    [(no-info? B) (make-node N S NONE NONE)]
    [else
     (local ((define select-ssn (node-ssn B))
             (define select-name (node-name B))
             (define select-left (node-left B))
             (define select-right (node-right B)))
       (if (< N (node-ssn B))
           (make-node
            select-ssn select-name (create-bst select-left N S) select-right)
           (make-node
            select-ssn select-name select-left (create-bst select-right N S))))]))

     
                                  
              