type htmltag = 
	| Html
	| Head 
	| Title 
	| Body 
	| H1 
	| P ;;

type domtree = 
	| Content of string
	| Node of htmltag * domtree list ;;

let rec count_tag (dtr:domtree) (t:htmltag) :int = 

	let rec countlist (l:domtree list) :int = 
		match l with 
			| [] -> 0
			| hd::tl -> (count_tag hd t) + (countlist tl) in
			
	match dtr with
		| Content(s) -> 0
		| Node(v,l) -> 
			if v = t then 1 + (countlist l) 
			else countlist l ;;

let string_of_htmltag (tag:htmltag) :string = 
	match tag with
		| Html -> "html"
		| Head -> "head"
		| Title -> "title"
		| Body -> "body"
		| H1 -> "h1"
		| P -> "p" ;;
	
let rec string_of_domtree (dtr:domtree) :string =
	
	let rec string_of_domlist (l:domtree list) :string = 
		match l with 
			| [] -> ""
			| hd::tl -> (string_of_domtree hd) ^ (string_of_domlist tl) in
			
	match dtr with
		| Content(s) -> s
		| Node(v,l) ->
			let stag = string_of_htmltag v in
			"<" ^ stag ^ ">" ^ (string_of_domlist l) ^ "</" ^ stag ^ ">";;

let dt = Node(Html,
				[Node(Title, [Content("My Web Page")]); 
				 Node(Body, 
					[Node(H1, [Content("Welcome !!!")]);
					 Node(P, [Content("Hello world")]);
					 Content("This is so coool :) ")
					]);
				]
			) ;;

(* test *)

count_tag dt H1 ;;

string_of_domtree dt ;;
