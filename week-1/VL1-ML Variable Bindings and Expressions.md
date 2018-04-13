## Mindset

“Let go” of all programming languages you already know.
So do not compare and contrast until asked.

In fact, don't even think of this as programming


## From the PDF

An ML program is a sequence of bindings. Each binding gets type-checked and
then (assuming it type-checks) evaluated.
	- page 2, para 2

There are several kinds of binding
	- page 2, para 3


## (covered at last but needs to be understood first)

***it*** is an expression, a something

Syntax:
  how to write ***it*** correctly

Semantics:
  what ***it*** means, from implementation POV it means 2 things
   - type checking - done before program runs 
   - evaluation - during program run






2.35 -- x will hold 34
5.36 -- in SML/NJ you can use earlier bindings (not later, why? because
		designers thought it'd make reasoning about code easier @ 6.06)
6.38 -- Dynamic Environment: env you have when you are running a program
8.14 -- static env holds types of all stuff
10.07 - Prof *thinks* type checking comes before program evaluation



## Variable Binding

Syntax `val var_name = exp;`
	where,  val		 is keyword
			var_name is variable
			exp      is any valid expression
			=        is punctuation
			; 		 is punctuation

 > Foresight : definations of language parts must be recursive capable
 how else would someone ensure `exp` works

Semantics
	1. type check expression and extend static env.
	2. evaluate expression and extend dynamic env.

## if Conditional

if conditional is an expression, consider the example
	val abs_of_x = if x < 0 then 0 - x else x;

Syntax `if e_bool then t_e_typeA else f_e_typeA`
	where,  if        is keyword
			then      is keyword, punctuated
			else      is keyword, punctuated
			e_bool    is an expr which MUST yield bool
			t_e_typeA is the expr which is eval if e_bool is true
					this expr may yield any type A
			t_f_typeA is the expr which is eval if e_bool is false
					this expr MUST yield answer of above mentioned type A


