;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |188|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 188. Design a program that sorts lists of emails by date:

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
; list-of-emails (loe) ordered descending by number n which is the # of
; seconss after the beginning of time
(check-expect (sort-el> '()) '())
(check-expect (sort-el>
               (cons e1 '()))
              (cons e1 '()))
(check-expect (sort-el>
               (cons e1 (cons e2 '())))
              (cons e2 (cons e1 '())))
(check-expect (sort-el>
               (cons e2 (cons e1 '())))
              (cons e2 (cons e1 '())))
(check-expect (sort-el>
               (cons e2 (cons e1 (cons e3 '()))))
              (cons e3 (cons e2 (cons e1 '()))))
(check-expect (sort-el>
               (cons e4 (cons e1 (cons e2 '()))))
              (cons e4 (cons e2 (cons e1 '()))))
               
(define (sort-el> loe)
  (cond
    [(empty? loe) '() ]
    [else
     (insert-e (first loe) (sort-el> (rest loe)))]))

; Email List-of-emails -> List-of-emails
(check-expect (insert-e
               e1 '())
              (cons e1 '()))
(check-expect (insert-e
               e1 (cons e2 '()))
              (cons e2 (cons e1 '())))
(check-expect (insert-e
               e1 (cons e3 (cons e2 '())))
              (cons e3 (cons e2 (cons e1 '()))))
(check-expect (insert-e
               e2 (cons e3 (cons e4 '())))
              (cons e3 (cons e2 (cons e4 '()))))
(define (insert-e e loe)
  (cond
    [(empty? loe) (cons e '())]
    [else
     (if
      (email-d>? e (first loe))
      (cons e loe)
      (cons (first loe) (insert-e e (rest loe))))]))


; Email Email -> Email
; compares email e1 with email e2 and if e1 is greater than or equal to e2
; then return #true; otherwise, return #false
(check-expect (email-d>? e1 e2)
              #false)
(check-expect (email-d>? e2 e1)
              #true)
(check-expect (email-d>? e2 e4)
              #true)
(define (email-d>? e1 e2)
  (>= (email-date e1) (email-date e2)))
  
     

             