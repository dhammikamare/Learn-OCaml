(* Task : Write a function to calculate the binomial coefficients are defined by the recurrence
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)
 
let rec binomial_coeff (n:int) (k:int) :int = 
	if k=0 || k=n then 1
	else binomial_coeff (n-1) (k-1) + binomial_coeff (n-1) (k);;
