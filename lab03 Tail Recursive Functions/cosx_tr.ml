(* Task : Write a tail recursive implementation of the cos(x)
 * without using the factorial and power (**) functions.
 * Hint: start the summation from the first term.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

(* Tail recursive cos(x). *)	
let cosx_tr (x:float) (n:int) :float = 
	let rec loop (i:int) (a:float) :float = 
		if i=n then a
		else
			let fac = (2*i+1)*(2*i+2) in
			let np1 = a *. (-1.)*. x *. x /. (float fac) in
			loop (i+1) (a +. np1) in
	loop 0 1.;;

(* Non Tail recursive cos(x). *)	
let rec cos_taylor (x:float) (n:int) :float = 
	if n=0 then 1.0
	else 
		let rec fact (n:int) :int = 
			if n<2 then 1
			else n*fact(n-1) in 
		let sign = (-1.)**(float n) in
		let powx = x**(float (2*n)) in
		(sign *. powx /. float_of_int(fact(2*n))) +. cos_taylor (x) (n-1);;