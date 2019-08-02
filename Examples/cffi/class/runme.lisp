(defpackage :example
  (:use :cl))
(cl:in-package :example)
(cl:require 'uiop)
(cl:require 'cffi)
(cl:push (uiop:getcwd) cffi:*foreign-library-directories*)
(cffi:define-foreign-library example
  (t (:default "example")))
;;(cffi:use-foreign-library "./example.so")
(cffi:use-foreign-library example)
(cl:load #P"example.lisp")
(cl:load #P"example-clos.lisp")

(cl:in-package :cl-user)

;;;;; Object creation ;;;;;

(format t "Creating some objects:~%")
(defparameter *circle* (make-instance 'example::circle :r 10d0))
(format t "    Created circle ~A~%" *circle*)
(defparameter *square* (make-instance 'example::square :w 10d0))
(format t "    Created square ~A~%" *square*)

;;;;; Access a static member ;;;;;

;; static member variables are wrapped in getter and setter functions
(format t "~%A total of ~A shapes were created~%" (example::shape_nshapes_get))

;;;;; Member data access ;;;;;

;; Set the location of the object

(setf (example::x *circle*) 20d0)
(setf (example::y *circle*) 30d0)

(setf (example::x *square*) -10d0)
(setf (example::y *square*) 5d0)

(format t "~%Here is their current position:~%")
(format t "    Circle = (~A, ~A)~%" (example::x *circle*) (example::y *circle*))
(format t "    Square = (~A, ~A)~%" (example::x *square*) (example::y *square*))

;;;;; Call some methods ;;;;;

(format t "~%Here are some properties of the shapes:~%")
(loop :for o :in (list *circle* *square*) :do
  (format t "    ~A~%" o)
  (format t "        area        ~A~%" (example::area o))
  (format t "        perimeter = ~A~%" (example::perimeter o)))

(format t "~%Guess I'll clean up now~%")
(example::delete_circle (example::ff-pointer *circle*))
(example::delete_square (example::ff-pointer *square*))

(format t "~A shapes remain~%" (example::shape_nshapes_get))
(format t "Goodbye~%")
