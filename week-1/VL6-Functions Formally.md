8.50

## Function Bindings

?Bind a function defination expression to a name so that it can be used
later

NOTE that function bindings in ML can be recursive, i.e. they can call
themselves

Syntax:
	`fun fn_name (x0 : t0, x1 : t1 ... xn : tn) = expr`
	where,  fun 	is keyword used to make function bindings
			fn_name is any suitable name given by us
			xi      is `i`th argument's name
			ti		is the type of `i`th argument
			=		is punctuation seprating function signature and
					function definition
			expr	is expression using x0, x1, ...

Semantics:
	Type Checking:
		End result of function binding is to extend the static environment
		with the following type
		`fn_name : (t1 * t2 * t3 ... * tn) -> t`
		IFF
			lang can type-check (figure out / conclude / infer) `expr`'s end
			result to be of type `t` in a static environment containing
			* enclosing static env (i.e. earlier bindings)
			* info about type of each argument (available in `x1:t1, x2:t2...`
			* this fn's own return type, i.e.
			  `fn_name : (t1 * t2 * ... tn) -> t`
			  because the function body may be recursive.
		How `t` is determined is magic which will be discussed in later
		chapters.
		[if fn is revursive THEN it MUST have a conditional (else it is
		 an ∞loop) which has at least one branch which doesn't call the fn
		 itself, this I'll call the *terminating branch*. Since all branches
		 of a conditional expr must have same type therefore determining the
		 type of *terminating branch* will determine the type of recursive fn]
	Evaluation:
		When we write a function binding, the lang adds that name and
		associated `expr` to the dynamic env. so that we can call it later
		HOWEVER the expr is not evaluated at just that time. ∴
		*** A function is a value. ** which hasn't been evaluated yet.*
		Function body, the `expr`'s, evaluation happens when we call the
		function.

## Function Call

