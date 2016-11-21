;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |BU111 - interest|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; n - number of payments
;; r - interest rate
;; pmt - payment
;; goal - goal_value

(define (future-value-pmt pmt r n)
  (* pmt (/ (- (expt (+ 1 r) n) 1) r)))

(define (future-value-goal goal r n)
  (/ goal (/ (- (expt (+ 1 r) n) 1) r)))

(define (present-value-pmt pmt r n)
  (* pmt (/ (- 1 (expt (+ 1 r) (- n))) r)))

(define (present-value-goal goal r n)
  (/ goal (/ (- 1 (expt (+ 1 r) (- n))) r)))

(define (present-value-perp pmt r)
  (/ pmt r))

(define (present-value-single-amount amount r n)
  (/ amount (expt (+ 1 r) n)))

(define (future-value-single-amount amount r n)
  (* amount (expt (+ 1 r) n)))

;; Annually -> m,p = 1
;; Semi-annually -> m,p = 2
;; Quarterly -> m,p = 4
;; Monthly -> m,p = 12
;; m - # compounding 
;; p - # payments

(define (effective-rate r m p)
  (- (expt (+ 1 (/ r m)) (/ m p)) 1))

(define (effective-n n payments)
  (* n payments))
