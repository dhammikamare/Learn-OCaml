(* Task : The Trapezoid rule is a numerical method for calculating definite integrals.
 * Write a higher order function to calculate integral using this formula 
 * (Hint: you may use series_sum.)
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let trapezoid fx a b n =
	let h = (b-.a)/.n in
	
	let rec series_sum tn =
		if tn > b then 0.
		else 
			let tnp1 = tn +. h in
			fx tn +. fx tnp1 +. series_sum tnp1 in

    (h /. 2.) *. (series_sum a) ;;

trapezoid (fun x -> x *. x) 0. 2. 200.  ;;
