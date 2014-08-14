(* Task : Write a function to compute the binary log of a number.
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
