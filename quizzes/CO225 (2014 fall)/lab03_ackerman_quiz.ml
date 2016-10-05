(* Task : Given the following definition of the Ackerman function, show the evaluation of ackerman 2 1
 * You only need to show the function application along with the corresponding arguments.
 *
 * Author : Dhammika Marasinghe | https://github.com/dhammika-marasinghe
 *)

let rec ackerman (m:int) (n:int) :int =
  if m=0 then n+1
  else if n=0 then ackerman (m-1) 1
  else ackerman (m-1) (ackerman m (n-1))
  
(* Evaluation of ackerman 2 1*)
= ackerman 2 1
= ackerman 1 (ackerman 2 0)
= ackerman 1 (ackerman 1 1)
= ackerman 1 (ackerman 0 (ackerman 1 0))
= ackerman 1 (ackerman 0 (ackerman 0 1))
= ackerman 1 (ackerman 0 2)
= ackerman 1 3
= ackerman 0 (ackerman 1 2)
= ackerman 0 (ackerman 0 (ackerman 1 1))
= ackerman 0 (ackerman 0 (ackerman 0 (ackerman 1 0)))
= ackerman 0 (ackerman 0 (ackerman 0 (ackerman 0 1)))
= ackerman 0 (ackerman 0 (ackerman 0 2))
= ackerman 0 (ackerman 0 3)
= ackerman 0 4
= 5
