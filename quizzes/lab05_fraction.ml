(* Task : A fraction n/m can be represented as a pair (n,m). Write a function that adds two fractions and 
 * gives the result in this form.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

type fraction = {n:int; m:int};;

let add_fraction (f1:fraction) (f2:fraction) :fraction = 
	let fo1 = {n = f1.n*f2.m + f1.m*f2.n; m = f1.m*f2.m} in
	fo1;;

(* or *)

let add_fraction (f1:int*int) (f2:int*int) :int*int = 
	let (f1n, f1m) = f1 in
	let (f2n, f2m) = f2 in
	(f1n*f2m + f1m*f2n, f1m*f2m);;
