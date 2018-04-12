## Mindset

“Let go” of all programming languages you already know.
So do not compare and contrast until asked.

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
