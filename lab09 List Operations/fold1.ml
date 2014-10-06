let rec fold1 f l =
	match l with
		| [hd] ->  hd
		| hd::tl -> f hd (fold1 f tl) ;;
		
let list_max l = 
	fold1 max l ;;
	
(* test *)

fold1 (+) [1;2];;

list_max [1;3;4];;
