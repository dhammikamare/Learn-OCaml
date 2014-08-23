(* Task : Write a function called capitalise that capitalises 
 * a single character using the formula 
 * C = c - 'a' + 'A', 
 * where C stands for the character c capitalised. 
 * (Define constants for 'A' and 'a'.) 
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let capitalise (c:char) :char = 
	let offset = int_of_char 'A' - int_of_char 'a' in 
	char_of_int(int_of_char(c) + offset);;
	
(* test *)
capitalise 'd';;