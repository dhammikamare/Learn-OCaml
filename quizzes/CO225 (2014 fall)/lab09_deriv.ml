(* Task : Given the definition of the deriv higher order function

	let deriv f =
	  let dx=0.001 in
	  fun x -> (f (x+.dx) -. f x) /. dx

	val deriv : (float -> float) -> float -> float = <fun> 

 * Write the evaluation of the following expression (in full)
 * (deriv (fun x -> x)) 0.0
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)
 
(deriv (fun x -> x)) 0.0

= (fun x -> ((fun x -> x) (x+.0.001) -. (fun x -> x) x) /. 0.001) 0.0
= (((fun x -> x) (0.0 +. 0.001) -. (fun x -> x) 0.0) /. 0.001)
= ((0.0+.0.001) -. 0.0) /. 0.001
= (0.001 -. 0.0) /. 0.001
= 0.001 /. 0.001
= 1.
