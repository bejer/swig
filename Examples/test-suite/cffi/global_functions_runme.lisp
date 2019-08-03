(cl:require 'uiop)
(cl:require 'cffi)
(cl:push (uiop:getcwd) cffi:*foreign-library-directories*)
(cffi:define-foreign-library lib
  (t (:default "global_functions")))
(cffi:use-foreign-library lib)

(load #P"global_functions.lisp")

(defun check (a b)
  (unless (= a b)
    (error (format nil "Failed: ~A != ~A" a b))))

(global_functions::global_void)

(check (global_functions::global_one 1) 1)

(check (global_functions::global_two 2 2) 4)
