;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 188.v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct email [message from date])
; An Email Message is a structure: 
;   (make-email String String Number)
; interpretation (make-email f d m) represents text m 
; sent by f, d seconds after the beginning of time

; List-of-emails is one of:
; '()
; email
; (cons email List-of-emails)


;Also develop a program that sorts lists of email messages by name.
; To compare two strings alphabetically, use the string<? primitive.


(define e1 (make-email "how are you?" "Jay Z" 100))
(define e2 (make-email "I am great!  How are you???" "Biggie" 200))
(define e3 (make-email "Hanging tough.  When will I see you again guy?" "Jay Z" 300))
(define e4 (make-email "Don't email me again!" "Diane" 200))

(define el1 (cons e1 (cons e2 (cons e3 '()))))


; List-of-emails -> List-of-emails
; list-of-emails (loe) ordered descending by email message name 
(check-expect (sort-en> '()) '())
(check-expect (sort-en>
               (cons e1 '()))
              (cons e1 '()))
(check-expect (sort-en>
               (cons e1 (cons e2 '())))
              (cons e1 (cons e2 '())))
(check-expect (sort-en>
               (cons e2 (cons e1 '())))
              (cons e1 (cons e2 '())))
(check-expect (sort-en>
               (cons e4 (cons e1 (cons e2 '()))))
              (cons e1 (cons e4 (cons e2 '()))))
               
(define (sort-en> loe)
  (cond
    [(empty? loe) '() ]
    [else
     (insert-e (first loe) (sort-en> (rest loe)))]))

; Email List-of-emails -> List-of-emails
(check-expect (insert-e
               e1 '())
              (cons e1 '()))
(check-expect (insert-e
               e1 (cons e2 '()))
              (cons e1 (cons e2 '())))
(check-expect (insert-e
               e1 (cons e3 (cons e2 '())))
              (cons e1 (cons e3 (cons e2 '()))))
(check-expect (insert-e
               e2 (cons e3 (cons e4 '())))
              (cons e3 (cons e4 (cons e2 '()))))
(define (insert-e e loe)
  (cond
    [(empty? loe) (cons e '())]
    [else
     (if
      (email-n>? e (first loe))
      (cons e loe)
      (cons (first loe) (insert-e e (rest loe))))]))


; Email Email -> Email
; compares email e1 with email e2 and if e1 name is greater than or equal to e2
; then return #true; otherwise, return #false
(check-expect (email-n>? e1 e2)
              #true)
(check-expect (email-n>? e2 e1)
              #false)
(check-expect (email-n>? e1 e3)
              #true)
(define (email-n>? e1 e2)
  (or
   (string>? (email-from e1) (email-from e2))
   (string=? (email-from e1) (email-from e2))))
  
     

             