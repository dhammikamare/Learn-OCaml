**Records**
-----
Define two record types to represent complex numbers in Cartesian form (x + iy) and polar form (r cos theta + ir sin theta).
```ocaml
type complex_cartesian = {x:float; y:float};;
type complex_polar = {r:float; theta:float};;
```
Define a function that returns whether a number in polar form is real (complex part is zero), imaginary (real part is zero), or mixed.
```ocaml
let state (c:complex_polar) :string = 
	if c.r ** (sin c.theta) = 0. then "real"
	else if c.r ** (cos c.theta) = 0. then "imaginary"
	else "mixed";;
```
Define a function to convert from Cartesian to polar form.
```ocaml
let complex_cartesian2polar (c:complex_cartesian) :complex_polar = 
	let complex_norm (x, y) = 
		(x*.x +. y*.y) ** 0.5 in
	{r = complex_norm (c.x, c.y) ; theta = atan (c.y /. c.x) };;
```
Define a record type to represent a triangle in 3-dimensional space.  Use a tuple to store the coordinates of each vertex.
```ocaml
type triangle3d = {p1:float*float*float; p2:float*float*float; p3:float*float*float};;
```
Define a function that checks whether the triangle is equilateral, isosceles, scalene (3, 2, and no equal sides respectively)
```ocaml
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
```
Define a record to store company employee details given below. 
Use appropriate data types for the fields.
*first and last name, salary, marital status*
```ocaml
type employee = {fname:string; lname:string; salary:int; marital_status:bool};;
```
Define a record to store details of a company department.
 *department name, head*
```ocaml
type employee = {fname:string; lname:string; salary:int; marital_status:bool};;
```
Write a function to check whether two departments have the same head.
```ocaml
let checkDepartmentHeads (d1:department) (d2:department) :bool = 
	if d1.head = d2.head then true
	else false;;
```
*Note:*
Questions were extracted from CO225 Lab 5 (2014 fall) by Mr. Ziyan Maraikar 