(* Task : Define a higher order function to compute the numerical derivative of a function f at point x.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)
 
let derivative fx x dx = 
	(* your code here... *)

(* test *)
derivative (fun x -> x*.x+.2.*.x) 2. 0.00001;;

