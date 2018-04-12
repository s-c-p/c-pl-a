expressions can be made up of sub-expressions, which can be made up of
sub-expressions ...

So how do we understand expressions? Based on previous chapter, we know
that everything has syntax and semantics -- so to understand an expression
ask the following 3 questions:

  1. syntax - how do I write it
  2. type checking rules
       - produces a type or fails (with error)
  3. evaluation rules (would happen IFF step 2 passed)
       - how expression produces a value, or maybe an exception or ∞-loop

 > Also ultimately (the most basic form or simplest expr), expressions
   are built of
		- `values` (!! my thinking was not true, 5.49)
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

## Values

all values are expressions, but all expressions may not be values

every value evaluates to itself in exactly "zero steps"

so the following matrix doesn't hold meaning
Syntax:
Semantics:
	Type Checking:
	Evaluation:

e.g. `34`, `true`, `()`

## Addition

Syntax:
  `e1 + e2` where `e1` and `e2` are expressions
Semantics:
	Type Checking:
	  if `e1` and `e2` have type int
	  then `e1 + e2` has type int
	Evaluation:
	  if `e1` evaluates to v1 and `e2` evals... to v2
	  then `e1 + e2` evals... to sum of v1 and v2

## Conditional

Syntax:
  `if e1 then e2 else e3`
Semantics:
	Type Checking:
	  e1 must eval to type bool unlimately
	  e2 and e3 must both evaluate to type x, where x can be any valid
	  type
	Evaluation:
	  if `e1` evaluates to true then e2 is computed and e3 ignored
	  else e2 is ignored and e3 is evaluated

## Conclusion

the specifics don't matter as much as the *3 questions*
