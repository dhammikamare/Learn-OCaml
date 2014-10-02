(* Task : A company needs to store the following details about its warehouse stocks
 * 	Data type 	Attributes
 * 	item 		description, price, supplier 
 * 	supplier 	name, address
 * Write type definitions for storing these details in records
 * Write a function "cheaper_supplier" that takes two items as parameters. 
 * If the description of the two items are the same, it returns the supplier of the item with the lower price. 
 * If the item descriptions are different simply return the supplier of the first item.
 * 
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

type supplier = {name:string; address:string};;

type item = {description:string; price:float; supp:supplier};;

let cheaper_supplier (i1:item) (i2:item) :supplier =
	if i1.description = i2.description then 
		if i1.price <= i2.price then i1.supp
		else i2.supp
	else i1.supp;;

(* test *)
let s1 = {name="Dha"; address="wa"};;
let s2 = {name="Su"; address="ba"};;

let i1 = {description="Sun"; price=1.; supp=s1};;
let i2 = {description="fd"; price=9.; supp=s2};;

cheaper_supplier i1 i2 ;;

