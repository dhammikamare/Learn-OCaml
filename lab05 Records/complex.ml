(* Task : Define two record types to represent complex numbers in Cartesian form (x + iy) and 
 * polar form (r cos theta + ir sin theta).
 * (a) Define a function that returns whether a number in polar form is real (complex part is zero), imaginary (real part is zero), or mixed.
 * (b) Define a function to convert from Cartesian to polar form.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

type complex_cartesian = {x:float; y:float};;

type complex_polar = {r:float; theta:float};;

let state (c:complex_polar) :string = 
	if c.r ** (sin c.theta) = 0. then "real"
	else if c.r ** (cos c.theta) = 0. then "imaginary"
	else "mixed";;

let complex_cartesian2polar (c:complex_cartesian) :complex_polar = 
	let complex_norm (x, y) = 
		(x*.x +. y*.y) ** 0.5 in
	{r = complex_norm (c.x, c.y) ; theta = atan (c.y /. c.x) };;
	
(*test values *)
let cp1 = {r=1.0; theta=0.};;
let cc1 = {x=1.0; y=1.0};;