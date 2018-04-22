Syntax:
    [e1, e2, e3, ..., en]

Semantics:
    Type Checking
        ensure all `ei`'s evaluate to same type, if they can be evaluated at all
    Evaluation
        eagerly evaluate all `ei` to `vi` and put [v1, v2, ..., vn] into the dynamic environment.

## `cons` operator

Syntax:
    `e1 :: e2`

Semantics:
    Type Checking
        e1 of type `t`
        e2 of type `t list`
    Evaluation
        [v1, elements of e2 come here]

## Some list functions

null, hd, tl (see their types in REPL)

## Special Notes

The tail of a list is a list containing all the elements of the original list except the list's first element (its head).

[] has type `'a list` pronounced alpha list which really means list of anything

i.e. really crazy things like `((int * int) * bool) list` which would looks something like `[((2, 3), true), ((4, 5), false), ((8, 9), 2=2)]`

`tl [1]` is [], but `tl []` raises error

VERY IMPORTANT -- data is immutable in SML, therefore `hd x` doesn't chop off the head of the list, the list remains unchanged, so `val a = hd x; val b = hd x` will have `a = b` (discovered @ 6.50 of next lecture, solving the problem myself)

