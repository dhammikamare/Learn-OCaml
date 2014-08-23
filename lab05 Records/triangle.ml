(* Task : Define a record type to represent a triangle in 3-dimensional space. 
 * Use a tuple to store the coordinates of each vertex.
 * Define a function that checks whether the triangle is equilateral, isosceles, 
 * scalene (3, 2, and no equal sides respectively)
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

type triangle3d = {p1:float*float*float; p2:float*float*float; p3:float*float*float};;

let triangle_check (t:triangle3d) :string = 
	let side (p1:float*float*float) (p2:float*float*float) :float = 
		let (p1x, p1y, p1z) = p1 in 
		let (p2x, p2y, p2z) = p2 in 
		((p2x-.p1x)**2.0 +. (p2y-.p1y)**2.0 +. (p2z-.p1z)**2.0)**0.5 in
		
	let side12 = side t.p1 t.p2 in 
	let side13 = side t.p1 t.p3 in 
	let side23 = side t.p2 t.p3 in 
	
	if side12 = side13 then
		if side12 = side23 then "equilateral"
		else "isosceles"
	else "scalene";;

(* test *)
let t1 = {p1=(0., 0., 0.); p2=(2., 0., 0.); p3=(1., 1.7315196789846, 0.)};;
let t2 = {p1=(0., 0., 0.); p2=(1., 0., 0.); p3=(0., 1., 0.)};;
let t3 = {p1=(1., 2., 3.); p2=(1., 4., 0.); p3=(2., 1., 0.)};;
