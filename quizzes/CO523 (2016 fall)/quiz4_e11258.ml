(*
@quiz	: Higher-order functions
@author	: E/11/258 Marasinghe, M.M.D.B.
@date	: September 1, 2016
*)

(* 1. Given the definition of the deriv higher order function *)

let deriv f =
	let dx=0.001 in
	fun x -> (f (x+.dx) -. f x) /. dx
;;

(* Show the evaluation of the following expression (in full) (deriv (fun x -> x))0.0 *)

(deriv (fun x -> x))0.0 ;;

(*
= (fun x -> ((fun x -> x) (x+.0.001) -. (fun x -> x) x) /. 0.001) 0.0 ;;
= (((fun x -> x) (0.0 +. 0.001) -. (fun x -> x) 0.0) /. 0.001) ;;
= ((0.0+.0.001) -. 0.0) /. 0.001 ;;
= (0.001 -. 0.0) /. 0.001 ;;
= 0.001 /. 0.001 ;;
= 1.0
*)

(* 2. Use the above definition of deriv and the function *)

let compose f g x = f (g) ;;

(* to write the function second_deriv: (float -> float)-> float -> float which calculates
the second order numerical derivative of a function *)

let second_deriv f = 
	compose deriv (deriv f)
	;;



