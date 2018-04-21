## Why?

For practical purposes we need to build all kinds of data structures, the very basic building blocks of which are tuples and lists. For sake of understanding upcoming literature, following rudimentary definitions 

Tuple:
  collection of n values, each can be of any type
List:
  collection of arbitary number of values each of identical type

## Pairs

IDK why this special case is discussed, but basically it's just a tuple with exactly 2 elements.

Syntax:
    `(e1, e2)`
    where, e1 and e2 are any valid expressions and the rest is punctuation.

Semantics:
    Type Checking:
        infer type of the final result of evaluating e1 and e2, call them t1 and t2, then the pair expressions has type `t1 * t2`
    Evaluation:
        evaluate e1 to v1 and e2 to v2, so the result is `(v1, v2)`. Note that a pair of values is also a value (of type tuple/pair).

