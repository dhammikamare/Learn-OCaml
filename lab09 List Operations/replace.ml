let replace l x y = 
	List.map (fun e -> if e=x then y else e) l ;;

(* test *)

let l1 = [1; 2; 3];;
replace l1 3 4 ;;

