expressions can be made up of sub-expressions, which can be made up of
sub-expressions ...

So how do we understand expressions? Based on previous chapter, we know
that everything has syntax and semantics -- so to understand an expression
ask the following 3 questions:

  1. syntax - how do I write it
  2. type checking rules
       - produces a type of fails (with error)
  3. evaluation rules (would happen IFF step 2 passed)
       - how expression produces a value or maybe an exception or ∞-loop

 > Also ultimately (the most basic form or simplest expr), expressions
   are built of
		- `values`
		- lang-defined `punctuations`
		- at least one (implicit) variable binding for practical purposes
  Values:
    e.g. 34, true, false, 0, 9, etc.
  Punctuations:
    e.g. `+`, `if`-`then`-`else`, `<=`, etc.

consider the following building blocks

## Variables (not variable binding)

Syntax:
  sequence of letters, digits, _, not starting with digit
Semantics:
	Type Checking:
	  look up type in current static environment, if not found then
	  fail
	Evaluation:
	  look up value in current dynamic environment


