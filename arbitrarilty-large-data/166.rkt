;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |166|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct work [employee rate hours])
; A (piece of) Work is a structure: 
;   (make-work String Number Number)
; interpretation (make-work n r h) combines the name 
; with the pay rate r and the number of hours h

(define-struct work.v2 [eid employee rate hours])
; A (piece of) Work.v2 is a structure: 
;   (make-work Number String Number Number)
; interpretation (make-work i n r h) combines the employee id, name 
; with the pay rate r and the number of hours h

; Low (short for list of works) is one of: 
; – '()
; – (cons Work Low)
; interpretation an instance of Low represents the 
; hours worked for a number of employees

(define-struct paycheck [employee amount])
; A paycheck is a structure:
; (make-paycheck String Number)
; interpretation (make-paycheck n a) combines an employee name
; and the amount the employee is to be paid

(define-struct paycheck.v2 [eid employee amount])
; A paycheck.v2 is a structure:
; (make-paycheck Number String Number)
; interpretation (make-paycheck n a) combines an employee id, employee name
; and the amount the employee is to be paid

; List-of-paychecks is one of;
; '()
; (cons Paycheck List-of-paychecks
; intepretation an instance of paycheck contains string for employee name
; and the amount the employee is to be paid


; Low -> List-of-numbers
; computes the weekly wages for the given records
(define (wage*.v2 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low)
     (cons (wage.v2 (first an-low))
          (wage*.v2 (rest an-low)))]))

; Work -> Number
; intepretation consumes work structure w and produces rate multiplied by hours
(define (wage.v2 w)
  (* (work-rate w) (work-hours w)))

; Work -> Paycheck
; intepretation consumes work and produces a paycheck which
; is the employee's name and amount to pay
(define (wage.v3 w)
  (make-paycheck (work-employee w)
                 (* (work-rate w) (work-hours w))))

; Low -> Lop
; intepretation consumes a low and computes a list of paychecks from it, one per record
(check-expect (wage*.v3 '()) '())
(check-expect (wage*.v3 (cons (make-work "Django" 18.00 34)
                              (cons (make-work "Lefty" 45.50 60) '())))
              (cons (make-paycheck "Django" 612)
                    (cons (make-paycheck "Lefty" 2730) '())))
(define (wage*.v3 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low)
     (cons (wage.v3 (first an-low))
          (wage*.v3 (rest an-low)))]))

; Work.v2 -> Paycheck.v2
; intepretation consumes work.v2 and computes paycheck.v2
(define (wage.v4 w)
  (make-paycheck.v2 (work.v2-eid w) (work.v2-employee w)
                 (* (work.v2-hours w) (work.v2-rate w))))

; Low.v2 -> Lop.v2
; interpretation consumes a list of work.v2 and produces a list of paycheck.v2
(check-expect (wage*.v4 '()) '())
(check-expect (wage*.v4 (cons (make-work.v2 1 "Django" 18.00 34)
                              (cons (make-work.v2 2 "Lefty" 45.50 60) '())))
              (cons (make-paycheck.v2 1 "Django" 612)
                    (cons (make-paycheck.v2 2 "Lefty" 2730) '())))
(define (wage*.v4 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low)
     (cons (wage.v4 (first an-low))
          (wage*.v4 (rest an-low)))]))




                 
            