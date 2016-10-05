**Quizzes**
-----
Task : Write a function to calculate the arithmetic sum up to n terms. 

```ocaml
let arith_sum (a:float) (d:float) (n:int) :float = 
	let part = 2. *. a +. (float (n-1))*.d in
	part *. (float n) /. 2. ;;
```
	
Task : Given the following definition of the Ackerman function, show the evaluation of ackerman 2 1
```ocaml
let rec ackerman (m:int) (n:int) :int =
  if m=0 then n+1
  else if n=0 then ackerman (m-1) 1
  else ackerman (m-1) (ackerman m (n-1))
```
You only need to show the function application along with the corresponding arguments.
```ocaml
(* Evaluation of ackerman 2 1*)
= ackerman 2 1
= ackerman 1 (ackerman 2 0)
= ackerman 1 (ackerman 1 1)
= ackerman 1 (ackerman 0 (ackerman 1 0))
= ackerman 1 (ackerman 0 (ackerman 0 1))
= ackerman 1 (ackerman 0 2)
= ackerman 1 3
= ackerman 0 (ackerman 1 2)
= ackerman 0 (ackerman 0 (ackerman 1 1))
= ackerman 0 (ackerman 0 (ackerman 0 (ackerman 1 0)))
= ackerman 0 (ackerman 0 (ackerman 0 (ackerman 0 1)))
= ackerman 0 (ackerman 0 (ackerman 0 2))
= ackerman 0 (ackerman 0 3)
= ackerman 0 4
= 5
```

Task : The binary logarithm l of an integer n with n>0 is the unique number that satisfies 2^l <= n < 2^(l+1)
For example, the binary logarithm of 3 is 1, of 4 is 2, and of 5 is 2. 
Write a tail recursive function to compute the binary logarithm by successively trying increasing values for l until the above relation is satisfied. 
```ocaml
let binarylog (n:int) :int =
	let rec loop (l:int) :int =
		let lowerb = 2.** float l in
		let upperb = 2.** float (l+1) in
		if (lowerb <= float n) && (float n < upperb) then l
		else loop (l+1) in 
	loop 0;;
```

Task : A fraction n/m can be represented as a pair (n,m). Write a function that adds two fractions and gives the result in this form.
```ocaml
type fraction = {n:int; m:int};;

let add_fraction (f1:fraction) (f2:fraction) :fraction = 
	let fo1 = {n = f1.n*f2.m + f1.m*f2.n; m = f1.m*f2.m} in
	fo1;;
```
(* or *)
```ocaml
let add_fraction (f1:int*int) (f2:int*int) :int*int = 
	let (f1n, f1m) = f1 in
	let (f2n, f2m) = f2 in
	(f1n*f2m + f1m*f2n, f1m*f2m);;
```

Task : A company needs to store the following details about its warehouse stocks
Data type 	: Attributes
item:  		description, price, supplier 
supplier:  	name, address
 Write type definitions for storing these details in records
 
```ocaml
type supplier = {name:string; address:string};;

type item = {description:string; price:float; supp:supplier};;
```
 
 Write a function "cheaper_supplier" that takes two items as parameters. 
 If the description of the two items are the same, it returns the supplier of the item with the lower price. 
 If the item descriptions are different simply return the supplier of the first item.
```ocaml
let cheaper_supplier (i1:item) (i2:item) :supplier =
	if i1.description = i2.description then 
		if i1.price <= i2.price then i1.supp
		else i2.supp
	else i1.supp;;
```

A vehicle registration system needs to store various details depending on the type of vehicle
Type 		Details
3-wheeler :	whether for hire or personal use
car 	:		year of manufacture
lorry 	:	maximum load (in kilos)
Write a definition of a type called 'vehicle' to store these details.
```ocaml
type use = Hire | Personal ;;

type vehicle = 
	| Wheeler of use
	| Car of int
	| Lorry of int;;
```
Write a function 'registration_fee' that calculates the registration fee of a vehicle based on the following rules.
3-wheelers: For hire Rs 3000, personal use Rs 2000
Car: Rs 5000 if manufactured after 2010, Rs 3000 otherwise
Lorry: Rs 1000 + max load (in kg) * 10
```ocaml
let registration_fee (v:vehicle) :int = 
	match v with 
		| Wheeler(usage) -> if usage=Hire then 3000 else 2000
		| Car(year) -> if year>2010 then 5000 else 3000
		| Lorry(load) -> 1000 + load*10;;
```

Task : The function max_tuple that takes a list of tuples of the form (key, value) as input. 
It should return the tuple with the maximum value in the list.
For example
```ocaml
let l = [ ("Kandy",10); ("Colombo",15); ("Galle",8) ]
max_tuple l 
```
should be equal to ("Colombo",15)

 * If the list is empty cause an exception using failwith.
 * If two tuples contain the maximum value return the one that was first.
 * Hint: Modify the list maximum function from the "Recursive types" lecture which is given below.
```ocaml
	let rec list_max l =
		match l with
		| [] -> failwith "No maximum in empty list" 
		| [hd] -> hd
		| hd::tl -> max hd (list_max tl)
```
```ocaml
let max_tuple l = 
	let rec list_max l =
		match l with
			| [] -> failwith "No maximum in empty list" 
			| [(k, v)] -> v
			| (hdk, hdv)::tl -> max hdv (list_max tl) in
		
	let rec find l v = 
		match l with
			| [] -> failwith "No maximum in empty list" 
			| (hdk, hdv)::tl -> 
				if hdv = v then (hdk, hdv) 
				else find tl v in
			
	find l (list_max l);;
```

Task : Given the definition of the deriv higher order function

```ocaml
	let deriv f =
	  let dx=0.001 in
	  fun x -> (f (x+.dx) -. f x) /. dx

	val deriv : (float -> float) -> float -> float = <fun> 
```
Write the evaluation of the following expression (in full)
 (deriv (fun x -> x)) 0.0
```ocaml
(deriv (fun x -> x)) 0.0

= (fun x -> ((fun x -> x) (x+.0.001) -. (fun x -> x) x) /. 0.001) 0.0
= (((fun x -> x) (0.0 +. 0.001) -. (fun x -> x) 0.0) /. 0.001)
= ((0.0+.0.001) -. 0.0) /. 0.001
= (0.001 -. 0.0) /. 0.001
= 0.001 /. 0.001
= 1.
```

Task : Given the following definitions

```ocaml
	let rec fold1 f l =
	  match l with
	  | [] -> failwith "Empty list"
	  | [x] -> x
	  | hd::tl -> f hd (fold1 f tl)

	let max x y = if x>y then x else y
```
Show the evaluation of the expression
fold1 max [2; 3; 1]
You do not need to show the evaluation of "max".
```ocaml
fold1 max [2; 3; 1]

= max 2 (fold1 max [3;1])
= max 2 (max 3 (fold1 max [1]))
= max 2 (max 3 1)
= max 2 3
= 3

(* If you concider what happpens inside match blocks it uses following matches.
 * Note that this don'thave full expression. *)

fold1 max [2; 3; 1]

(* let hd::tl = [2; 3; 1] in  *)
= max 2 (fold1 max [3;1])
(* let hd::tl = [3; 1] in  *)
= max 2 (max 3 (fold1 max [1]))
(* let [x] = [1] in  *)
= max 2 (max 3 1)
= max 2 3
= 3
```

Task: Recall that the height (depth) of a node in a binary tree is the number of edges from the node to the deepest leaf, can be calculated as shown below:
```ocaml
type 'a binarytree = 
	| Node of 'a * 'a binarytree * 'a binarytree
	| Empty ;;
```
```ocaml
let rec depth t =
	match t with
		| Empty -> 0
		| Node(v, l, r) -> 1 + max (depth l) (depth r) ;;
```

A binary tree is said to be balanced if at every node the difference of the left and right subtrees differs by no more than 1. Write a function balanced: 'a binarytree -> bool that returns true if a binary tree is balanced and false otherwise.

```ocaml
(* abs also in default Ocaml Module*)
let abs (x:int) :int = 
	if x<0 then -x
	else x;;
		
let rec balanced (t:'a binarytree) :bool = 
	match t with
		| Empty -> true
		| Node(v, l, r) -> 
			let diff = abs ((depth l)-(depth r)) in 
			if diff <= 1 then (balanced l) && (balanced r)
			else false;;
```

As the university course policy I won't be share solutions to quiz questions yet since there are usually absentees.
I'll be only post the solutions after make sure that everyone has done the quiz.

*Note:*
Quizzes were made by Mr. Ziyan Maraikar for CO225 (2014 fall).
