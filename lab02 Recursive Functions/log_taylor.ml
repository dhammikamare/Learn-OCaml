(* Task : Write recusrive functions to compute the log(1+x) by evaluating its Taylor series up to n terms. 
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let rec log_taylor (x:float) (n:int) :float = 
	if n=1 then x
	else 
		let sign = (-1.)**(float (n+1)) in (* OR if n mod 2 = 0 then -1. else 1.  *)
		let powx = x**(float n) in
		(sign *. powx /. (float n)) +. log_taylor (x) (n-1);;
