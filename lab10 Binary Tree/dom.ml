type htmltag = 
	| Html
	| Head 
	| Title 
	| Body 
	| H1 
	| P ;;

type domtree = Node of htmltag * domtree list ;;

let rec count_tag (dtr:domtree) (t:htmltag) :int = 

	let rec countlist (l:domtree list) :int = 
		match l with 
			| [] -> 0
			| hd::tl -> (count_tag hd t) + (countlist tl) in
			
	let Node(v,l) = dtr in
	
	if v = t then 1 + (countlist l) 
	else countlist l ;;

let string_of_htmltag (tag:htmltag) :string = 
	match tag with
		| Html -> "html"
		| Head -> "head"
		| Title -> "title"
		| Body -> "body"
		| H1 -> "h1"
		| P -> "p"
		| _ -> "" ;;
	
let rec dom_tostring (dtr:domtree) :string =
	
	let rec list_tostring (l:domtree list) :string = 
		match l with 
			| [] -> ""
			| hd::tl -> (dom_tostring hd) ^ (list_tostring tl) in
			
	let Node(v,l) = dtr in
	let s = string_of_htmltag v in
	"<" ^ s ^ ">" ^ (list_tostring l) ^ "</" ^ s ^ ">";;


let dt = Node(Html,
				[Node(Title, []); Node(Body, [])]) ;;

count_tag dt Title ;;

dom_tostring dt ;;
