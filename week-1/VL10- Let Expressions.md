## `let` Expressions

`let` expressions
  * are  an  absolutely  crucial  feature  that  allows  for  local  variables  in  a  very  simple,  general, and flexible way
  * are crucial for style and for efficiency
  * lets us have local variables
  * lets us have local bindings of any sort (including function bindings)
  * it is a kind of expression, it can appear anywhere an expression can


Syntax:
    `let b1 b2 ... bn in expr end`
    where  `let ` --- ` in ` --- ` end`
                    is the keyword based punctuation for let expressions
            `bi`    is any kind of binding
            `expr`  is any expression

Semantics:
    semantics (both type checking and evaluation) of let expression bindings are much like top level bindings.
    as soon as a `let` is encounterd, copy of enclosing environment (ES and ED) is created, say ES1 and ED1. Every binding after `let` makes ES1 and ED1 larger and larger.
    the result of evaluating `expr` is the result of the entire let expression and it is the ONLY thing that extends ES and ED.
    as soon as `end` of let expression is encounterd, ES1 and ED1 cease to exist

## Exercise

evaluate
```
let
    val x = 1
in
    (let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
end
```

