(* Task : Given the following definitions

	let rec fold1 f l =
	  match l with
	  | [] -> failwith "Empty list"
	  | [x] -> x
	  | hd::tl -> f hd (fold1 f tl)

	let max x y = if x>y then x else y

 * Show the evaluation of the expression
 * fold1 max [2; 3; 1]
 * You do not need to show the evaluation of "max".
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

fold1 max [2; 3; 1]

= max 2 (fold1 max [3;1])
= max 2 (max 3 (fold1 max [1]))
= max 2 (max 3 1)
= max 2 3
= 3

(* If you concider what happpens inside match blocks it uses following matches.
 * Note that this don'thave full expression. *)

fold1 max [2; 3; 1]

(* let hd::tl = [2; 3; 1] in  *)
= max 2 (fold1 max [3;1])
(* let hd::tl = [3; 1] in  *)
= max 2 (max 3 (fold1 max [1]))
(* let [x] = [1] in  *)
= max 2 (max 3 1)
= max 2 3
= 3
