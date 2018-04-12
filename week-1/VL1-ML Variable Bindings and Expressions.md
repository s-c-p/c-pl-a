## Mindset

“Let go” of all programming languages you already know.
So do not compare and contrast until asked.

In fact, don't even think of this as programming


2.35 -- x will hold 34
5.36 -- in SML/NJ you can use earlier bindings (not later, why? because
		designers thought it'd make reasoning about code easier @ 6.06)
6.38 -- Dynamic Environment: env you have when you are running a program
8.14 -- static env holds types of all stuff
10.07 - Prof *thinks* type checking comes before program evaluation



## heading

***it*** is an expression, a something

Syntax:
  how to write ***it*** correctly

Semantics:
  what ***it*** means, especially in context of type-checking (done befo-
  re program runs) and evaluation (during program run)

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
