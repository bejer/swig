(cl:load #P"example.lisp")

;; Call our gcd() function
(defparameter *x* 42)
(defparameter *y* 105)
(defparameter *gcd* (example:_gcd *x* *y*)) ;; using _gcd as it was renamed from gcd due to it being a built-in function in e.g. CCL and ECL
(format t "The gcd of ~A and ~A is ~A~%" *x* *y* *gcd*)

;; Manipulate the Foo global variable

;; Output its current value
(format t "Foo = ~A~%" example:*foo*)

;; Change its value
(setf example:*foo* 3.1415926d0)

;; See if the change took effect
(format t "Foo = ~A~%" example:*foo*)
