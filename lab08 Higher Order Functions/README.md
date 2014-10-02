**Higher Order Functions**
-----
Define a higher order function to compute the numerical derivative of a function f at point x.
```ocaml
let derivative fx x dx = 
	(fx (x+.dx) -. fx x) /. dx ;;
```

But functional languages like OCaml support to write these functions in more abstract way. 
The following function returns a derivative function of any given function. Not the evaluated result.
```ocaml
let derivative fx =
	let dx = 0.001 in
	fun x -> (fx (x+.dx) -. fx x) /. dx ;;
```

The Trapezoid rule is a numerical method for calculating definite integrals.
Write a higher order function to calculate integral using this formula (Hint: you may use series_sum.)

```ocaml
let rec series_sum term n = 
	if n = 1 then term
	else term +. series_sum term (n-1);;
	
let trapezoid fx a b n = 
	(* your code here... *)
```
Write a higher order function that uses Newton’s method to numerically approximate the (real) roots of a function. Given a function f and its derivative f', begin with an initial guess of x0. Then successively refine the approximation using the formula
*x(n+1) = xn - f(xn)/f'(xn)*
The process stops when f (x) < e for some small tolerance e.
```ocaml
 let rec newton fx x0 e = 
	(* your code here... *)
```

*Note:*
Questions were extracted from CO225 Lab 8 (2014 fall) by Mr. Ziyan Maraikar 