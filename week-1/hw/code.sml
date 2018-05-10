(*
* In all problems, a “date” value of type int*int*int
* where the first part year, second month, and third day
* A “reasonable” date has a positive year, a month between 1 and 12, and
* a day no greater than 31 (or less depending on the month).
* 
* solutions need to work correctly only for reasonable dates
*
* A  “day  of year”  is  a  number  from  1  to  365, for example, 33
* represents February 2.  (We ignore leap years except in one.
*)

fun year_of ( d : int*int*int ) = #1 d;
fun month_of ( d : int*int*int ) = #2 d;
fun date_of ( d : int*int*int ) = #3 d;

fun is_older ( fst : int*int*int, scnd : int*int*int ) =
    if (year_of fst) < (year_of scnd)
    then true
    else if (year_of fst) = (year_of scnd)
    then
        if (month_of fst) < (month_of scnd)
        then true
        else if (month_of fst) = (month_of scnd)
        then
            (date_of fst) < (date_of scnd)
        else false
    else false
;

fun number_in_month(ds : (int*int*int) list, month : int) =
    if null ds
    then
        0
    else
        if month_of(hd(ds)) = month
        then
            1 + number_in_month(tl(ds), month)
        else
            number_in_month(tl(ds), month)
;

fun number_in_months ( ds : (int*int*int) list, months : int list ) =
    if null months
    then
        0
    else
        number_in_month ( ds, hd months ) + number_in_months ( ds, tl months )
;

fun dates_in_month(ds : (int*int*int) list, month : int) =
    if null ds
    then
        []
    else
(*
        if h__valid_date(hd(ds))
        then
            hd(ds) :: dates_in_month(tl(ds), month)
        else
            dates_in_month(tl(ds), month)
fun h__valid_date(date : int*int*int) =
    (* checks if date is valid for a given month *)
    let
        val odd_m = [1, 3, 5, 7, 8, 10, 12];
        val even_m = [4, 6, 9, 11];
    in
        if h__a_in_b(month_of(date), odd_m)
        then
            date_of(date) <= 31
        else if h__a_in_b(month_of(date), even_m)
        then
            date_of(date) <= 30
        else
            date_of(date) <= 28
    end
;

*)

        let
            val next_call = dates_in_month(tl(ds), month)
        in
            if month_of(hd(ds)) = month
            then
                hd(ds) :: next_call
            else
                next_call
        end
;

fun h__a_in_b(needle : int, haystack : int list) =
    if null haystack
    then false
    else
        let
            val head = hd(haystack);
            val tail = tl(haystack);
            val next_call = h__a_in_b(needle, tail);
        in
            if head = needle
            then
                true orelse next_call
            else
                next_call
        end
;

fun dates_in_months(ds : (int*int*int) list, months : int list) =
    if null ds
    then
        []
    else
        if h__a_in_b(month_of(hd(ds)), months)
        then
            hd(ds) :: dates_in_months(tl(ds), months)
        else
            dates_in_months(tl(ds), months)
;

(*
done using @, but this spoils order and may cause repetition
fun dates_in_months(ds : (int*int*int) list, months : int list) =
    if null months
    then
        []
    else
        dates_in_month(ds, hd(months)) @ dates_in_months(ds, tl(months))
;
*)

fun get_nth(ss : string list, n : int) =
    let
        fun f(sl : string list, curr : int) =
            if curr = n
            then
                hd(sl)
            else
                f(tl(sl), curr+1)
        ;
    in
        f(ss, 1)
    end
;

fun date_to_string(dt : int*int*int) =
    let
        val months = ["January", "February", "March", "April", "May",
            "June", "July", "August", "September", "October",
            "November", "December"];
        val d = date_of(dt);
        val m = month_of(dt);
        val y = year_of(dt);
    in
        get_nth(months, m) ^ " " ^  Int.toString(d) ^ ", " ^ Int.toString(y)
    end
;

