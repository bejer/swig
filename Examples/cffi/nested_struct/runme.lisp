(load #P"example.lisp")

;; (defparameter *foo* (example:get_foo))

;; CL-USER> 
;; ; Setting directory to ~/tmp/swig/Examples/cffi/nested_struct/
;; "/home/michael/tmp/swig/Examples/cffi/nested_struct/"
;; CL-USER> (load #P"example.lisp")
;; T
;; CL-USER> (defparameter *my-foo* (example:get_my_foo))
;; *MY-FOO*
;; CL-USER> (cffi:mem-ref *my-foo* '(:struct example:my_foo_t))
;; (EXAMPLE:S #.(SB-SYS:INT-SAP #X7F2CC40015E0) EXAMPLE:B 14 EXAMPLE:A 11)
;; CL-USER> (getf (cffi:mem-ref *my-foo* '(:struct example:my_foo_t)) 'example:s)
;; #.(SB-SYS:INT-SAP #X7F2CC40015E0)
;; CL-USER> (cffi:mem-ref * '(:struct example:my_ss_t))
;; (EXAMPLE:Y 98 EXAMPLE:X 43)
;; CL-USER> 



;; When specifying the type of the s field, then it gets expanded automatically:

;; (cffi:defcstruct my_foo_t
;; 	(a :int)
;; 	(b :int)
;; 	(s (:struct my_ss_t)))

;; CL-USER> 
;; ; Setting directory to ~/tmp/swig/Examples/cffi/nested_struct/
;; "/home/michael/tmp/swig/Examples/cffi/nested_struct/"
;; CL-USER> (load #P"example.lisp")
;; T
;; CL-USER> (defparameter *my-foo* (example:get_my_foo))
;; *MY-FOO*
;; CL-USER> (cffi:mem-ref *my-foo* '(:struct example:my_foo_t))
;; (EXAMPLE:S (EXAMPLE:Y 98 EXAMPLE:X 43) EXAMPLE:B 14 EXAMPLE:A 11)
;; CL-USER> 

;; Can it be done for pointers also, if one asks for dereferencing it?
;; How to handle arrays?
;; How to wrap structs into a type / class where the type is embedded?

;; Can use cffi:foreign-slot-names and foreign-slot-type to know more about how to dereference pointers - if building some functions for making it easier to access the struct(s)
;; CL-USER> (cffi:foreign-slot-names '(:struct example:my_foo_t))
;; (EXAMPLE:A EXAMPLE:B EXAMPLE:S)
;; CL-USER> (cffi:foreign-slot-names '(:struct example:my_ss_t))
;; (EXAMPLE:X EXAMPLE:Y)
;; CL-USER> (cffi:foreign-slot-type '(:struct example:my_ss_t) 'example:s)
;; ; Debugger entered on #<CFFI::SIMPLE-FOREIGN-TYPE-ERROR "Undefined slot ~A in foreign type ~A." {1003CE1603}>
;; [1] CL-USER> 
;; ; Evaluation aborted on #<CFFI::SIMPLE-FOREIGN-TYPE-ERROR "Undefined slot ~A in foreign type ~A." {1003CE1603}>
;; CL-USER> (cffi:foreign-slot-type '(:struct example:my_foo_t) 'example:s)
;; (:STRUCT EXAMPLE:MY_SS_T)
;; CL-USER> 


;; Can I "see" structs as classes / proxy classes and use the same mechanisms as for accessing class members?
;; Try example with another class (stack allocated, and heap allocated/pointer) as members of a class, and see how it is accessible.
;; Functions/methods returning a known class should wrap it as a class and not just return the raw pointer.
;; Array fields should have methods that accepts an index for returning the specific value/type (if a pointer or class then it should wrap it into an object and not give the raw pointer)
;; n-dimensional arrays should have n indices?
