let rec zip f l1 l2 =
	match (l1,l2) with
		| (hd1::tl1, hd2::tl2) -> (f hd1 hd2) :: zip f tl1 tl2
		| ([], []) -> []
		| (hd::tl, []) -> failwith "Lists differ in length"
		| ([], hd::tl) -> failwith "Lists differ in length" ;;

let join l1 l2 =
	zip (fun x y -> (x,y)) l1 l2 ;;
	
let apply_list fl l = 
	zip (fun x -> x) fl l ;;
	
(* test *)

zip (+)[1; 2] [3; 4] ;;

join([1;2])([3;4]);;

let sq x = x * x ;;
let fl = [sq; fun x-> sq (sq x)] ;;

apply_list fl [2; 3];;