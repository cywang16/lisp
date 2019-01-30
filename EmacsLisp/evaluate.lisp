;;;; Practice Evaluation

;;; Buffer Names

(buffer-name)
; "evaluate.lisp"

(buffer-file-name)
; "/home/cywang/GIT/lisp/EmacsLisp/evaluate.lisp"

;;; getting buffers

(current-buffer)
; #<buffer evaluate.lisp>

(other-buffer)
; #<buffer EmacsLisp>

;;; switch buffers
(switch-to-buffer (other-buffer))
; #<buffer EmacsLisp>

(switch-to-buffer (other-buffer (current-buffer) t))

;;; buffer size and location of point

(buffer-size)
; 433 (#o661, #x1b1, ?Ʊ)

(point)
