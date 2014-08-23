(* Task : Write the Ackermann function using a match expression.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let rec ackermann_match (m:int) (n:int) :int = 
	match (m, n) with 
		| (0, _) -> n + 1
		| (_, 0) -> ackermann_match (m-1) 1
		| (_, _) -> ackermann_match (m-1) (ackermann_match m (n-1));;
