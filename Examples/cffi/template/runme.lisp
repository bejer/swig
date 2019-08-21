(eval-when (:compile-toplevel :load-toplevel :execute)
  (load #P"example-clos.lisp"))

;; Call some templated functions
(format t "~A~%" (example:maxint 3 7))
(format t "~A~%" (example:maxdouble 3.14d0 2.18d0))

;;;; Using the SWIG extended functions (getitem and setitem because they use copy-by-value and not references/pointers)
(format t "Using the SWIG extended getitem and setitem functions:~%")
;; Create some class
(defparameter *iv* (example:make-vecint 100))
(defparameter *dv* (example:make-vecdouble 1000))

(dotimes (i 100)
  (example:setitem *iv* i (* 2 i)))

(dotimes (i 1000)
  (example:setitem *dv* i (/ 1.0d0 (+ i 1))))

(let ((sum (loop :for i :from 0 :below 100
		 summing (example:getitem *iv* i))))
  (format t "~A~%" sum))

(let ((sum (loop :for i :from 0 :below 1000
		 summing (example:getitem *dv* i))))
  (format t "~A~%" sum))

(example:destroy *iv*)
(example:destroy *dv*)

;;;; Just using the normal functions, without requiring SWIG extended functions
(format t "Using the actual get and set functions - not the SWIG extended functions:~%")
;; Create some class
(defparameter *iv* (example:make-vecint 100))
(defparameter *dv* (example:make-vecdouble 1000))

(dotimes (i 100)
  (cffi:with-foreign-object (value :int) ;; Knowing that the implementation for set is doing a copy assignment, thus the allocated memory should just be deleted afterwards.
    (setf (cffi:mem-ref value :int) (* 2 i))
    (example:set *iv* i value)))

(dotimes (i 1000)
  (cffi:with-foreign-object (value :double) ;; Knowing that the implementation for set is doing a copy assignment, thus the allocated memory should just be deleted afterwards.
    (setf (cffi:mem-ref value :double) (/ 1.0d0 (+ i 1)))
    (example:set *dv* i value)))

(let ((sum (loop :for i :from 0 :below 100
		 summing (cffi:mem-ref (example:get *iv* i) :int))))
  (format t "~A~%" sum))

(let ((sum (loop :for i :from 0 :below 1000
		 summing (cffi:mem-ref (example:get *dv* i) :double))))
  (format t "~A~%" sum))

(example:destroy *iv*)
(example:destroy *dv*)
