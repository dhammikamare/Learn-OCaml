let rec flat_map f l = 
	match l with
		| [] -> []
		| hd::tl -> 
			match hd with
				| None -> flat_map f tl
				| Some(a) -> f a :: flat_map f tl ;;

(* test *)

flat_map (fun x -> x)[Some 1; None; Some 2];;