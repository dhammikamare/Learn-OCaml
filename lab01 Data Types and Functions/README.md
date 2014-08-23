**Types**
-----
The Ocaml type system is much stronger than C. To explicitly convert between types the Ocaml library provides a collection of functions named **x_of_y**, where x and y are types. For example the function float_of_int converts an integer to a floating point, while bool_of_string converts string to a boolean.

Convert the following expressions to valid Ocaml, by using the proper operators. Do not change the operands but use type conversion functions instead. Note down the resultant type of each expression.

1.1 + 2 * 3
```ocaml
int_of_float(1.1) + 2*3;;
```
true && 0.0
```ocaml
(* There is no way to cast numbers to bool in OCaml*)
```
 ”Hello I am” ^ 80 ^ ”years old”
```ocaml
"Hello I am" ^ string_of_int(80) ^ "years old";;
```
 ”true” || ”false”
```ocaml
bool_of_string("true") || bool_of_string("false");;
```

**Functions**
-----
Be sure to write each function’s type explicitly. Use a local **let** to define variables where necessary.

Write a function called **capitalise** that capitalises a single character using the formula **C = c - ’a’ + ’A’** , where C stands for the character c capitalised. (Define constants for ’A’ and ’a’.)

``` ocaml
let capitalise (c:char) :char = 
	let offset = int_of_char 'A' - int_of_char 'a' in 
	char_of_int(int_of_char(c) + offset);;
```
Write functions to calculate nth term of a geometric sequence ar^n and the sum of the first n terms
Note that the Ocaml exponentiation operator ** expects a float for the exponent.
```ocaml
let geometric_seq_term (a:float) (r:float) (n:int) :float = 
	let r_n = r ** float_of_int(n) in 
	a *. r_n;;
	
let geometric_seq_sum (a:float) (r:float) (n:int) :float = 
	let r_n = r ** float_of_int(n) in 
	a *. (1. -. r_n) /. (1. -.r);;
```

Define the function rotate x y theta that rotates a cartesian point (x; y) about the origin by angle theta.
To construct a pair of values as the result enclose them in parentheses, e.g. (x,y).

```ocaml
let rotate (x:float) (y:float) (theta:float) = 
	let pi = 22. /. 7. in
	let theta_r = pi *. theta /. 180. in 
	let new_x = x *. cos theta_r -. y *. sin theta_r in 
	let new_y =  x *. sin theta_r +. y *. cos theta_r in
	(new_x, new_y);;
```
OR, I hope we can do it following way. But it code gives wrong results. If you found out what's wrong please share it with me :)

```ocaml
let rotate (x:float) (y:float) (theta:float) = 
	let pi = 22. /. 7. in
	let alpha = atan(y /. x) in
	let theta_r = pi *. theta /. 180. in 
	let new_x = x *. cos(alpha +. theta_r) in 
	let new_y = y *. sin(alpha +. theta_r) in
	(new_x, new_y);;
```
*Note:*
Questions were extracted from CO225 Lab 1 (2014 fall) by Mr. Ziyan Maraikar 
