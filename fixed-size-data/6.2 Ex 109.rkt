;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |6.2 Ex 109|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; World program that recognizes a pattern in a sequence of KeyEvents
; and displays colored images accordingly

; image constants

(define WHITE-REC
  (rectangle 100 100 "solid" "white"))

(define YELLOW-REC
  (rectangle 100 100 "solid" "yellow"))

(define RED-REC
  (rectangle 100 100 "solid" "red"))

(define GREEN-REC
  (rectangle 100 100 "solid" "green"))

; ExpectsToSee.v2 is a structure
; (make-ExpectToSee.v2 String)
; acceptable states:
; AA initial state
; BB state after valid initial keyevent
; DD state after valid subsequent keyevents
; ER state after any unacceptable keyevents
(define-struct ExpectsToSee.v2 [state])

(define init-state (make-ExpectsToSee.v2 "AA"))

; ExpectToSee.v2 -> Image
(check-expect (render (make-ExpectsToSee.v2 "AA")) WHITE-REC)
(check-expect (render (make-ExpectsToSee.v2 "BB")) YELLOW-REC)
(check-expect (render (make-ExpectsToSee.v2 "DD")) GREEN-REC)
(check-expect (render (make-ExpectsToSee.v2 "ER")) RED-REC)
(define (render ets)
  (cond
    [(string=? (ExpectsToSee.v2-state ets) "AA") WHITE-REC]
    [(string=? (ExpectsToSee.v2-state ets) "BB") YELLOW-REC]
    [(string=? (ExpectsToSee.v2-state ets) "DD") GREEN-REC]
    [(string=? (ExpectsToSee.v2-state ets) "ER") RED-REC]
  ))

; String -> ExpectToSee.v2
; intepretation if state is AA and string is is "a"
; them change state to BB else change stae to ER
(check-expect (process-AA "a") (make-ExpectsToSee.v2 "BB"))
(check-expect (process-AA "c") (make-ExpectsToSee.v2 "ER"))
(check-expect (process-AA " ") (make-ExpectsToSee.v2 "ER"))
(define (process-AA s)
  (if (string=? "a" s)
      (make-ExpectsToSee.v2 "BB")
      (make-ExpectsToSee.v2 "ER")
      )
  )
; String -> ExpectToSee.v2
; intepretation if state is BB and string s is b or c change state to DD
; if s is d change state to DD; for all s change state to ER
(check-expect (process-BB "d") (make-ExpectsToSee.v2 "DD"))
(check-expect (process-BB "b") (make-ExpectsToSee.v2 "BB"))
(check-expect (process-BB "c") (make-ExpectsToSee.v2 "BB"))
(check-expect (process-BB "x") (make-ExpectsToSee.v2 "ER"))
(check-expect (process-BB " ") (make-ExpectsToSee.v2 "ER"))
(define (process-BB s)
  (cond
    [(string=? "d" s) (make-ExpectsToSee.v2 "DD")]
    [(or (string=? "b" s) (string=? "c" s)) (make-ExpectsToSee.v2 "BB")]
    [else (make-ExpectsToSee.v2 "ER")]
    ))

; ExpectToSee.v2 -> ExpectToSee.v2
(define (key-event ets ke)
  (cond
    [(or
      (string=? (ExpectsToSee.v2-state ets) "AA")
      (string=? (ExpectsToSee.v2-state ets) "DD")
      ) (process-AA ke)]
    [(string=? (ExpectsToSee.v2-state ets) "BB") (process-BB ke)]
    [(string=? (ExpectsToSee.v2-state ets) "ER")
      (if (string=? "a" ke)
          (process-AA ke)
          (make-ExpectsToSee.v2 "ER"))
      ]
     [else (make-ExpectsToSee.v2 "ER")]
     ))

; String -> Boolean
; interpretation consumes string s and when s is DD, which is the final state,
; return #true else return #false
(check-expect (exit-state? (make-ExpectsToSee.v2 "DD")) #true)
(check-expect (exit-state? (make-ExpectsToSee.v2 "AA")) #false)
(check-expect (exit-state? (make-ExpectsToSee.v2 "BB")) #false)
(check-expect (exit-state? (make-ExpectsToSee.v2 "ER")) #false)
(define (exit-state? ets)
  (string=? (ExpectsToSee.v2-state ets) "DD"))

; World
(define (letter-seq ets)
  (big-bang ets
    [on-draw render]
    [on-key key-event]
    ))
              