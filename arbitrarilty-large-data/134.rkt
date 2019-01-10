;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |134|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 134. Develop the contains? function, which determines whether
; some given string occurs on a given list of strings.

; A List-of-names is one of: 
; – '()
; – (cons String List-of-names)
; interpretation a list of invitees, by last name

; List-of-names -> Boolean
; determines whether a given String is in alon (a-list-of-names)
(check-expect (contains? "test" '()) #false)
(check-expect (contains? "test" (cons "Find" '())) #false)
(check-expect (contains? "test"(cons "test" '())) #true)
(check-expect (contains? "test" (cons "A" (cons "test" (cons "C" '())))) #true)
(check-expect (contains? "test" (cons "A" (cons "B" (cons "C" '())))) #false)
;header
(define (header-contains? s alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon) ...]))

;template
(define (template-contains? s alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (... (string=? s (first alon)) ... (rest alon) ...)]))
  
(define (contains? s alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (or (string=? s (first alon))
         (contains? s (rest alon)))]))

(define CONS-STR-TEST
(cons "Fagan"
  (cons "Findler"
    (cons "Fisler"
      (cons "test"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '()))))))))


(contains? "test" CONS-STR-TEST)