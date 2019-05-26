;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |334|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct dir [name content])

; A Dir.v2 is a structure:
; (make-dir String LOFD)

; An LOFD (short for list of files and directories) is one of:
; - '()
; - (cons File.v2 LOFD)
; - (cons Dir.v2 LOFD)

; A File.v2 is a String

(define DIR
  (make-dir "TS"
            (list
             (make-dir "Text"
                       (list "part1" "part2" "part3"))
             "read!"
             (make-dir "Libs"
                       (list
                        (make-dir "Code"
                                  (list "hang" "draw"))
                        (make-dir "Docs"
                                  (list "read!")))))))

; LOFD -> Number
; consumes a LOFD and returns the count of files
(check-expect (how-many DIR) 7)
(check-expect (how-many '()) 0)
(check-expect (how-many
               (make-dir "Test" (list "one"))) 1)
(define (how-many d)  
  (local (; LOFD -> Number
          ; consumes a list-of files and directories and
          ; returns the count of files in the directory
          (define (how-many-lofd l)
            (cond
              [(empty? l) 0]
              [else
               (+
                (cond
                  [(string? (first l)) 1]
                  [(dir? (first l)) (how-many (first l))])
                (how-many-lofd (rest l)))])))
    (cond
      [(empty? d) 0]
      [else
       (how-many-lofd (dir-content d))])))
                   
    

   
     
            
            
                             
             
          
  
                  
                  
                 
                             

                  
                  
                             

