;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |337|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/abstraction)

(define-struct dir.v3 [name dirs files])

; A Dir.v3 is a structure:
; (make-dir.v3 String Number Boolean Dir* File*)

; a Dir* is one of:
; '()
; (cons Dir.v3 Dir*)

; A File* is one of:
; '()
; (cons File.v3 File*)

(define-struct file.v3 [name size content])
; A File.v3 is a structure:
; (make-file String Number String))

; An LOFD (short for list of files and directories) is one of:
; - '()
; - (cons File.v3 LOFD)
; - (cons Dir.v3 LOFD)

(define DIR
  (make-dir.v3 "TS"
                 (list (make-dir.v3 "Text" '()
                                 (list (make-file.v3 "part1" 99 "")
                                       (make-file.v3 "part2" 52 "")
                                       (make-file.v3 "part3" 17 "")))
                       (make-dir.v3 "Libs"
                                    (list (make-dir.v3 "Code" '()
                                                    (list (make-file.v3 "hang" 8 "")
                                                          (make-file.v3 "draw" 2 "")))
                                          (make-dir.v3 "Docs" '()
                                                       (list (make-file.v3 "read!" 19 "")))) '()))
                 (list (make-file.v3 "read!" 10 ""))))

(define DIR2
  (make-dir.v3 "Test" '()
                                           (list (make-file.v3 "one" 10 "")
                                                 (make-file.v3 "two" 20 ""))))
; LOFD - Number
; Consumes a list of directories and files and returns the number of files in the directory
;(check-expect (how-many DIR) 7)
(check-expect (how-many '()) 0)
(check-expect (how-many (make-dir.v3 "Test" '() '())) 0)
(check-expect (how-many DIR) 7)
(check-expect (how-many DIR2) 2)
(define (how-many dir)
  (cond
    [(empty? dir) 0]
    [else
     (+ (for/sum ([d (dir.v3-dirs dir)]) (how-many d))
        (length (dir.v3-files dir)))]))

                                  
    

   
     
            
            
                             
             
          
  
                  
                  
                 
                             

                  
                  
                             

