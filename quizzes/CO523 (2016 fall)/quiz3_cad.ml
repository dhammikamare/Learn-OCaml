(* 
@title : CO523 QUIZ 3
@author: E/11/258 Marasinghe M.M.D.B.
 *)

(* 1. A CAD program needs to represent the following solids. *)

(* (a) Declare a type solid capable of representing any of these solids. *)

type point = {x:float; y:float; z:float;};;

type solid = 
	(* Spheres represented by the centre (x, y, z) and radius r. *)
	| Sphere of point * float 
	(* Cylinders represented by the ends of the central axis (x1, y1, z1) and (x2, y2, z2) and, radius r. *)
	| Cylinder of point * point * float
	(* Cubes represented by the two opposite ends (x1, y1, z1) and (x2, y2, z2). *)
	| Cube of point * point;;

(* (b) Write a function volume that calculates the volume of a solid. *)

let square (a:float) :float = 
	a *. a;; 

let cube (a:float) :float = 
	(square a) *. a;;

let absf (a:float) :float = 
	if a > 0. then a
	else -1.0 *. a;;

let volume (s:solid) :float =
	let pi = 3.14 in
	match s with
		| Sphere(p, r) -> 
			4.0 *. pi *. (cube r) /. 3.0
		| Cylinder(p1, p2, r) -> 
			let h = sqrt (square (p1.x-.p2.x) +. square (p1.y-.p2.y) +. square (p1.z-.p2.z)) in
			pi *. (square r) *. h
		| Cube(p1, p2) -> 
			let d = absf (p1.x -. p2.x) in 
			cube d;;

