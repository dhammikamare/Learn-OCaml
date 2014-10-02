type options = {ac:bool; gps:bool; stereo:bool};;

type oiltype = Diesel | Petrol ;;

type vehicle = {voiltype:oiltype; feature:options};;

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