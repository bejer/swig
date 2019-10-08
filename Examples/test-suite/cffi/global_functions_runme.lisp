(load #P"global_functions.lisp")

(defun check (a b)
  (unless (= a b)
    (error (format nil "Failed: ~A != ~A" a b))))

(global_functions:global-void)

(check (global_functions:global-one 1) 1)

(check (global_functions:global-two 2 2) 4)
