**CO225 – SOFTWARE CONSTRUCTION : Mid Quiz**
-----

Every function you write must have a comment describing the parameters used.

Mid-Task 1: The exponential function can be defined on the complex plane as
e^z = ? z^n / n! , n = 0, Inf
where z is a complex number.
Write a function to compute e^z by expanding the above series to a specified number of terms.
You should represent complex numbers as tuples.
Hint: The nth term tn of the series above is t(n) = (z/n)* t(n-1), for n > 0
```ocaml
let complex_sum (x1, y1) (x2, y2) = 
	(x1+.x2, y1+.y2);;

let complex_mul (x1, y1) (x2, y2) = 
	(x1*.x2-.y1*.y2, x1*.y2+.y1*.x2);;
	
let exp_z (x, y) imax = 
	let rec loop i tnp ez = 
		if i = imax then ez
		else
			let zt = (x/.(float)i, y/.(float)i) in 
			let tn = complex_mul zt tnp in 
			loop (i+1) tn (complex_sum ez tn) in
			
	loop 1 (1.,1.) (1.,1.);;
```
	
Mid-Task 2: 
Macro cars makes several different models of cars. The need to store the following details about a model’s features.

Feature: Attributes
Engine: type (petrol, diesel), capacity (in litres)
Options: A/C, GPS, Stereo

Note that the “Option” feature can have more than one value. For example a model can have A/C and GPS and a stereo.

Write the required type definitions to store a model’s features described above. The type containing all features should be called model.
Hint: You should NOT use string as the type of any attribute!
```ocaml
type options = {ac:bool; gps:bool; stereo:bool};;

type oiltype = Diesel | Petrol ;;
type engine = {voiltype:oiltype; capacity:float};;

type vehicle = {vengine:engine; feature:options};;
```

Write a function full_option that takes a list of models and counts how many of the models have all 3 options.
```ocaml
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
```

*Note:*
Quizzes were made by Mr. Ziyan Maraikar for CO225 (2014 fall).
