0.09 -- functions are a new kind of binding, WOW

## Function Binding

Syntax:
```
fun fn_name ( arg : argType, arg2 : argType ... ) =
	expr
```
e.g.
```
fun pow ( b : int, e : int ) =
	if e = 0
	then
		1
	else
		b * pow ( b, e-1 )
```

sign like
`fn : argType * argType2 * ar... -> returnType`

recr allowed
mutual recur, allowed but advanced topic

