;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/batch-io)

; exercise 27, 28, 29
(define fixed-cost 0)
(define attendee-cost 0.04)
(define base-attendance 120)
(define base-ticket-price 5.0)
(define attendance-change 15)
(define ticket-price-change 0.1)
(define profit-iter-price 0.1)


(define (attendees ticket-price)
  (- base-attendance (* (- ticket-price base-ticket-price)
                        (/ attendance-change ticket-price-change))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost (* attendee-cost (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;
(profit 1)
;511.2
(profit 2)
;937.2
(profit 3)
;1063.2
(profit 4)
;889.2
(profit 5)
;415.2

(define (improve-guess ticket-price)
  (+ ticket-price 0.1))

(define (good-enough? ticket-price prev-ticket-price)
  (< (profit ticket-price) (profit prev-ticket-price)))

(define (profit-iter profit-iter-price)
  (if (good-enough? profit-iter-price (- profit-iter-price ticket-price-change))
      (- profit-iter-price ticket-price-change)
      (profit-iter (improve-guess profit-iter-price)
                   )))

; best ticket price
(profit-iter profit-iter-price)
; 2.9

; exercise 29 (fixed cost constant changed from $180 to $0)

(profit 3)
;1243.2
(profit 4)
;1069.2
(profit 5)
;595.2

