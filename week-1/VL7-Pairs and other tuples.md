## Why?

For practical purposes we need to build all kinds of data structures, the very basic building blocks of which are tuples and lists. For sake of understanding upcoming literature, following rudimentary definitions 

Tuple:
  collection of n values, each can be of any type
List:
  collection of arbitary number of values each of identical type

## Pairs

IDK why this special case is discussed (perhaps to ease syntax explaination of pair access), but basically it's just a tuple with exactly 2 elements.

#### Pair Declaration

Syntax:
    `(e1, e2)`
    where, e1 and e2 are any valid expressions and the rest is punctuation.

Semantics:
    Type Checking:
        infer type of the final result of evaluating e1 and e2, call them t1 and t2, then the pair expressions has type `t1 * t2`
    Evaluation:
        evaluate e1 to v1 and e2 to v2, so the result is `(v1, v2)`. Note that a pair of values is also a value (of type tuple/pair).

#### Pair Access

NOTE: this is not the only way to access, but those we'll learn when we learn pattern matching

Syntax:
    `#i x`
    where,  # is punctuation
            i is either 1 or 2
            x is either a pair expression or name bound to a pair
    e.g.
        `#1 (4+4, 3)` gives 8
        `#2 a_pair` gives second element of a_pair if it exists in dynamic environment.

Semantics:
    Type Checking:
        ensure each ei of x can be evaluated (i.e. if ei is an expression, not just a value (42 evaluates to itself), ensure their types are available in static environment.
        x should be a pair (tuple i.e. `t1 * t2` kind of thingy) type in static environment [see-- 2.55] ensure i denotes a valid number (can't ask for #3 in a pair)
        finally, if x has type `t1 * t2` then `#1 x` should be of type t1 ~ for 2.
    Evaluation:
       return *value* of `i`th element of the pair (and by extension, tuple).
       e.g. `#1 (x, 4)` will return value of x (i.e. dynamic environment look up will take place)

## Doubt

Condsider

```
fun swap ( pr : int * int ) =
    (#2 pr, #1 pr);
```

since this is a function with just one argument we can call it using 2 different syntaxes
    1. `fn_name arg` (i.e. without enclosing paren.s)
    2. `fn_name(arg)` (i.e. with paren.s)
however in this case, of `swap`, the argument's syntax itself has surrounding paren.s (i.e. if it's not bound to a name).

It feels good to know that syntax-1 `swap (2, 3)` works fine, and so does syntax-2 `swap((2, 3))`. But the type signature of function got me curious and I discovered that `swap(((((((((2, 3)))))))))` also works without any problems.

Why?

**Perhaps all that matters is the tuple's type signature (`int * int` in this case)**, so for a fn

```
fun add_cood ( p1 : int * int, p2 : int * int ) =
    ((#1 p1 + #1 p2), (#2 p1 + #2 p2))
;
```

REPL tells `add_cood`'s type is `(int * int) * (int * int) -> (int * int)` so obviouly, `add_cood ((1, 1), (2, 2));` works flawlessly while `add_cood (1, 1, 2, 2);` raises error. I don't understand how `int * int * int * int` is different from `(int * int) * (int * int)`, in context of doubts raised by `swap`




