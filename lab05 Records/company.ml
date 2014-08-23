(* Task : (a) Define a record to store company employee details given below. 
 * Use appropriate data types for the fields.
 * first and last name, salary, marital status
 * (b) Now define a record to store details of a company department.
 * 	   department name, head
 * (c) Write a function to check whether two departments have the same head.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

type employee = {fname:string; lname:string; salary:int; marital_status:bool};;

type department = {name:string; head:employee};;

let checkDepartmentHeads (d1:department) (d2:department) :bool = 
	if d1.head = d2.head then true
	else false;;