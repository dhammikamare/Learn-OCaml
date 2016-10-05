let electricity_bill (units:int) :float= 
	let unitfee = 
		if units>199 then (units-199)*20 + 100*10 + 100*5
		else if units>99 then (units-99)*10 + 100*5
		else units*5 in
	200.0 +. (float_of_int unitfee) *. 1.15;;
	
	
(*
electricity_bill 220
>> let unitfee = 
		if 220>199 then (220-199)*20 + 100*10 + 100*5
		else if 220>99 then (220-99)*10 + 100*5
		else 220*5 in
	200.0 +. (float_of_int unitfee) *. 1.15;;
>> let unitfee = 
		if true then (220-199)*20 + 100*10 + 100*5
		else if 220>99 then (220-99)*10 + 100*5
		else 220*5 in
	200.0 +. (float_of_int unitfee) *. 1.15;;
>> let unitfee = 
		(220-199)*20 + 100*10 + 100*5 in
	200.0 +. (float_of_int unitfee) *. 1.15;;
>> let unitfee = 
		(21)*20 + 100*10 + 100*5 in
	200.0 +. (float_of_int unitfee) *. 1.15;;
>> let unitfee = 1920 in
	200.0 +. (float_of_int unitfee) *. 1.15;;
>> 200.0 +. (float_of_int 1920) *. 1.15;;
>> 200.0 +. 1920.0 *. 1.15;;
>> 2408.0
*)