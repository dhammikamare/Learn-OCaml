(* Task : Define types for use in a drawing program.
 * (a) Write a rotate function that rotates an element by a given angle.
 *     Hint: x' = x cos f - y sin f,  y' = y cos f + x sin f
 * (b) Suppose we want to draw elements using various styles, which have the following at-tributes,
 * 	   • The “stroke” such as, Pencil, Brush, Crayon
 * 	   • An integer stroke width.
 * 	   • Stroke colour as defined by a variant type colour
 * Define a type style to store the attributes above. Modify the element type to have a style for each element.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

type point2d = { x:float; y:float };;

type element =
	| Circle of point2d * float (* centre coordinates and radius *)
	| Line of point2d * point2d (* end-point coordinates *);;
	
let translate (e:element) (p:point2d) :element = 
	let move (pt:point2d) :point2d = 
		{x=pt.x +. p.x; y=pt.y +. p.y} in 
	match e with
		| Circle(p0, r) -> Circle(move p0, r)
		| Line(p0, p1) -> Line(move p0, move p1);;
		
let rotate (e:element) (theta:float) :element = 
	 match e with
	 	| Circle(p0, r) -> Circle(p0, r)
	 	| Line(p0, p1) -> Line(p0, {x=p1.x*.cos theta -. p1.y*.sin theta ; y=p1.y*.cos theta +. p1.x*.sin theta});;

type stroke = Pencil | Brush | Crayon ;;
type colour = Red | Blue | Green | Black ;;

type style = {strk:stroke; width:int; clr:colour};;

type element =
	| Circle of point2d * float * style
	| Line of point2d * point2d * style;;
		
(* test *)

let c1 = Circle({x=0.; y=0.}, 1.);;
let l1 = Line({x=0.; y=0.}, {x=5.; y=0.});;
let p = {x=1.; y=1.};;
translate c1 p;;
translate l1 p;;
rotate c1 (3.14/.2.);;
rotate l1 (3.14/.2.);;