;; ECL requires to either use a full path to the shared library, or put the path into *foreign-library-directories* as shown:
;; (push (uiop:getcwd) cffi:*foreign-library-directories*)
;; (cffi:use-foreign-library "example.so")

;; CCL has a name conflict for gcd, as it has its own defined gcd function.

(defpackage :example)
(cl:in-package :example)
(cl:require 'cffi)
(cffi:use-foreign-library "./example.so")
(cl:load #P"example.lisp")

(cl:in-package :cl-user)

;; Call our gcd() function
(defparameter x 42)
(defparameter y 105)
(defparameter g (example::gcd x y))
(format t "The gcd of ~A and ~A is ~A~%" x y g)

;; Manipulate the Foo global variable

;; Output its current value
(format t "Foo = ~A~%" example::foo)

;; Change its value
(setf example::foo 3.1415926d0)

;; See if the change took effect
(format t "Foo = ~A~%" example::foo)
