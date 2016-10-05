(* Task : A vehicle registration system needs to store various details depending on the type of vehicle
 * 	Type 		Details
 * 	3-wheeler 	whether for hire or personal use
 * 	car 			year of manufacture
 * 	lorry 		maximum load (in kilos)
 * Write a definition of a type called 'vehicle' to store these details.
 *
 * Write a function 'registration_fee' that calculates the registration fee of a vehicle based on the following rules.
 * 	3-wheelers: For hire Rs 3000, personal use Rs 2000
 *  Car: Rs 5000 if manufactured after 2010, Rs 3000 otherwise
 *  Lorry: Rs 1000 + max load (in kg) * 10
    
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

type use = Hire | Personal ;;

type vehicle = 
	| Wheeler of use
	| Car of int
	| Lorry of int;;
	
let registration_fee (v:vehicle) :int = 
	match v with 
		| Wheeler(usage) -> if usage=Hire then 3000 else 2000
		| Car(year) -> if year>2010 then 5000 else 3000
		| Lorry(load) -> 1000 + load*10;;

(* test *)
let v1 = Wheeler(Hire);;
let v2 = Car(2012);;
let v3 = Lorry(10);;

registration_fee v1;;
registration_fee v2;;
registration_fee v3;;
