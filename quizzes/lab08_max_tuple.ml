(* Task : The function max_tuple that takes a list of tuples of the form (key, value) as input. 
 * It should return the tuple with the maximum value in the list.

 * For example
 * let l = [ ("Kandy",10); ("Colombo",15); ("Galle",8) ]
 * max_tuple l 
 * should be equal to ("Colombo",15)

 * If the list is empty cause an exception using failwith.
 * If two tuples contain the maximum value return the one that was first.

 * Hint: Modify the list maximum function from the "Recursive types" lecture which is given below.

	let rec list_max l =
		match l with
		| [] -> failwith "No maximum in empty list" 
		| [hd] -> hd
		| hd::tl -> max hd (list_max tl)
	
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let max_tuple l = 
	let rec list_max l =
		match l with
			| [] -> failwith "No maximum in empty list" 
			| [(k, v)] -> v
			| (hdk, hdv)::tl -> max hdv (list_max tl) in
		
	let rec find l v = 
		match l with
			| [] -> failwith "No maximum in empty list" 
			| (hdk, hdv)::tl -> if hdv = v then (hdk, hdv) else find tl v in
			
	find l (list_max l);;
		
(* test *)	
let l = [ ("Kandy",10); ("Colombo",15); ("Galle",8) ];;

max_tuple l;;

