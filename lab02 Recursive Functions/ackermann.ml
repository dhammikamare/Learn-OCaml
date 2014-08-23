(* Task : Write a definition for the Ackermann function
 * Be careful when testing as the function grows large very suddenly!
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let rec ackermann (m:int) (n:int) :int = 
	if m = 0 then (n+1)
	else
		if n = 0 then ackermann (m-1) (1)
		else ackermann (m-1) (ackermann (m) (n-1));;
		
