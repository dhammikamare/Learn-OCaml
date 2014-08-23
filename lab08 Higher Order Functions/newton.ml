(* Task : Write a higher order function that uses Newton’s method to numerically approximate the 
 * (real) roots of a function. Given a function f and its derivative f', begin with an initial guess of x0.
 * Then successively refine the approximation using the formula
 * x(n+1) = xn - f(xn)/f'(xn)
 * The process stops when f (x) < e for some small tolerance e.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

 let rec newton fx x0 e = 
	(* your code here... *)