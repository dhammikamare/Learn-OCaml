(* Task : Write recursive functions to compute the cos(x) by evaluating its Taylor series up to n terms. 
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let rec cos_taylor (x:float) (n:int) :float = 
	if n = 0 then 1.0
	else 
		let rec fact (n:int) :int = 
			if n < 2 then 1
			else n * fact(n-1) in
		
		let sign = (-1.)**(float n) in
		let powx = x ** (float (2*n)) in
		(sign *. powx /. float_of_int(fact(2*n))) +. cos_taylor (x) (n-1);;