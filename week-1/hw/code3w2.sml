type date = int * int * int;

fun year_of (d : date) = #1 d;
fun month_of (d : date) = #2 d;
fun day_of (d : date )= #3 d;

fun ainb (needle : ''a, haystack : ''a list) =
    case haystack of
         [] => false
    | h::hs' => (h = needle) orelse (ainb (needle, hs'))
;

fun is_older (a : date, b : date) =
    if year_of a > year_of b
    then
        true
    else if year_of a = year_of b
    then
        if month_of a > month_of b
        then
            true
        else if month_of a = month_of b
        then
            day_of a > day_of b
        else
            false
    else
        false
;

fun get_nth (ss : string list, n : int) =
    case ss of
         [] => NONE
    | s::ss' =>
        if n = 1
        then
            SOME s
        else
            get_nth (ss', n-1)
;

fun nbrs (sum : int, xs : int list) =
    let
        fun f (curr_sum : int, ns : int list, i : int) =
            if null ns
            then
                0-1
            else if null(tl(ns))
            then
                0-2
            else
                if curr_sum - hd(ns) < curr_sum andalso
                    curr_sum - hd(ns) - hd(tl(ns)) >= curr_sum
                then
                    i
                else
                    f (curr_sum - hd(ns), tl(ns), i+1)
        ;
    in
        f (sum, xs, 0)
    end
;

