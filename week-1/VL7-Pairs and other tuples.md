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
        `#1 (4+4, 3)`

Semantics:
    Type Checking:
        (why do we need type checking here? we are just retreiving value from a store. what you are afraid it'll be modified in the time taken for fetching -- well that's just absurd. In fact, type checking is absurd for this. I wonder if this really happens or the teacher is just making stuff up to stay true to his word)
        ensure each ei of x cabe evaluated (i.e. if ei is an expression, not just a value (42 evaluates to itself), ensure their types are available in static environment.
        further, if x has type `t1 * t2` then `#1 x` should be of type t1 ~ for 2.
    Evaluation:
       return *value* of `i`th element of the pair (and by extension, tuple).
       e.g. `#1 (x, 4)` will return value of x (i.e. dynamic environment look up will take place)

