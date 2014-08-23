**Recursive Functions**
-----
Write recusrive functions to compute the following functions by evaluating its Taylor series up to n terms.

log(1+x)
```ocaml
let rec log_taylor (x:float) (n:int) :float = 
	if n = 1 then x
	else 
		let sign = if (n mod 2) = 0 then -1. else 1. in 
		(* this is more efficient in calculating sign than using (-1.)**(float (n+1)) *)
		let powx = x ** (float n) in
		(sign *. powx /. (float n)) +. log_taylor (x) (n-1);;
```
cos (x)
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
Write a function to calculate the binomial coefficients are defined by the recurrence.
```ocaml
let rec binomial_coeff (n:int) (k:int) :int = 
	if k = 0 || k = n then 1
	else binomial_coeff (n-1) (k-1) + binomial_coeff (n-1) (k);;
```
Write a definition for the Ackermann function.
Be careful when testing as the function grows large very suddenly!

```ocaml
let rec ackermann (m:int) (n:int) :int = 
	if m = 0 then (n+1)
	else
		if n = 0 then ackermann (m-1) (1)
		else ackermann (m-1) (ackermann (m) (n-1));;
```

*Note:*
Questions were extracted from CO225 Lab 2 (2014 fall) by Mr. Ziyan Maraikar 