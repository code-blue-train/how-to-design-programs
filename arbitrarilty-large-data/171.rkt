;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |171|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

; list-of-strings is one of:
; '()
; (cons String List-of-strings)

; Piet Hien's poem represented as a list-of-strings:
; each line as a string:

(define LOS-LINE

(cons "TTT"
      (cons " "
            (cons "Put up in a place"
                  (cons "where it's easy to see"
                        (cons "the cryptic admonishment"
                              (cons " "
                                    (cons "T.T.T."
                                          (cons " "
                                                (cons "When you feel how depressingly"
                                                      (cons "slowly you climb,"
                                                            (cons "it's well to remember that"
                                                                  (cons "Things Take Time."
                                                                        (cons " "
                                                                              (cons "Piet Hein" '())))))))))))))))

(define LOS-WORD
  (cons "TTT"
        (cons "Put"
              (cons "up"
                    (cons "in"
                          (cons "a"
                                (cons "place"
                                      (cons "where"
                                            (cons "it's"
                                                  (cons "easy"
                                                        (cons "to"
                                                              (cons "see"
                                                                    (cons "the"
                                                                          (cons "cryptic"
                                                                                (cons "admonishment"
                                                                                      (cons "T.T.T."
                                                                                            (cons "When"
                                                                                                  (cons "you"
                                                                                                        (cons "feel"
                                                                                                              (cons "how"
                                                                                                                    (cons "depressingly"
                                                                                                                          (cons "slowly"
                                                                                                                                (cons "you"
                                                                                                                                      (cons "climb"
                                                                                                                                            (cons "it's"
                                                                                                                                                  (cons "well"
                                                                                                                                                        (cons "to"
                                                                                                                                                              (cons "remember"
                                                                                                                                                                    (cons "that"
                                                                                                                                                                          (cons "Things"
                                                                                                                                                                                (cons "Take"
                                                                                                                                                                                      (cons "Time"
                                                                                                                                                                                            (cons "."
                                                                                                                                                                                                  (cons "Piet"
                                                                                                                                                                                                        (cons "Hein" '())))))))))))))))))))))))))))))))))))
(define LLS
(cons
 (cons "TTT" '())
 (cons
  '()
  (cons
   (cons "Put" (cons "up" (cons "in" (cons "a" (cons "place" '())))))
   (cons
    (cons "where" (cons "it's" (cons "easy" (cons "to" (cons "see" '())))))
    (cons
     (cons "the" (cons "cryptic" (cons "admonishment" '())))
     (cons
      '()
      (cons
       (cons "T.T.T" '())
       (cons
        '()
        (cons
         (cons "When" (cons "you" (cons "feel" (cons "how" (cons "depressingly" '())))))
         (cons
          (cons "slowly" (cons "you" (cons "climb," '())))
          (cons
           (cons "it's" (cons "well" (cons "to" (cons "remember" (cons "that" '())))))
           (cons
            (cons "Things" (cons "Take" (cons "Time" '())))
            (cons '() (cons (cons "Piet" (cons "Hien" '())) '())))))))))))))))
                                              


       


                                                                                                                                                                                            
                                                                          
                                            

              