type 'a binarytree = 
	| Empty
	| Node of 'a * 'a binarytree * 'a binarytree ;;

let max_depth tr = 
	let rec loop t md = 
		match t with
			| Empty -> -1
			| Node(value, Empty, Empty) -> md
			| Node(value, left, right) -> 
				let lmax = loop left (md+1) in 
				let rmax = loop right (md+1) in 
				max lmax rmax in
				(* if lmax >= rmax then lmax else rmax in *)
				
	loop tr 0;;
	
(* test *)
	
let bt1 = Node(6,
				Node(3, 
					Node(2, Empty, Empty), 
					Node(4, Empty, Empty)),
				Node(8, 
					Node(7, Empty, Empty), 
					Node(9, 
						Empty, 
						Node(10, Empty, Empty))));;		

let be = Empty;;

let b1 = Node(2, Empty, Empty);;

max_depth bt1;;
max_depth be;;
max_depth b1;;

