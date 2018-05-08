(*
* Illustrates importance of analyzing types 
*
* the lower most commented block was written first,
* everything above it was written later progressively
*)


fun max ( xs : int list ) =
    let
        fun bin_max ( a : int, b : int ) =
            if a >= b
            then a
            else b
    in
        if null xs
        then
            NONE
        else
            SOME (
                if null (tl xs)
                then hd xs
                else bin_max (hd xs, valOf (max (tl xs)))
            )
    end
;
(* working -- 
fun max ( xs : int list ) =
    let
        fun bin_max ( a : int, b : int ) =
            if a >= b
            then a
            else b
    in
        if null xs
        then
            NONE
        else
            if null (tl xs)
            then SOME (hd xs)
            else SOME (bin_max (hd xs, valOf (max (tl xs))))
    end
;
*)
(* working --
fun max ( xs : int list ) =
    let
        fun bin_max ( a : int, b : int option ) =
            if a >= valOf b
            then SOME a
            else SOME (valOf b)
            (* same as --  `else b` *)
    in
        if null xs
        then
            NONE
        else
            if null (tl xs)
            then SOME (hd xs)
            else bin_max ( hd xs, max (tl xs) )
    end
;
*)
(* not working --
fun max ( xs : int list ) =
    let
        fun bin_max ( a : int, b : int ) =
            if a >= b
            then a
            else b
    in
        if null xs
        then
            NONE
        else
            SOME (
                if null (tl xs)
                then hd xs
                else bin_max ( hd xs, max (tl xs) )
            )
    end
;
*)
