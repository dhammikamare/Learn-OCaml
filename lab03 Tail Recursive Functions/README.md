**Tail Recursive Functions**
-----
Write a tail-recursive function to compute the functions below using the following proce-dure.
1. Write the nested loop function signature with the requried number of accumulators.
2. Write the invariant as a comment.
3. Write the loop base case .
4. Based on the invariant write the loop recursive case.

Write a tail recursive implementation of the Fibonacci sequence.
```ocaml
let fib (n:int) :int = 
	let rec loop (i:int) (a:int) (b:int) :int  =
		if i = n then a
		else loop (i+1) (b) (a+b) in 
	loop 0 0 1;;
```
Recall: Non Tail recursive Fibonacci sequence.
```ocaml
let rec fib n = 
	if n = 0 then 0
	else if n = 1 then 1
	else fib (n-1) + fib (n-2);;
```
Write a tail recursive implementation of the cos(x) without using the factorial and power (**) functions.
Hint: start the summation from the first term.
```ocaml
let cosx_tr (x:float) (n:int) :float = 
	let rec loop (i:int) (a:float) :float = 
		if i = n then a
		else
			let fact = (2*i+1) * (2*i+2) in
			let np1 = a *. (-1.)*. x *. x /. (float fact) in
			loop (i+1) (a +. np1) in
	loop 0 1.;;
```
Recall: Non Tail recursive cos(x).  Note the differences. 
```ocaml
let rec cos_taylor (x:float) (n:int) :float = 
	if n = 0 then 1.0
	else 
		let rec fact (n:int) :int = 
			if n < 2 then 1
			else n * fact(n-1) in
		
		let sign = (-1.)**(float n) in
		let powx = x ** (float (2*n)) in
		(sign *. powx /. float_of_int(fact(2*n))) +. cos_taylor (x) (n-1);;
```

Write a tail recursive implementation of the binomial coefficient(n k) 
```ocaml
let binomial_tr (n:int) (k:int) :int = 
	let rec loop (i:int) (j:int) (a:int) :int = 
		if j = 0 || j = n then a
		else loop (i-1) (j-1) (i/j)*a in
	loop n k 1;;
```
*Note:*
Questions were extracted from CO225 Lab 3 (2014 fall) by Mr. Ziyan Maraikar 