(* Task : Define two record types to represent complex numbers in Cartesian form (x + iy) and polar form (r cos theta + ir sin theta).
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

(* or *)

let state (c:complex_polar) :string = 
	if c.r ** (sin c.theta) = 0. then "real"
	else if (cos c.theta) = 0. then "imaginary" (* if r=0 its real*)
	else "mixed";;

let complex_cartesian2polar (c:complex_cartesian) :complex_polar = 
	let cp1 = {r = (c.x**2. +. c.y**2.)**0.5 ; theta = atan (c.y /. c.x) } in
	cp1;;

(*test values *)
let cp1 = {r=1.0; theta=0.};;
let cc1 = {x=1.0; y=1.0};;