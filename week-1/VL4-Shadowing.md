The motto of this lecture is to

 > really understand how environments work

1.40 -- once a variable binding is evaluated, the value bound to that
		(variable) name DOES NOT CHANGE EVEN IF it's constituent
		variable_names are later (below in file) bound to

So,

```
val a = 10
(* dynamic environment: a -> 10 *)

val b = a * 2
(* dynamic environment: a -> 10, b -> 20 *)

val a = 5
(* dynamic environment: a -> 5, b -> 20 THEREFORE *)

val c = b
(* dynamic environment: a -> 5, b -> 20, c -> 20 *)
```

2.26 -- `val a = 5` is NOT an assignment; SML doesn't have the concept
		of assignment

 > Foresight: `=` is overloaded, if LHS begins with `val` name then the
 expr. becomes variable binding otherwise it is an equality checker

 > See doubts 1 and 2

2.50 -- Shadowed =>
		different mapping for var_name in a different environment

## Why?

Given that

```
val a = 1
(* dynamic environment: a -> 1 *)

val b = a
(* dynamic environment: a -> 1, b -> 1 *)

val a = 2
(* dynamic environment: a -> 2, b -> 1 *)
```

`<hidden-value>` shows that shadowing is happening


## Doubts

1. what is the significance of semi-colons?

file1.sml
```
val a = 2
val a = 3
```

file2.sml
```
val a = 2;
val a = 3;
```

In REPL, `use`ing file1 works as expected (as shown in video) and REPL
shows the `<hidden-value>` thingy. But doing the same (in a new REPL
instance) to file2 doesn't show any signs of shadowing.

This is potty behaviour. What terminates an expression? New line it seems
but then why does REPL require `;` at end of all expressions?

2. is a constant different from another constant even if they have same
semantic / real-world value?

shadow_doubt.sml
```
val a = 2
val a = 2
```

use the above file in REPL and see that a is still shadowed, why?
