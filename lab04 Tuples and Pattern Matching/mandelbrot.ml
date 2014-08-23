(* Task : Write a function to test whether a given complex number belongs to the Mandelbrot set.
 * If c belongs to the Mandelbrot set, the value of |Zn| remains bounded when applying the following recurrence, 
 * beginning with z0 = 0.
 * Z(n+1) = Z(n)^2 + c
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let mandelbrot (c:float*float) :bool = 
	let rec loop  (z:float*float) (i:int) :bool = 
		let bound = 2. in
		let (zx, zy) = z in
		let (cx, cy) = c in
		let modz = (zx*.zx +. zy*.zy) ** 0.5 in
		let znp1 = (zx*.zx -. zy*.zy +. cx, 2.*.zx*.zy +. cy) in
	
		if modz > bound then false
		else if i=0 then true
		else loop (znp1) (i-1) in
	
	loop (0., 0.) 20;;

(* good practise is to divide the code in to functions. don't make your recursive loop a mess *)

let mandelbrot (c:float*float) :bool = 
	let complex_norm (x, y) = 
		(x*.x +. y*.y) ** 0.5 in
	let complex_sum (x1, y1) (x2, y2) = 
		(x1+.x2, y1+.y2) in 
	let complex_pow2 (x, y) = 
		(x*.x -. y*.y, 2.*.x*.y) in 		
	
	let bound = 2. in	
	let rec loop (i:int) (z:float*float) :bool = 
		if (complex_norm z) > bound then false
		else if i = 0 then true
		else loop (i-1) (complex_sum (complex_pow2 z) c) in
	
	loop 20 (0., 0.);;
 
(* test *)
mandelbrot (-1., 0.);;
mandelbrot (1., 0.);;

