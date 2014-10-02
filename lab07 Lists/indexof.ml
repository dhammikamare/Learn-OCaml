(* Task : Write a function index_of l x which returns the index of item x in the list l (items are indexed from 0.)
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

(* To handle the case where x does not occur in the list use option as the result type.
 * In C we handle not exists using a value like -1. But we don't do that in functional languages.*)
 
type 'a option = 
	| Some of 'a
	| None;;

let index_of l x =
	let rec loop i tl = 
		match tl with
			| [] -> None
			| hd::tl -> if hd = x then Some i
						else loop (i+1) tl in
	loop 0 l;;

(* test *)
let num = [1; 2 ; 3; 1];;
index_of num 8;;
