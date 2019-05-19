(setq friends '(dick jane sally))

friends

(car friends)

friends

;friends or comment

(+ 12 34)

; answer

; problem 2-3, p 26
(car '(p h w))
; p
(cdr '(b k p h))
; (k p h)
(car '((a b) (c d)))
; (a b)
(cdr '((a b) (c d)))
; ((c d))
(car (cdr '((a b) (c d))))
; (c d)
(cdr (car '((a b) (c d))))
; (b)
(cdr (car (cdr '((a b) (c d)))))
; (d)
(car (cdr (car '((a b) (c d)))))
; b

; problem 2-11, p 37
(setq method1 '+)
(setq method2 '-)
(setq method method1)
; (eval method) gives error. cannot evaluate +
(eval (cons method (quote (1 234))))
(setq method 'method1)
(eval method)
(eval (eval '(quote method)))
