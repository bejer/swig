;; ECL requires to either use a full path to the shared library, or put the path into *foreign-library-directories* as shown:
;; (push (uiop:getcwd) cffi:*foreign-library-directories*)
;; (cffi:use-foreign-library "example.so")

;; CCL has a name conflict for gcd, as it has its own defined gcd function.

;; (defpackage :example
;;   (:use :cl))
;; (cl:in-package :example)
(cl:require 'uiop)
(cl:require 'cffi)
(cl:push (uiop:getcwd) cffi:*foreign-library-directories*)
(cffi:define-foreign-library example
  (t (:default "example")))
(cffi:use-foreign-library example)
(cl:load #P"example.lisp")

(cl:in-package :cl-user)

;; Call our gcd() function
(defparameter *x* 42)
(defparameter *y* 105)
(defparameter *gcd* (example::_gcd *x* *y*)) ;; using _gcd as it was renamed from gcd due to it being a built-in function in e.g. CCL and ECL
(format t "The gcd of ~A and ~A is ~A~%" *x* *y* *gcd*)

;; Manipulate the Foo global variable

;; Output its current value
(format t "Foo = ~A~%" example::foo)

;; Change its value
(setf example::foo 3.1415926d0)

;; See if the change took effect
(format t "Foo = ~A~%" example::foo)
