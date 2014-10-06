(* Task : Define a higher order function to compute the numerical derivative of a function f at point x.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)
 
let derivative fx x = 
	let dx = 0.001 in 
	(fx (x+.dx) -. fx x) /. dx ;;

(* test *)
derivative (fun x -> x*.x+.2.*.x) 2. ;;

(* But functional languages like OCaml support to write these functions in more abstract way. 
   The following function returns a derivative function of any given function. Not the evaluated result. *)

let derivative fx =
	let dx = 0.001 in
	fun x -> (fx (x+.dx) -. fx x) /. dx ;;
	  
(* test *)
(derivative (fun x -> x*.x+.2.*.x)) 2. ;;
