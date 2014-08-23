**Tuples and Pattern Matching**
-----
Write a function to compute the cross product of two 3-dimensional vectors. Use tuples to represent vectors.
```ocaml
let cross_product_3d (p1:float*float*float) (p2:float*float*float) :float*float*float = 
	let (u1, u2, u3) = p1 in 
	let (v1, v2, v3) = p2 in
	
	let i = u2*.v3 -. v2*.u3 in
	let j = v1*.u3 -. u1*.v3 in
	let k = u1*.v2 -. v1*.u2 in	
	
	(i, j, k);;
```
OR
```ocaml
let cross_product_3d (u1, u2, u3) (v1, v2, v3) :float*float*float = 
	let i = u2*.v3 -. v2*.u3 in
	let j = v1*.u3 -. u1*.v3 in
	let k = u1*.v2 -. v1*.u2 in	
	
	(i, j, k);;
```
Write the Ackermann function using a match expression.
```ocaml
let rec ackermann_match (m:int) (n:int) :int = 
	match (m, n) with 
		| (0, _) -> n + 1
		| (_, 0) -> ackermann_match (m-1) 1
		| (_, _) -> ackermann_match (m-1) (ackermann_match m (n-1));;
```
Write a function to print which quadrant an (x; y) coordinate belongs to. Assume that a coordinate lying on an axis belongs to the anticlockwise next quadrant.
Hint: This cannot be done directly using match expressions. First write a sign function that returns  1; 0; -1 depending whether the number is positive, zero or negative.
```ocaml
let quadrant (x:float) (y:float) :string = 
	let sign (x:float) :int = 
		if x > 0. then 1
		else if x = 0. then 0
		else -1 in 
	
	match (sign x, sign y) with 
		| ( 0,  0) 	-> "Origin"
		| ( 1,  0) 	-> "quadrant I"
		| ( 1,  1) 	-> "quadrant I"
		| ( 0,  1) 	-> "quadrant II"
		| (-1,  1) 	-> "quadrant II"
		| (-1,  0) 	-> "quadrant III"
		| (-1, -1) 	-> "quadrant III"
		| ( 0, -1) 	-> "quadrant IV"
		| ( 1, -1) 	-> "quadrant IV";;
```
*Note:* Even-though you get following warning, Only values that our pattern-matching can reach are 1; 0 and -1
Warning 8: this pattern-matching is not exhaustive.
Here is an example of a value that is not matched: (2, _)

Write a function to test whether a given complex number belongs to the Mandelbrot set. If c belongs to the Mandelbrot set, the value of |Zn| remains bounded when applying the following recurrence, beginning with z0 = 0.
 Z(n+1) = Z(n)^2 + c
```ocaml
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
```
But good practise is to divide the code in to functions. Don't make your recursive loop a mess.
```ocaml
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
```
*Note:*
Questions were extracted from CO225 Lab 4 (2014 fall) by Mr. Ziyan Maraikar 