**List Operations**
-----

 1) Define the following list functions using map and/or fold. Don’t be concerned about your functions being “inefficient.”
Note that map and fold are in the List module of the standard library. So you refer to them as List.map and List.fold_left.
(a) List length.
```ocaml
let length_of_list (l:'a list) :int = 
	List.fold_left (+) 0 (List.map (fun x -> 1) l) ;;
```
(b) Replace element x with y in list l.
```ocaml
let replace l x y = 
	List.map (fun e -> if e=x then y else e) l ;;
```
 2) (a) Define a function fold1 that folds a non-empty list without the need for an identity element. For example, 
```ocaml
fold1 (+)[1; 2]
```
 is equivalent to 1 + 2.
```ocaml
let rec fold1 f l =
	match l with
		| [hd] ->  hd
		| hd::tl -> f hd (fold1 f tl) ;;
```
Use fold1 to find the list maximum.
```ocaml
let list_max l = 
	fold1 max l ;;
```
(b) Define a function flat_map f l that applies the function f an option list.
• The value form Some 'a elements are extracted and mapped using f.
• None elements are simply removed from the result.
For example, 
```ocaml
flat_map (fun x -> x)[Some 1; None; Some 2] 
```
will return [1; 2] (Note the lambda given is the identity function.)
```ocaml
let rec flat_map f l = 
	match l with
		| [] -> []
		| hd::tl -> 
			match hd with
				| None -> flat_map f tl
				| Some(a) -> f a :: flat_map f tl ;;
```
3) The higher order function **zip f l1 l2** combines two lists element wise using the function f.
If the lists differ in length, it throws an exception.
```ocaml
let rec zip f l1 l2 =
	match (l1,l2) with
		| (hd1::tl1, hd2::tl2) -> (f hd1 hd2) :: zip f tl1 tl2
		| ([], []) -> []
		| (hd::tl, []) -> failwith "Lists differ in length"
		| ([], hd::tl) -> failwith "Lists differ in length"
```

For example, 
```ocaml
zip (+)[1; 2] [3; 4] 
```
results in [4; 6]. Use zip to define the following func-tions:
(a) A function join that takes two lists and returns a list of tuples. For example, 
```ocaml
join [1;2] [3;4] 
```
returns [(1,3); (2;4)]
```ocaml
let join l1 l2 =
	zip (fun x y -> (x,y)) l1 l2 ;;
```
(b) A function apply_list fl l that takes a list of functions fl and applies them to the  corresponding values in l. For example,

```ocaml
let sq x = x * x ;;
let fl = [sq; fun x-> sq (sq x)] ;;
apply_list fl [2; 3]
```
should return [4; 81]
```ocaml
let apply_list fl l = 
	zip (fun x -> x) fl l ;;
```
*Note:*
Questions were extracted from CO225 Lab 9 (2014 fall) by Mr. Ziyan Maraikar 

