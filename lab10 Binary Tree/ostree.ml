type 'a ostree = 
	| Empty
	| Node of 'a * int * 'a ostree * 'a ostree ;;
	
let rec insert e t = 
	match t with 
		| Empty -> Node(e, 1, Empty, Empty)
		| Node(v, count, lt, rt) -> 
				if e < v then Node(v, count+1, insert e lt, rt)
				else if e > v then Node(v, count+1, lt, insert e rt)
				else Node(v, count, lt, rt) ;;
				
				
let rec rank (x:int) (t:'a ostree) :int = 
	match t with 
		| Empty -> failwith "error: empty list."
		| Node(v, count, lt, rt) -> 
				if x<v then rank x lt
				else if x=v then
					if lt != Empty then 
						let Node(lv, lcount, llt, lrt) = lt in 
							lcount + 1
					else 1
				else (*if x>v then *)
					if lt != Empty then 
						let Node(lv, lcount, llt, lrt) = lt in
							lcount + 1 + (rank x rt)
					else (1 + rank x rt);;

let rec select (k:int) (t:'a ostree) = 
	match t with
		| Empty -> failwith "error: empty list."
		| Node(v, count, lt, rt) -> 
			let leftcount = 
				if lt = Empty then 0
				else (let Node(lv, lcount, llt, lrt) = lt in lcount) in
				
			if k <= leftcount then (select k lt)
			else if k = leftcount + 1 then Node(v, count, lt, rt)
			else (select (k-leftcount-1) rt) ;;

(* test *)
			
let os0 = insert 6 Empty ;;
let os1 = insert 3 os0 ;;
let os2 = insert 2 os1 ;;
let os3 = insert 4 os2 ;;
let os4 = insert 8 os3 ;;

(*
Node (6, 5, 
	Node (3, 3, 
		Node (2, 1, Empty, Empty), 
		Node (4, 1, Empty, Empty)),
	Node (8, 1, Empty, Empty))  
*)			

rank 3 os4;;

select 2 os4;;