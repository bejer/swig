(cl:load #P"example-clos.lisp")

;; This should invoke foo(double)
(example:foo 3.14159d0)

;; This should invoke foo(double, char *)
(example:foo 3.14159d0 "Pi")

;; This should invoke foo(int, int)
(example:foo 3 4)

;; This should invoke foo(char *)
(example:foo "This is a test")

;; This should invoke foo(long)
(example:foo 42)

;; This should invoke Bar::Bar() followed by foo(Bar *)
(example:foo (example:make-bar))

;; Skip a line
(format t "~%")

;; Each of the following three calls should invoke spam(int, int, int)
(example:spam 3)
(example:spam 3 4)
(example:spam 3 4 5)

;; Skip a line
(format t "~%")

;; Each of the following three calls should invoke spam(double, int, int)
(example:spam 3.0d0)
(example:spam 3.0d0 4)
(example:spam 3.0d0 4 5)

;; Skip a line
(format t "~%")

;; This should invoke Bar::Bar(double)
(example:make-bar 3.14159d0)

;; This should invoke Bar::Bar(double, char *)
(example:make-bar 3.14159d0 "Pi")

;; This should invoke Bar::Bar(int, int)
(example:make-bar 3 4)

;; This should invoke Bar::Bar(char *)
(example:make-bar "This is a test")

;; This should invoke Bar::Bar(int)
(example:make-bar 42)

;; This should invoke Bar::Bar() for the input argument,
;; followed by Bar::Bar(const Bar&).
(example:make-bar (example:make-bar))

;; Skip a line
(format t "~%")

;; Construct a new Bar instance (invokes Bar::Bar())
(defparameter *bar* (example:make-bar))

;; This should invoke Bar::foo(double)
(example:foo *bar* 3.14159d0)

;; This should invoke Bar::foo(double, char *)
(example:foo *bar* 3.14159d0 "Pi")

;; This should invoke Bar::foo(int, int)
(example:foo *bar* 3 4)

;; This should invoke Bar::foo(char *)
(example:foo *bar* "This is a test")

;; This should invoke Bar::foo(int)
(example:foo *bar* 42)

;; This should invoke Bar::Bar() to construct the input
;; argument, followed by Bar::foo(Bar *).
(example:foo *bar* (example:make-bar))

;; Each of the following three calls should invoke Bar::spam(int x, int y, int z)
(example:spam *bar* 1)
(example:spam *bar* 1 4)
(example:spam *bar* 1 4 5)

;; Each of the following three calls should invoke Bar::spam(double x, int y, int z)
(example:spam *bar* 3.14159d0)
(example:spam *bar* 3.14159d0 4)
(example:spam *bar* 3.14159d0 4 5)
