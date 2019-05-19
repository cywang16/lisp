; (load "/Users/cywang/Documents/Codes/LISP/WinstonHornLisp/chap03.el")

; problem 3-2, p 44
(defun rotate-left (sequence)
  (append (cdr sequence) (list (car sequence)))
)

; problem 3-3, p 44
(defun rotate-right (sequence)
  (append (last sequence) (reverse (cdr (reverse sequence))))
)

; problem 3-5, p 44
(defun f-to-c (temp)
  (- (/ (+ temp 40.0) 1.8) 40.0)
)

(f-to-c 85)

(defun c-to-f (temp)
  (- (* (+ temp 40.0) 1.8) 40.0)
)

; problem 3-7, p 49
(defun our-evenp (n)
  (zerop (mod n 2))
)

; problem 3-11, p 52
(defun my-abs (n)
  (cond ((> n 0) n)
        (t (- n)))
)

(defun my-min (a b)
  (cond ((> a b) b)
        (t a))
)

(defun my-max (a b)
  (cond ((> a b) a)
        (t b))
)

; problem 3-12, p 52
(defun my-not (u)
  (cond ((equal u nil) t)
        (t nil))
)

; problem 3-13, p 52
(cons (car nil) (cdr nil))
; (nil)
; (car nil)
; nil
; (cdr nil)
; nil
