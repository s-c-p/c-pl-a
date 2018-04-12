Noteworthy points:

  * `use "file_name.sml";` enters bindings from file `file_name.sml`
    to current REPL session as if they were typed by hand
  * for reason discussed in next chapter ** use `use` only once per file
    in a single REPL session **
  * Your mistake could be:

	- Syntax: What you wrote means nothing or not the construct you 
	intended
	- Type-checking: What you wrote does not type-check
	- Evaluation: It runs but produces wrong answer, or an exception, 
	or an infinite loop

    Keep these straight when debugging even if sometimes one kind of 
    mistake appears to be anothe
