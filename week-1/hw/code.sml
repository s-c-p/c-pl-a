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

fun year_of(date : int*int*int) = #1 date;
fun month_of(date : int*int*int) = #2 date;
fun day_of(date : int*int*int) = #3 date;

fun is_older(fst : int*int*int, scnd : int*int*int) =
    if year_of(fst) < year_of(scnd)
    then
        true
    else if year_of(fst) = year_of(scnd)
    then
        if month_of(fst) < month_of(scnd)
        then
            true
        else if month_of(fst) = month_of(scnd)
        then
            day_of(fst) < day_of(scnd)
        else
            false
    else
        false
;

fun number_in_month(ds : (int*int*int) list, month : int) =
    if null ds
    then
        0
    else
        let
            val next_call = number_in_month(tl(ds), month);
        in
            if month_of(hd(ds)) = month
            then
                1 + next_call
            else
                next_call
        end
;

fun number_in_months(ds : (int*int*int) list, months : int list) =
    if null months
    then
        0
    else
        (* given that months has no repeated values *)
        number_in_month(ds, hd(months)) + number_in_months(ds, tl(months))
;

fun dates_in_month(ds : (int*int*int) list, month : int) =
    if null ds
    then
        []
    else
        let
            val next_call = dates_in_month(tl(ds), month);
        in
            if month_of(hd(ds)) = month
            then
                hd(ds) :: next_call
            else
                next_call
        end
;

fun dates_in_months(ds : (int*int*int) list, months : int list) =
    if null months
    then
        []
    else
        dates_in_month(ds, hd(months)) @ dates_in_months(ds, tl(months))
(*
    if null months
    then
        []
    else
        if h__a_in_b(month_of(hd(ds)), months)
        then
            hd(ds) :: dates_in_months(tl(ds), months)
        else
            dates_in_months(tl(ds), months)
*)
;

fun get_nth(ss : string list, n : int) =
    let
        fun seed(ss2 : string list, i : int) =
            if i = n
            then
                hd(ss2)
            else
                seed(tl(ss2), i+1)
        ;
    in
        seed(ss, 1)
    end
;

fun date_to_string(date : int*int*int) =
    let
        val months = ["January", "February", "March", "April", "May",
            "June", "July", "August", "September", "October", "November",
            "December"];
        val y = year_of(date);
        val m = month_of(date);
        val d = day_of(date);
    in
        get_nth(months, m) ^ " " ^ Int.toString(d) ^ ", " ^ Int.toString(y)
    end
;

fun number_before_reaching_sum(sum : int, xs : int list) =
    let
        fun progress(curr_sum : int, i : int, p_xs : int list) =
            if curr_sum + hd(p_xs) >= sum
            then
                i
            else
                progress(curr_sum+hd(p_xs), i+1, tl(p_xs))
        ;
    in
        progress(hd(xs), 1, tl(xs))
    end
;

fun what_month(diy : int) =
    let
        val dim = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        fun sum_i(till : int, xs : int list) =
            let fun progress(i : int, sum : int, p_xs : int list) =
                    if i = till then sum
                    else progress(i+1, sum+hd(p_xs), tl(p_xs))
                ;
            in
                progress(0, 0, xs)
            end
        ;
        val best_guess = number_before_reaching_sum(diy, dim);
    in
        if sum_i(best_guess, dim) = diy
        then
            best_guess
        else
            best_guess + 1
            (* +1 cuz this is like 2.xx so we say month is 3 *)
    end
;

fun month_range(day1 : int, day2 : int) =
    let
        fun progress( curr : int ) =
            if day2 - curr < 0
            then
                []
            else
                what_month(curr) :: progress(curr+1)
            ;
    in
        progress(day1)
    end
;

fun oldest(ds : (int*int*int) list) =
    let
        fun bin_max(a : int*int*int, b : int*int*int) =
            if is_older(a, b)
            then a
            else b
        ;
    in
        if null ds
        then NONE
        else SOME (
            if null(tl(ds))
            then
                hd(ds)
            else
                bin_max(hd(ds), valOf(oldest(tl(ds))))
        )
    end
;

(*
fun get_index(needle : string, haystack : string list) =
    let
        (* type-checking still left, index is perhaps int option *)
        fun progress(index : int, p_haystack string list) =
            if null(tl(p_haystack))
            then
                if hd(p_haystack) = needle
                then
                    SOME index
                else
                    NONE
            else
                if hd(p_haystack) = needle
                then
                    SOME index
                else
                    progress(index+1, tl(p_haystack))
        ;
    in
        if null(haystack)
        then
            NONE
        else
            progress(1, haystack)
    end
;
*)

fun h__a_in_b(needle : int, haystack : int list) =
    if null haystack
    then
        false
    else
        if hd(haystack) = needle
        then
            true orelse h__a_in_b(needle, tl(haystack))
        else
            h__a_in_b(needle, tl(haystack))
;

fun h__dedup(xs : int list) =
    let
        fun progress(known : int list, p_xs : int list) =
            if null p_xs
            then
                known
            else if h__a_in_b(hd(p_xs), known)
            then
                progress(known, tl(p_xs))
            else
                progress(hd(p_xs) :: known, tl(p_xs))
        ;
    in
        progress([], xs)
    end
;

fun number_in_months_challenge(ds : (int*int*int) list, months : int list) =
    let
        val unique_months = h__dedup(months);
    in
        number_in_months(ds, unique_months)
    end
;

fun dates_in_months_challenge(ds : (int*int*int) list, months : int list) =
    let
        val unique_months = h__dedup(months);
    in
        dates_in_months(ds, unique_months)
    end
;

fun reasonable_date(date : int*int*int) =
    let
        val day = day_of(date);
        val year = year_of(date);
        val month = month_of(date);
        val odd_months = [1, 3, 5, 7, 8, 10, 12];
        val even_months = [4, 6, 9, 11];
    in
        if year > 0
        then
            if month > 0 andalso month < 13
            then
                if h__a_in_b(month, odd_months)
                then
                    day > 0 andalso day <= 31
                else if h__a_in_b(month, even_months)
                then
                    day > 0 andalso day <= 30
                else
                    if year mod 4 = 0
                    then
                        day > 0 andalso day <= 29
                    else
                        day > 0 andalso day <= 28
            else
                false
        else
            false
    end
;

