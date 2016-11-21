;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |BU111 - investment|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (bond-ym coupon-rate face-value price-percent years)
  (* (/ (+ (* (/ coupon-rate 100) face-value)
        (/ (- face-value
              (* face-value (/ price-percent 100))) years))
     (* face-value (/ price-percent 100))) 100))


(define (commission-2 x)
  (* x 0.02))

;; buy-price is not *high* price. Buy is literally what you buy it at.
(define (shortsell-cap-gain buy-price sell-price amount)
  (- (* amount (- buy-price sell-price))
     (commission-2 (* buy-price amount))
     (commission-2 (* sell-price amount))))

(define (shortsell-ym buy-price sell-price amount)
  (/ (shortsell-cap-gain buy-price sell-price amount)
     (* 0.5 buy-price amount)))



(define (shortsell-cover buy-price sell-price amount cover-price main-marg)
  (/ (shortsell-cap-gain buy-price sell-price amount)
     (- (* cover-price  amount (/ main-marg 100)) (* buy-price amount))))
     