(cl:load #P"example-clos.lisp")

;; TODO: Implement support for global function overloading
;;(example:foo 3.14159d0)

;;(example:foo 3.14159d0 "Pi")

(example:make-bar 3.14159d0)
(example:make-bar 3.14159d0 "Pi")
(example:make-bar 3 4)
(example:make-bar "This is a test")
(example:make-bar 42)
(example:make-bar (example:make-bar))

(format t "~%")

(defparameter *bar* (example:make-bar))

(example:foo *bar* 3.14159d0)
(example:foo *bar* 3.14159d0 "Pi")
(example:foo *bar* 3 4)
(example:foo *bar* "This is a test")
(example:foo *bar* 42)
(example:foo *bar* (example:make-bar))

(example:spam *bar* 1)
(example:spam *bar* 1 4)
(example:spam *bar* 1 5 6)
(example:spam *bar* 3.14159d0)
(example:spam *bar* 3.14159d0 4)
(example:spam *bar* 3.14159d0 5 6)
