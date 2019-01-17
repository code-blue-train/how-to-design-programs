;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |169|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 170. Here is one way to represent a phone number:
(define-struct phone [area switch four])
; A Phone is a structure: 
;   (make-phone Three Three Four)
; A Three is a Number between 100 and 999. 
; A Four is a Number between 1000 and 9999.

; Design the function replace. It consumes and produces a list of Phones.
; It replaces all occurrence of area code 713 with 281.

; List-of-phones -> List-of-phones
; intepretation consumes a list of phones and produces a list of phones
; with all occurrences of area code 713 replaced with 281
(check-expect (replace '()) '())
(check-expect (replace (cons (make-phone 713 100 1000) '()))
              (cons (make-phone 281 100 1000) '()))
(check-expect (replace (cons (make-phone 100 100 1000) '()))
              (cons (make-phone 100 100 1000) '()))
(check-expect (replace (cons (make-phone 713 111 1111)
                             (cons (make-phone 555 555 5555) '())))
              (cons (make-phone 281 111 1111)
                    (cons (make-phone 555 555 5555) '())))
(define (replace lop)
  (cond
    [(empty? lop) '()]
    [(cons? lop)
     (cons (replace-ac (first lop))
          (replace (rest lop)))]))


; Phone -> Phone
; intepretation consumes a phone and produces a phone with 718 replaced with 218
; otherwise returns produces same phone
(define (replace-ac p)
  (cond
    [(= (phone-area p) 713) (make-phone 281 (phone-switch p) (phone-four p))]
    [else p]))
   

