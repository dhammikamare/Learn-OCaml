**Variants**
-----
Define your own boolean type using variants.
```ocaml
type boolean = True | False;;
```
Define functions for the logical operations implies and xor.
```ocaml
let implies (a:boolean) (b:boolean) :boolean = 
	match (a, b) with
		| (True, False) -> False
		| (_, _) -> True;;
		
let xor (a:boolean) (b:boolean) :boolean = 
	match (a, b) with
		| (False, False) | (True, True) -> False
		| (_, _) -> True;;
```
Extend this type definition to three-valued logic.
```ocaml
type boolean = True | False | Unknown;;
```
Define the and and or operations for this type.
```ocaml
let and3 (a:boolean) (b:boolean) :boolean = 
	match (a, b) with
		| (True, True) -> True
		| (False, _) | (_, False) -> False
		| (_, _) -> Unknown;;

let or3 (a:boolean) (b:boolean) :boolean = 
	match (a, b) with
		| (False, False) -> False
		| (True, _) | (_, True) -> True
		| (_, _) -> Unknown;;
```
Following types are defined for use in a drawing program.
```ocaml
type point2d = { x:float; y:float };;

type element =
	| Circle of point2d * float (* centre coordinates and radius *)
	| Line of point2d * point2d (* end-point coordinates *);;
```
Write a function that moves an element.
```ocaml
let translate (e:element) (p:point2d) :element = 
	let move (pt:point2d) :point2d = 
		{x=pt.x +. p.x; y=pt.y +. p.y} in 
	match e with
		| Circle(p0, r) -> Circle(move p0, r)
		| Line(p0, p1) -> Line(move p0, move p1);;
```
Write a rotate function that rotates an element by a given angle.
* Here I've rotate element through one of its point. But this idea can be extended to ratate from orgin's point of view.
```ocaml
let rotate (e:element) (theta:float) :element = 
	 match e with
	 	| Circle(p0, r) -> Circle(p0, r)
	 	| Line(p0, p1) -> Line(p0, {x=p1.x*.cos theta -. p1.y*.sin theta ; y=p1.y*.cos theta +. p1.x*.sin theta});;
```
Suppose we want to draw elements using various styles, which have the following attributes,
• The “stroke” such as, Pencil, Brush, Crayon
• An integer stroke width.
• Stroke colour as defined by a variant type colour
Define a type style to store the attributes above.
```ocaml
type stroke = Pencil | Brush | Crayon ;;
type colour = Red | Blue | Green | Black ;;

type style = {strk:stroke; width:int; clr:colour};;
```
Modify the element type to have a style for each element.
```ocaml
type element =
	| Circle of point2d * float * style
	| Line of point2d * point2d * style;;
```
*Note:*
Questions were extracted from CO225 Lab 6 (2014 fall) by Mr. Ziyan Maraikar 