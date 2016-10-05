(* Task : Write a function to calculate the arithmetic sum up to n terms. 
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let arith_sum (a:float) (d:float) (n:int) :float = 
	let part = 2. *. a +. (float (n-1))*.d in
	part *. (float n) /. 2. ;;
