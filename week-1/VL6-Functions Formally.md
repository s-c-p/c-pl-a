8.50

## Function Bindings

?Bind a function defination expression to a name so that it can be used
later

NOTE that function bindings in ML can be recursive, i.e. they can call
themselves

Syntax:
	`fun fn_name (x0 : t0, x1 : t1 ... xn : tn) = expr`
	where,  fun 	is keyword
			fn_name is any suitable name given by us
			xi      is `i`th argument's name, expr will call this using
					the name we give to x1, x2 ... 
			ti		is the type of `i`th argument
			=		is punctuation
			expr	is expression using x0, x1, ...

Semantics:
	Type Checking:
		Extend the static environment with the function binding-
		`fn_name : (t1 * t2 * t3 ... * tn) -> t`
		IFF
			lang can type-check (?conclude/infer) `expr` to be of type `t`
			in static environment containing
			* enclosing static env (earlier bindings)
			* argument with their types
			* 
	Evaluation:
		*** A function is a value. *** which hasn't been evaluated yet.
		Extends dynamic env. with name `fn_name` so later expressions can
		call it (function call semantics allows recursion)

## Function Call

