;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |241|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 241. Compare the definitions for NEList-of-temperatures and NEList-of-Booleans.
; Then formulate an abstract data definition NEList-of.

; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures


; NEList-of-Booleans
; is one of:
; (cons Boolean '())
; (cons Boolean NEList-of-booleans)
; interpretation non-emtpy list of booleans


; A NEList-of [TYPE] is one of:
; (cons [TYPE] '())
; (cons [TYPE] NElist-of [TYPE])
; interpretation non-emtpy list of [TYPE]