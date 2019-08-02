/*
  Warnings for Common Lisp keywords, built-in names and bad names.
*/

/*
#define CFFIKW(x) %keywordwarn("'" `x` "' is a Common Lisp keyword, renaming to '_" `x` "'", rename="_%s")  `x`
*/
#define CFFIBN(x) %builtinwarn("'" `x` "' conflicts with a built-in name in Common Lisp, renaming to '_" `x` "'", rename="_%s")  `x`

/*
  built-in types
  Part of the CL standard
 */ 
CFFIBN(t);
CFFIBN(nil);

/*
  built-in functions
  Part of the CL standard
 */ 


/*
  built-in functions
  Extras found in e.g. CCL and ECL
 */ 
CFFIBN(gcd);

#undef CFFIBN
/*
#undef CFFIKW
*/