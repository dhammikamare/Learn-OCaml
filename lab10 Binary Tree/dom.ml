type htmltag = Head | Title | Body | H1 | P ;;

type domtree = Node of htmltag * domtree list ;;

let rec count_tag (dtr:domtree) (t:htmltag) :int = 

	let rec countlist (l:domtree list) :int = 
		match l with 
			| [] -> 0
			| hd::tl -> (count_tag hd t) + (countlist tl) in
			
	let Node(v,l) = dtr in
	
	if v = t then 1 + (countlist l) 
	else countlist l ;;