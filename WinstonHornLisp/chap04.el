; (load "/Users/cywang/Documents/Codes/LISP/WinstonHornLisp/chap04.el")

; problem 4-1, p 71
(defun inc (n)
  (+ n 1)
)

(defun dec (n)
  (- n 1)
)

(defun plus (m n)
  (cond ((<= m 0) n)
        ((<= n 0) m)
        ((< m n) (plus (dec m) (inc n)))
        (t (plus (inc m) (dec n))))
)

; problem 4-2, p 71
(defun our-expt (m n)
  (our-expt-aux m n 1)
)

(defun our-expt-aux (m n v)
  (cond ((= n 0) v)
        (t (our-expt-aux m (1- n) (* v m)))
  )
)

; problem 4-3, p 71
(defun our-reverse (L)
  (our-reverse-aux L nil)
)

(defun our-reverse-aux (L R)
  (cond ((null L) R)
        (t (our-reverse-aux (cdr L) (cons (car L) R)))
  )
)

; problem 4-4, p 71
(defun our-expt1 (m n)
  (cond ((<= n 1) m)
        ((evenp n) (our-expt1 (* m m) (/ n 2)))
        (t (* m (our-expt1 (* m m) (/ (- n 1) 2))))
  )
)

; problem 4-5, p 71
(defun count-atoms (L)
  (count-atoms-aux L 0)
)

(defun count-atoms-aux (L n)
  (cond ((null L) n)
        ((atom L) (1+ n))
        (t (count-atoms-aux (cdr L) (count-atoms-aux (car L) n)))
  )
)

; problem 4-6, p 71
(defun mystery (s)
  (cond ((null s) 1)
        ((atom s) 0)
        (t (max (+ (mystery (car s)) 1)
                (mystery (cdr s))))))

; problem 4-9, p 72
; squash a list
(defun squash (l)
  (cond ((null l) l)
        ((atom l) (cons l nil))
        ((atom (car l)) (cons (car l) (squash (cdr l))))
        ((listp (car l)) (append (squash (car l)) (squash (cdr l))))
  )
)

; problem 4-10, p 72
(defun my-fibonacci (n)
  (my-fibonacci-ex n 1 1)
)

(defun my-fibonacci-ex (n n1 n2)
  (cond ((< n 0) 0)
        ((= n 0) 1)
        ((= n 1) 1)
        (t (my-fibonacci-ex (1- n) (+ n1 n2) n1))
  )
)

(defun book-fibonacci (n)
  (cond ((< n 0) 0)
        ((= n 0) 1)
        ((= n 1) 1)
        (t (+ (book-fibonacci (1- n)) (book-fibonacci (- n 2))))
  )
)

; problem 4-11, page 72
(setq golden+ (/ (+ (sqrt 5.0) 1.0) 2.0))
(setq golden- (/ (- (sqrt 5.0) 1.0) 2.0))

(defun fibonacci-formula (n)
  (cond ((< n 0) 0)
        (t (/ (- (our-expt1 golden+ (+ n 1))
                 (our-expt1 golden- (+ n 1))) (sqrt 5.0)))
  )
)

; problem 4-12, page 73
; the function our-pairlis returns an association list for two input lists

(defun our-pairlis (listA listB)
  (our-pairlis-aux nil listA listB)
)

(defun our-pairlis-aux (assocL listA listB)
  (cond ((null listA) assocL)
        ((null listB) assocL)
        (t (our-pairlis-aux
             (append assocL (list (list (car listA) (car listB))))
             (cdr listA) (cdr listB)))
  )
)

; example
; (our-pairlis '(1 2 3 4) '(4 5 6))
; ((1 4) (2 5) (3 6))

; problem 4-13, page 73
; define OUR-UNION, OUR-INTERSECTION, and OUR-DIFFERENCE

; OUR-UNION

(defun our-union (set1 set2)
  (our-union-aux set1 set2 nil)
)

(defun our-union-aux (set1 set2 setu)
  (cond ((not (null set1))
          (our-union-aux (cdr set1) set2 (unionadd setu (car set1)))
        )
        ((not (null set2))
          (our-union-aux nil (cdr set2) (unionadd setu (car set2)))
        )
        (t setu)
  )
)

(defun unionadd (setu element)
  (cond ((member element setu) setu)
        (t (cons element setu))
  )
)

; example for our-union
; (our-union '(1 2 3) '(3 1 a d))
; (d a 3 2 1)

(defun our-intersection (set1 set2)
  (our-intersect-aux set1 set2 nil)
)

(defun our-intersect-aux (set1 set2 seti)
  (cond ((null set1) seti)
        ((member (car set1) set2)
          (our-intersect-aux (cdr set1) set2 (unionadd seti (car set1)))
        )
        (t (our-intersect-aux (cdr set1) set2 seti))
  )
)

; example for our-intersection
; (our-intersection '(1 2 3) '(4 5 6 1))
; (1)
; (our-intersection '(a l e x w a n g) '(a n n i e l i n))
; (n e l a)
; (our-intersection '(1 2 3) '(4 5 6))
; nil

(defun our-difference (set1 set2)
  (our-diff-aux set1 set2 nil)
)

(defun our-diff-aux (set1 set2 setd)
  (cond ((null set1) setd)
        ((member (car set1) set2)
          (our-diff-aux (cdr set1) set2 setd)
        )
        (t (our-diff-aux (cdr set1) set2 (unionadd setd (car set1))))
  )
)

; example for our-difference
; (our-difference '(a l e x w a n g) '(a n n i e l i n))
; (g w x)
; (our-difference '(n i c o l e w a n g) '(B r y c e W a n g))
; (w l o i)
