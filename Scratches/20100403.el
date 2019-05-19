;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(setq a 1)
1

(stringp a)
nil

(setq b "1")
"1"

(stringp b)
t

(stringp nil)
nil

(stringp '())
nil

(stringp ?a)
nil

(char-or-string-p ?c)
t

(+ 1 2 3)

(defun silly-loop (n)
       "Return time before and after N iterations of a loop."
       (let ((t1 (current-time-string)))
         (while (> (setq n (1- n))
                   0))
         (list t1 (current-time-string))))

(silly-loop 100000)
("Sun Apr  4 09:39:30 2010" "Sun Apr  4 09:39:30 2010")

(current-time-string)
"Sun Apr  4 09:40:38 2010"

(silly-loop 10000000)
("Sun Apr  4 09:41:04 2010" "Sun Apr  4 09:41:07 2010")

(current-buffer)
#<buffer *scratch*>

(+ ?\t 0) ; 9
(+ ?\' 0) ; 39
(+ ?\\' 0) ; 92
(+ ?\\ 0) ; 92
(+ ?\( 0) ; 40
(+ ?\C-j 0) ; 10