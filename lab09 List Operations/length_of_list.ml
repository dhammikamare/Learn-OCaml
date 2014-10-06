let length_of_list (l:'a list) :int = 
	List.fold_left (+) 0 (List.map (fun x -> 1) l) ;;

(* test *)

length_of_list [1; 2; 3] ;;