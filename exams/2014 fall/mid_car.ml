type options = {ac:bool; gps:bool; stereo:bool};;

type oiltype = Diesel | Petrol ;;
type engine = {voiltype:oiltype; capacity:float};;

type vehicle = {vengine:engine; feature:options};;

let is_fulloption (v:vehicle) :bool = 
	let fulloption = {ac=true; gps=true; stereo=true} in
	if v.feature = fulloption then true
	else false ;;
	
let full_option_vehicles (vl:vehicle list) :int = 
	let rec loop vlt count = 
		match vlt with
			| [] -> count
			| hd::tl -> if (is_fulloption hd) then loop tl (count+1)
						else loop tl count in
	loop vl 0;;
	
(* OR *)

let rec full_option_vehicles (vl:vehicle list) :int = 
	match vl with
		| [] -> 0
		| hd::tl -> if (is_fulloption hd) then 1 + full_option_vehicles tl
					else full_option_vehicles tl ;;