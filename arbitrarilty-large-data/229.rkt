;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |229|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)


; An FSM is one of:
;   – '()
;   – (cons Transition FSM)
 
(define-struct transition [current next])
; A Transition is a structure:
;   (make-transition FSM-State FSM-State)

(define-struct ktransition [current key next])
; A Transition.v2 is a structure:
;   (make-ktransition FSM-State KeyEvent FSM-State)

; FSM-State is a Color.
 
; interpretation An FSM represents the transitions that a
; finite state machine can take from one state to another 
; in reaction to keystrokes

(define fsm-key-pattern
  (list (make-ktransition "white" "a" "yellow")
        (make-ktransition "yellow" "b" "yellow")
        (make-ktransition "yellow" "c" "yellow")
        (make-ktransition "yellow" "d" "green")))

(define-struct fs [fsm current])
; A SimulationState.v2 is a structure:
; (make-fs FSM FSM-State)

(define fsm-traffic
  (list (make-transition "red" "green")
        (make-transition "green" "yellow")
        (make-transition "yellow" "red")))

(define test-fs
  (make-fs  fsm-traffic "red"))

(define bm-machine
  (list (make-transition "black" "white")
        (make-transition "white" "black")))

; FSM-State FSM-State -> Boolean
; consumes fsm-state s1 and fsm-state s2 and if the 2 are equal produces #true
; otherwise produces #false
(check-expect (state=? "red" "green") #false)
(check-expect (state=? "green" "green") #true)
(define (state=? s1 s2)
  (string=? s1 s2))

; FSM -> ???
; match the keys pressed with the given FSM 
(define (simulate.v2 an-fsm s0)
  (big-bang (make-fs an-fsm s0)
    [to-draw state-as-colored-square]
    [on-key find-next-state]))

; SimulationState.v2 -> Image
; renders a world state as an image
(check-expect (state-as-colored-square
               (make-fs fsm-key-pattern "white"))
               (square 100 "solid" "white"))
               
(define (state-as-colored-square an-fsm)
  (square 100 "solid" (fs-current an-fsm)))

; SimulationState.v2 KeyEvent -> SimulationState.v2
; finds the next state from ke and cs

(define (find-next-state an-fsm ke)
  (cond
    [(string=? ke "a" ) (make-fs fsm-key-pattern "yellow")]
    [(string=? ke "b") (make-fs fsm-key-pattern "yellow")]
    [(string=? ke "c") (make-fs fsm-key-pattern "yellow")]
    [(string=? ke "d") (make-fs fsm-key-pattern "green")]
    [else
     (make-fs fsm-key-pattern "white")]))
                       
; FSM FSM-State -> FSM-State
; finds the state representing current in transitions
; and retrieves the next field
(check-expect (find fsm-traffic "yellow") "red")
(check-expect (find fsm-traffic "red") "green")
(check-expect (find fsm-traffic "green") "yellow")
(check-expect (find fsm-traffic "black") "not found: black")

(define (find an-fsm state)
  (cond
    [(empty? an-fsm) (string-append "not found: " state) ]
    [else
     (if
      (state=? (transition-current (first an-fsm)) state)
      (transition-next (first an-fsm))
      (find (rest an-fsm) state))]))