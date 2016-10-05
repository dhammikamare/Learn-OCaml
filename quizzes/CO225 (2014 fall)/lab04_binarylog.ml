(* Task : The binary logarithm l of an integer n with n>0 is the unique number that satisfies
 * 2^l <= n < 2^(l+1)
 * For example, the binary logarithm of 3 is 1, of 4 is 2, and of 5 is 2. 
 * Write a tail recursive function to compute the binary logarithm by successively trying 
 * increasing values for l until the above relation is satisfied. 
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let binarylog (n:int) :int =
	let rec loop (l:int) :int =
		let lowerb = 2.** float l in
		let upperb = 2.** float (l+1) in
		if (lowerb <= float n) && (float n < upperb) then l
		else loop (l+1) in 
	loop 0;;
