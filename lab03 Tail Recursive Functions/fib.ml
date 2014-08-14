(* Task : Write a tail recursive implementation of the Fibonnacci sequence.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

(* Tail recursive Fibonnacci sequence. *)
(* Invariant:  *)
let fib (n:int) :int = 
	let rec loop (i:int) (a:int) (b:int) :int  =
		if i=n then a
		else loop (i+1) (b) (a+b) in 
	loop 0 0 1;;

(* Non Tail recursive Fibonnacci sequence. *)
let rec fib n = 
	if n=0 then 0
	else if n=1 then 1
	else fib (n-1) + fib (n-2);;