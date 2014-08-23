(* Task : Write a tail recursive implementation of the binomial coefficient(n k) 
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

(* Tail recursive binomial coefficient. *)
(* Invariant:  *)	
let binomial_tr (n:int) (k:int) :int = 
	let rec loop (i:int) (j:int) (a:int) :int = 
		if j = 0 || j = n then a
		else loop (i-1) (j-1) (i/j)*a in
	loop n k 1;;

(* test *)
binomial_coeff 5 3;;
