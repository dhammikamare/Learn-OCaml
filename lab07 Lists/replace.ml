(* Task : Write a function replace l x y which replaces every occurrence of 
 * item x with y in list l .
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let rec replace l x y = 
	match l with
		| [] -> []
		| hd::tl -> if hd = x then y::replace tl x y
					else hd::replace tl x y;;

(* test *)				
let num = [1; 2 ; 3; 1];;
replace num 1 8;;
