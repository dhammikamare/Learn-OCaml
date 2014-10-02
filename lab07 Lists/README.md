**Lists**
-----
Write a function replace l x y which replaces every occurrence of item x with y in list l .
```ocaml
let rec replace l x y = 
	match l with
		| [] -> []
		| hd::tl -> if hd = x then y::replace tl x y
					else hd::replace tl x y;;
```
Write a function index_of l x which returns the index of item x in the list l (items are indexed from 0.)
To handle the case where x does not occur in the list use option as the result type. In C we handle not exists using a value like -1. But we don't do that in functional languages.
```ocaml
type 'a option = 
	| Some of 'a
	| None;;
```	
```ocaml
let index_of l x =
	let rec loop i tl = 
		match tl with
			| [] -> None
			| hd::tl -> if hd = x then Some i
						else loop (i+1) tl in
	loop 0 l;;
```
We can represent a polynomial a0 + a1*x + . . . + an*x^n as a list of floating point coefficients [a0 ; a1 ; . . . ; an ].
Write a function to evaluate the polynomial at x = t, using Horner’s rule,
a0 + t(a1 + t(. . . + t(an ) . . .)
```ocaml
let rec horners l t = 
	match l with
		| [] ->  0.
		| hd::tl -> hd +. t *.(horners tl t);;
```

*Note:*
Questions were extracted from CO225 Lab 7 (2014 fall) by Mr. Ziyan Maraikar 
