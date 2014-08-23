(* Task : The Trapezoid rule is a numerical method for calculating definite integrals.
 * Write a higher order function to calculate integral using this formula 
 * (Hint: you may use series_sum.)
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let rec series_sum term n = 
	if n = 1 then term
	else term +. series_sum term (n-1);;

let trapezoid fx a b n = 
	(* your code here... *)

trapezoid (fun x -> x*.x +. 2.0*.x) 0. 10. 1.






