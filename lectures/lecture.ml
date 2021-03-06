(* ################################### 2014-06-27*)

(* Conditional Evaluations*)

let sign n = 
	if n>0 then 1
	else if n=0 then 0
	else -1;;

let abs x = 
	if x>=0 then x
	else -1 * x;;

let grade (m:int) :char = 
	if m>=80 then 'A'
	else if m>=60 then 'B'
	else if m>=40 then 'C'
	else 'F';;

(* Inductive Definitions*)

let rec fact (n:int) :int = 
	if n<2 then 1
	else n * fact (n - 1);;
	
let rec fib n = 
	if n=0 then 0
	else if n=1 then 1
	else fib (n-1) + fib (n-2);;

(* ################################### 2014-06-30*)

let rec e_x (x:float) (n:int) :float =
	if n=0 then 1.
	else (x ** (float n) /. float (fact n)) +. e_x (x) (n-1);;
	
(* Euclidean GCD algorithm *)
let rec gcd (a:int) (b:int) :int = 
	if b=0 then a
	else gcd b (a mod b);;
	
(* calcualate x^y *)
let rec power (x:int) (y:int) :int = 
	if y=0 then 1
	else x * power x (y-1);;

let rec power (x:int) (y:int) :int = 
	if y=0 then 1
	else let half_xy = power x (y/2) in
		if (y mod 2)=0 then  half_xy * half_xy
		else x * half_xy * half_xy;;
	
(* ################################### 2014-07-04*)

(* Tail Recursion*)

let rec tr_fact (n:int) (a:int) :int = 
	if n=0 then a
	else tr_fact (n-1) (n*a);;
	
	
let fact (n0:int) :int = 
	let rec tr_fact (n:int) (a:int) :int = 
		if n=0 then a
		else tr_fact (n-1) (n*a) in 
	tr_fact n0 1;;
	
	
(* ################################### 2014-07-07*)

(* Compute factorial using tail recursion *)
let fact (n:int) :int = 
	(* INV: a * i! = n! *)
	let rec loop (i:int) (a:int) :int = (* i-index value, a-accumulator *)
		if i=0 then a
		else loop (i-1) (n*a) in 
	loop n 1;;
	
let power (x:int) (n:int) :int = 
	(* INV: a * x^i = x^n *)
	let rec loop (i:int) (a:int) :int = 
		if i=0 then a
		else loop (i-1) (a*x) in 
	loop n 1;;
	
(* Tail recursive Fibonnacci sequence. *)
let fib (n:int) :int = 
	(* INV: a=fib(i), b=fib(i+1) *)
	let rec loop (i:int) (a:int) (b:int) :int  =
		if i=n then a
		else loop (i+1) (b) (a+b) in 
	loop 0 0 1;;
	
(* ################################### 2014-07-11 No lecture*)

(* ################################### 2014-07-14*)

(* Tuple*)

let day = ("sunday", 0);;
(* val day : string * int = ("sunday", 0)   *)
	
(1, (2, 3));;
- : int * (int * int) = (1, (2, 3)) 
	
();;
- : unit = ()   
	
let (x,y,z) = (1., -1., 0);;
val x : float =1.
val y : float = -1.
val z : int = 0                       

let (x,y,z) = (1., -1.);;
Error: This expression has type 'a * 'b but an expression was expected of type 'c * 'd * 'e 

let euclidean_dist (p1: float*float) (p2: float*float) :float = 
	let (x1, y1) = p1 in 
	let (x2, y2) = p2 in
	((x1-.x2)** 2. +. (y1-.y2)** 2.) ** 0.5;;
	
val euclidean_dist : float * float -> float * float -> float = <fun> 
utop # euclidean_dist (0., 0.) (3., 4.);;
- : float = 5. 
	
let euclidean_dist ((x1:float), (y1:float)) ((x2:float), (y2:float)) :float = 
	((x1-.x2)** 2. +. (y1-.y2)** 2.) ** 0.5;;
	
val euclidean_dist : float * float -> float * float -> float = <fun> 
utop # euclidean_dist (0., 0.) (3., 4.);;
- : float = 5. 

let euclidean_dist (x1, y1) (x2, y2) = 
	((x1-.x2)** 2. +. (y1-.y2)** 2.) ** 0.5;;
	
let dot3d (p1:float*float*float) (p2:float*float*float) :float = 
	let (x1, y1, z1) = p1 in 
	let (x2, y2, z2) = p2 in
	(x1*.x2)+.(y1*.y2)+.(z1*.z2);;
	
val dot3d : float * float * float -> float * float * float -> float = <fun>  
utop # dot3d (1.,1.,1.) (2.,3.,4.);;
- : float = 9. 

let det_2by2 ((r1:float*float), (r2:float*float)) :float = 
	let (a11, a12) = r1 in
	let (a21, a22) = r2 in
	
	(a11*.a22) -. (a21*.a12);;

utop # det_2by2 ((1.,1.),(1.,1.));;
- : float = 0.   




























