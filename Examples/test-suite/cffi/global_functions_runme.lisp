(load #P"global_functions.lisp")

(defun check (a b)
  (unless (= a b)
    (error (format nil "Failed: ~A != ~A" a b))))

(global_functions:global_void)

(check (global_functions:global_one 1) 1)

(check (global_functions:global_two 2 2) 4)
