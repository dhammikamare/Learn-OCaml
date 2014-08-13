(* Define the function rotate x y theta that rotates a cartesian point (x, y) about the origin by angle theta.
 * To construct a pair of values as the result enclose them in parentheses, e.g. (x,y).*)

let rotate (x:float) (y:float) (theta:float) = 
	let pi = 22. /. 7. in
	let alpha = atan(y /. x) in
	let theta_r = pi *. theta /. 180. in 
	let new_x = x *. cos(alpha +. theta_r) in 
	let new_y = y *. sin(alpha +. theta_r) in
	(new_x, new_y);;
	
let rotate (x:float) (y:float) (theta:float) = 
	let pi = 22. /. 7. in
	let theta_r = pi *. theta /. 180. in 
	let new_x = x *. cos theta_r -. y *. sin theta_r in 
	let new_y =  x *. sin theta_r +. y *. cos theta_r in
	(new_x, new_y);;
