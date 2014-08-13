(* Convert the following expressions to valid Ocaml, by using the proper operators. 
 * Do not change the operands but use type conversion functions instead. 
 * Note down the resultant type of each expression. *)

int_of_float(1.1) + 2*3;;

true &amp;&amp; bool_of_float(0.0);;

true &amp;&amp; bool_of_double(0.0);;

(* there is no way to cast numbers to bool*)

"Hello I am" ^ string_of_int(80) ^ "years old";;

bool_of_string("true") || bool_of_string("false");;
