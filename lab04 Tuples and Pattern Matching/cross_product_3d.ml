(* Task : Write a function to compute the cross product of two 3-dimensional vectors. Use tuples to
represent vectors.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let cross_product_3d (p1:float*float*float) (p2:float*float*float) :float*float*float = 
	let (u1, u2, u3) = p1 in 
	let (v1, v2, v3) = p2 in
	
	let i = u2*.v3 -. v2*.u3 in
	let j = v1*.u3 -. u1*.v3 in
	let k = u1*.v2 -. v1*.u2 in	
	
	(i, j, k);;
