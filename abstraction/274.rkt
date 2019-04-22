;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |274|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 274. Use existing abstractions to define the prefixes and suffixes
; functions from exercise 190. Ensure that they pass the same tests as the original function.

; [List-of 1Strings] -> [List-of-list-of 1Strings]
; produces prefixes from a list-of 1Strings
(check-expect (prefixes (list "a"))
              (list
              (list "a")))
(check-expect (prefixes (list "a" "b" "c"))
              (list
               (list "a")
               (list "a" "b")
               (list "a" "b" "c")))
(define (prefixes lo1s)
  (local (; 1String [List-of [List-of 1String]]
          ;      -> [List-of [List-of 1String]]
          ; append s to all lists in l
          (define (combine s l)
            (local (; [List-of 1String] -> [List-of 1String]
                    ; add s to beginning of l
                    (define (prepend ls) ;
                      (cons s ls)))                
              (map prepend (cons '() l)))))
    (foldr combine '() lo1s)))


; [List-of 1Strings] -> [List-of-list-of 1Strings]
; produces suffixes from a list-of 1Strings
(check-expect (suffixes (list "a"))
              (list
              (list "a")))
(check-expect (suffixes (list "a" "b" "c"))
              (list
               (list "c")
               (list "b" "c")
               (list "a" "b" "c")))
(define (suffixes lo1s)
  (local (; 1String [List-of [List-of 1String]]
          ;      -> [List-of [List-of 1String]]
          ; append s to all lists in l
          (define (combine s l)
            (local (; [List-of 1String] -> [List-of 1String]
                    ; add s to end of ls
                    (define (append-to-end ls)
                      (append ls (list s))))                    
              (map append-to-end (cons '() l))))) 
    (foldl combine '() lo1s)))