;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |319|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; S-expr Symbol Symbol -> S-expr
; consumes an S-expression s and two symbols, old os and new ns
; produces s with all occurrences of old replaced by new.
(define TEST-SL-1 '((hell) world))
(define TEST-SL-2 '((hello) world))
(check-expect (substitute '() 'a 'b) '())
(check-expect (substitute 'hello 'hello 'world) 'world)
(check-expect (substitute TEST-SL-1 'hell 'hello) TEST-SL-2)
(check-expect (substitute '(hey you) 'hey 'fuck) '(fuck you))
(check-expect (substitute '(((taco) taco) lover) 'taco 'burrito)
              '(((burrito) burrito) lover))
(define (substitute s os ns)
  (local (;
          (define (sub-sl s)
            (cond
              [(empty? s) '()]
              [else
               (cons (substitute (first s) os ns)
                     (sub-sl (rest s)))]))
          (define (sub-sexp s)
            (cond
              [(atom? s) (sub-symbol s)]
              [else
               (sub-sl s)]))
          (define (sub-symbol s)
            (if (and (symbol? s)
                     (symbol=? s os ))
             ns
             s)))
    (sub-sexp s)))
          

; An S-expr is one of: 
; – Atom
; – SL
 
; An SL is one of: 
; – '()
; – (cons S-expr SL)
          
; An Atom is one of:
; - Number
; - String
; - Symbol
(check-expect (atom? 10) #t)
(check-expect (atom? "s") #t)
(check-expect (atom? 's) #t)
(check-expect (atom? (lambda (x) (+ x 1))) #f)

(define (atom? a)
  (or
   (string? a)
   (number? a)
   (symbol? a)))