(* Task : Define your own boolean type using variants.
 * (a) Define functions for the logical operations implies and xor.
 * (b) Extend this type definition to three-valued logic.
 * 	   Define the and and or operations for this type.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

type boolean = True | False;;

let implies (a:boolean) (b:boolean) :boolean = 
	match (a, b) with
		| (True, False) -> False
		| (_, _) -> True;;
		
let xor (a:boolean) (b:boolean) :boolean = 
	match (a, b) with
		| (False, False) | (True, True) -> False
		| (_, _) -> True;;

type boolean = True | False | Unknown;;
		
let and3 (a:boolean) (b:boolean) :boolean = 
	match (a, b) with
		| (True, True) -> True
		| (False, _) | (_, False) -> False
		| (_, _) -> Unknown;;

let or3 (a:boolean) (b:boolean) :boolean = 
	match (a, b) with
		| (False, False) -> False
		| (True, _) | (_, True) -> True
		| (_, _) -> Unknown;;
		
