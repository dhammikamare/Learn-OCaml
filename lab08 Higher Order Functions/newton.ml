(* Task : Write a higher order function that uses Newton’s method to numerically approximate the 
 * (real) roots of a function. Given a function f and its derivative f', begin with an initial guess of x0.
 * Then successively refine the approximation using the formula
 * x(n+1) = xn - f(xn)/f'(xn)
 * The process stops when f (x) < e for some small tolerance e.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let derivative fx =
	let dx = 0.001 in
	fun x -> (fx (x+.dx) -. fx x) /. dx ;;
	
let abs x = 
	if x < 0. then -.x
	else x;;
 
let newton f x0 e = 
	let rec loop xn = 
		let xnp1 = xn -. (f xn /. (derivative f) xn) in
		let error = abs (xnp1 -. xn) in
		
		if error < e then xn
		else loop xnp1 in

	loop x0 ;;