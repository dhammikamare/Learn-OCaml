(*
 * CO225 Lab 11
 * Task : Set ADT
 *
 * Author : Marasinghe, M.M.D.B. (E/11/258)
 * Date : 2014-09-22 
 *)

(* Signature for Set ADT *)
module type Set = sig
    (** The Set interface declaration **)
    type 'a set
    (** the empty set **)
    val empty : 'a set 
    (** insert element into given set **)
    val insert : 'a -> 'a set -> 'a set 
    (** is element a member of given set? **)  
    val member : 'a -> 'a set -> bool
    (** number of elements in set **)
    val size: 'a set -> int
    (** union of two sets **)
    val union: 'a set -> 'a set -> 'a set
    (** intersection of two sets **)
    val intersect: 'a set -> 'a set -> 'a set
    (** set contents as list **)
    val as_list: 'a set -> 'a list
end

(* Set ADT implemented as a sorted list of unique elements *)
module ListSet: Set = struct
  	type 'a set = 'a list
  	
  	let empty = []
   
  	let rec insert x l = 
    	match l with
    		| [] -> [x]
    		| hd::tl -> 
    			if x < hd then x::l 
    			else if x = hd then l 
            	else hd::(insert x tl)
            			
  	let rec member x l = 
    	match l with
    		| [] -> false
    		| hd::tl -> (x = hd) || ((x > hd) && (member x tl))
            			
	let rec size l = 
		match l with
			| [] -> 0
			| hd::tl -> 1 + size tl
			
	let rec union l1 l2 = 
		match l2 with
			| [] -> l1
			| hd::tl -> union (insert hd l1) tl
			
	
	let intersect l1 l2 = 
		let rec loop ans l1 = 
			match l1 with
				| [] -> ans
				| hd::tl -> 
					if (member hd l2) then loop (insert hd ans) tl
					else  loop ans tl in
		loop empty l1
		
	let rec as_list l = 
		match l with
			| [] -> []
			| hd::tl -> hd:: as_list tl
					
end

(* Type definition for binary tree *)
type 'a binarytree = 
		| Empty
		| Node of 'a * 'a binarytree * 'a binarytree

(* Set ADT implemented as a binary search tree *)
module BSTSet: Set = struct
  	type 'a set = 'a binarytree
  	
  	let empty = Empty
            			
	let rec insert e t =
		match t with
			| Empty -> Node(e, Empty, Empty)
			| Node(v,l,r) ->
				if e=v then Node(v, l, r)
				else if e<v then Node(v, insert e l, r)
				else Node(v, l, insert e r)
    		
    let rec member x t =
		match t with
			| Empty -> false
			| Node(v, l, r) -> 
				if x=v then true 
				else if x<v then member x l
				else member x r
            			
	let rec size t = 
		match t with
			| Empty -> 0
			| Node(v, l, r) -> 1 + size l + size r
			
	let rec union t1 t2 = 	
		match t2 with
			| Empty -> t1
			| Node(v, l, r) -> union (insert v t1) (union l r) 
	
	let rec intersect t1 t2 = 
		let rec loop ans t1 = 
			match t1 with
				| Empty -> ans
				| Node(v, l, r) -> 
					if (member v t2) then loop (insert v ans) (union l r)
					else  loop ans (union l r) in
		loop empty t1
		
	let rec as_list t = 
		match t with
			| Empty -> []
			| Node(v, l, r) -> (as_list l) @ [v] @ (as_list r)
					
end

(* test for ListSet*)

let l1 = ListSet.insert 1 ListSet.empty;;
ListSet.as_list l1;;
let l2 = ListSet.insert 2 l1;;
ListSet.as_list l2;;
let l3 = ListSet.insert 3 l1;;
ListSet.as_list l2;;

ListSet.member 1 l1;;

ListSet.size l1;;

let lu = ListSet.union l2 l3;;
ListSet.as_list lu;;

let li = ListSet.intersect l2 l3;;
ListSet.as_list li;;


(* test for BSTSet*)

let l1 = BSTSet.insert 1 BSTSet.empty;;
BSTSet.as_list l1;;
let l2 = BSTSet.insert 2 l1;;
BSTSet.as_list l2;;
let l3 = BSTSet.insert 3 l1;;
BSTSet.as_list l3;;

BSTSet.member 1 l1;;

BSTSet.size l1;;

let lu = BSTSet.union l2 l3;;
BSTSet.as_list lu;;

let li = BSTSet.intersect l2 l3;;
BSTSet.as_list li;;


