(*
Recall that the height (depth) of a node in a binary tree is the number of edges from the node to the deepest leaf, can be calculated as shown below:

type 'a binarytree = 
| Node of 'a * 'a binarytree * 'a binarytree
| Empty

let rec depth t =
match t with
| Empty -> 0
| Node(v, l, r) -> 1 + max (depth l) (depth r)

A binary tree is said to be balanced if at every node the difference of the left and right subtrees differs by no more than 1. Write a function balanced: 'a binarytree -> bool that returns true if a binary tree is balanced and false otherwise.
*)

type 'a binarytree = 
	| Node of 'a * 'a binarytree * 'a binarytree
	| Empty ;;
	
let rec depth t =
	match t with
		| Empty -> 0
		| Node(v, l, r) -> 1 + max (depth l) (depth r) ;;

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
			
			
let t = Node(1, 
			Node(2, 
				Node(3, Empty, Empty), 
				Empty), 
			Empty);;

balanced t;;


	
	
