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
			expr	is expression i.e. what we'd call the function
                    body

Semantics:
	Type Checking:
		End result of function binding is extension of the enclosing
		static environment such that `fn_name` gets associated with the
		following type
		`(t1 * t2 * t3 ... * tn) -> t`
		this happens IFF
			lang can type-check (figure out / conclude / infer) `expr`'s end
			result to be of type `t` in a new static environment S created
            for function binding. To contruct S
			1. copy enclosing static environment (i.e. earlier bindings)
               into S
			2. extend S with info about type of each argument (available in
			  `fn_name (x1 : t1, x2 : t2... xn : tn)`)
			3. extend above S with this fn's own return type, i.e.
			  `fn_name : (t1 * t2 * ... tn) -> t`
			  because the function body may be recursive.
		How `t` is determined is magic which will be discussed in later
		chapters.
		[I think it's like -- if fn is revursive THEN it MUST have a
		conditional (else it is an ∞loop) which has at least one branch which
		doesn't call the fn itself, this I'll call the *terminating branch*.
		Since all branches of a conditional expr must have same type ∴
		determining the type of *terminating branch* will determine the type
		of recursive fn]
		NOTE: the fact that a new static environment is created everytime
		ensures the arguments (the variable names) are not there in the
		static environment which comes after this binding; they're ONLY in
		the static environment which is created for the body of the function
	Evaluation:
		When we write a function binding, the lang adds that name and
		associated `expr` to the dynamic env. so that we can call it later
		HOWEVER the expr is not evaluated at just that time. ∴
		*** A function is a value. ** which hasn't been evaluated yet.*
		Function body, the `expr`'s, evaluation happens when we call the
		function.

## Function Call

Syntax:
    `fn_name (e1, e2, ..., en)`
    where,  fn_name is function name
            ei      is i-th expression which is bound to
                    `fn_name`'s respective argument
            n       is the number of arguments

Semantics:
	Type-checking:
        `fn_name`'s type' looks like `(t1 * t2 * ... tn) -> t`
        ei can be infered to have type ti ∀ i ∈ [1, n]
	Evaluation:
        function evaluation occours in a new dynamic environment D
        - which is created on top of (as a copy of) the dynamic
          environment existing at the point where function was defined
        - eagerly evaluate ei (to vi) and bind the resultant values to
          respective argument names in D
        - evaluate `expr` in D, and the result value (if its not an
          error or ∞loop) is sent back to calling environment
        implications
        ```
        val x = 5
        val y = 6
        fun fn_name ( a : int, b : int ) =
          a + b + z
        val z = 7
        val ans = fn_name(1, 2)
        ```
        will raise error because the point where function is defined
        doesn't know `z`, although calling happens after `z`'s variable
        binding
        ```
        val x = 5
        val y = 6
        fun fn_name ( a : int, b : int ) =
          a + b + y
        val ans = fn_name(1, 2)
        ```
        will have `ans` bound to (1 + 2 + 6) 9, not so interesting,
        however the following example is truly illuminating
        ```
        val x = 5
        val y = 6
        fun fn_name ( a : int, b : int ) =
          a + b + y
        val y = 7
        val ans = fn_name(1, 2)
        ```
        will ALSO have `ans` as (1+2+6) 9 not (1+2+7) 10

