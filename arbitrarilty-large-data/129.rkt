;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |129|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; exercise 129. Create BSL lists that represent
;a list of celestial bodies, say, at least all the planets in our solar system;

(cons "Mercury"
      (cons "Venus"
            (cons "Earth"
                  (cons "Mars"
                        (cons "Jupiter"
                              (cons "Saturn"
                                    (cons "Uranus"
                                          (cons "Neptune"
                                                '()))))))))


;a list of items for a meal, for example, steak, french fries, beans, bread, water, Brie cheese, and ice cream; and
(cons "Carrots"
      (cons "Bell peppers"
            (cons "Cucumbers"
                  (cons "Spinach"
                        (cons "Red onion"
                              (cons "Vinagrette"
                                    '()))))))

;a list of colors.
(cons "Red"
      (cons "Blue"
            (cons "Green"
                  (cons "Black"
                        (cons "White"
                              '())))))
                    

