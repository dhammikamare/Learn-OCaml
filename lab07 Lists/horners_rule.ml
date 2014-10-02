(* Task : We can represent a polynomial a0 + a1*x + . . . + an*x^n as a 
 * list of floating point coefficients [a0 ; a1 ; . . . ; an ].
 * Write a function to evaluate the polynomial at x = t, using Horner’s rule,
 * a0 + t(a1 + t(. . . + t(an ) . . .)
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let rec horners l t = 
	match l with
		| [] ->  0.
		| hd::tl -> hd +. t *.(horners tl t);;

(* test *)
let coeff = [1.; 2. ; 3.; 1.];;
horners coeff 2.;;

let coeff = [-1.; 2.; -6.; 2.];;
horners coeff 3.;;
