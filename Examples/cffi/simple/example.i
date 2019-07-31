/* File : example.i */
%module example

 // gcd is a predefined function in some lisp implementations such as CCL and ECL.
%rename(c_gcd) gcd;

%inline %{
extern int    gcd(int x, int y);
extern double Foo;
%}
