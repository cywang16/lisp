;;;; list processing

     '(rose
       violet
       Daisy
       Buttercup)

'(This list includes "text between quotation marks.")

(+ 2 2)
					;; 4 (#o4, #x4, ?\C-d)

'(+ 2 2)
					;; (+ 2 2)

(this is an unquoted list)
;; Debugger entered--Lisp error: (void-function this)
;;   (this is an unquoted list)
;;   eval((this is an unquoted list) nil)
;;   elisp--eval-last-sexp(nil)
;;   eval-last-sexp(nil)
;;   funcall-interactively(eval-last-sexp nil)
;;   call-interactively(eval-last-sexp nil nil)
;;   command-execute(eval-last-sexp)

fill-column
					; 70 (#o106, #x46, ?F)

;; comment commands
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Comment-Commands.html

(fill-column)
;; Debugger entered--Lisp error: (void-function fill-column)
;;   (fill-column)
;;   eval((fill-column) nil)
;;   elisp--eval-last-sexp(nil)
;;   eval-last-sexp(nil)
;;   funcall-interactively(eval-last-sexp nil)
;;   call-interactively(eval-last-sexp nil nil)
;;   command-execute(eval-last-sexp)

(concat "abc" "def")
;; "abcdef"

(substring "The quick brown fox jumped." 16 19)
;; "fox"
