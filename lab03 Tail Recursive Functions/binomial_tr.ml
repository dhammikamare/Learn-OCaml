(* Task : Write a tail recursive implementation of the binomial coefficient(n k) 
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

(* Tail recursive binomial coefficient. *)
(* Invariant:  *)	
let binomial_tr (n:int) (k:int) :int = 
	let rec loop (i:int) (a:int) :int = 
		if 

		
(* Non Tail recursive binomial coefficient. *)
let rec binomial_coeff (n:int) (k:int) :int = 
	if k=0 || k=n then 1
	else binomial_coeff (n-1) (k-1) + binomial_coeff (n-1) (k);;
