(* Task : Write a function to print which quadrant an (x; y) coordinate belongs to. Assume that a coordinate lying on an axis belongs to the anticlockwise next quadrant
 * Hint: This cannot be done directly using match expressions. First write a sign function that returns  1; 0; 1 depending whether the number is positive, zero or negative.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let sign (x:float) :int = 
	if x>0. then 1
	else if x=0. then 0
	else -1;;

let quadrant (x:float) (y:float) :string = 
	match (sign x, sign y) with 
		| ( 0,  0) 	-> "Origin"
		| ( 1,  0) 	-> "quadrant I"
		| ( 1,  1) 	-> "quadrant I"
		| ( 0,  1) 	-> "quadrant II"
		| (-1,  1) 	-> "quadrant II"
		| (-1,  0) 	-> "quadrant III"
		| (-1, -1) 	-> "quadrant III"
		| ( 0, -1) 	-> "quadrant IV"
		| ( 1, -1) 	-> "quadrant IV";;
		
		
Characters 44-307:
Warning 8: this pattern-matching is not exhaustive.
Here is an example of a value that is not matched: (2, _)
val quadrant : float -> float -> string = <fun>
