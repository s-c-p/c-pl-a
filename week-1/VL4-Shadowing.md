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
