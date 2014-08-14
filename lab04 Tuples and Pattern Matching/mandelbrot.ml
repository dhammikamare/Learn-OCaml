(* Task : Write a function to test whether a given complex number belongs to the Mandelbrot set.
If c belongs to the Mandelbrot set, the value of |Zn| remains bounded when applying the following recurrence, beginning with z0 = 0.
	Z(n+1) = Z(n)^2 + c
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
		else loop (znp1) c (i-1) in
	
	loop (0., 0.) 20;;
	
(* Sir's way*)
let mandelbrot (c: float*float) :bool =
  let bounded (x,y) =
    ( x*.x +. y*.y) < 4. in
  let square (x,y) =
    (x*.x -. y*.y, -2.*.x*.y) in
  let plus (u,v) (x,y) =
    (u+.x, v+.y) in
    
  let rec loop i z =
    if i=0 then true
    else if not (bounded z) then false
    (* $z_{n+1} = z_n + c$ *)
    else loop (i-1) (plus (square z) c) in
  loop 10 (0.,0.);;
  
