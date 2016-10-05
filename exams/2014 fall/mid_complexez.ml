let complex_sum (x1, y1) (x2, y2) = 
	(x1+.x2, y1+.y2);;

let complex_mul (x1, y1) (x2, y2) = 
	(x1*.x2-.y1*.y2, x1*.y2+.y1*.x2);;
	
let exp_z (x, y) imax = 
	let rec loop i tnp ez = 
		if i = imax then ez
		else
			let zt = (x/.(float)i, y/.(float)i) in 
			let tn = complex_mul zt tnp in 
			loop (i+1) tn (complex_sum ez tn) in
			
	loop 1 (1.,1.) (1.,1.);;
	
(* test *)

exp_z (3., 2.) 20;;

(* 
for z = a +ib, e_z =  e^a (cos b + i sin b) 
z=3+2i;
(exp (3.) *.  cos 2. , exp (3.) *. sin 2.)
*)

