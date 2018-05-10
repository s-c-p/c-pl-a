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
    then
        true
    else if (year_of fst) = (year_of scnd)
    then
        if (month_of fst) < (month_of scnd)
        then
            true
        else if (month_of fst) = (month_of scnd)
        then
            if (date_of fst) < (date_of scnd)
            then
                true
            else
                false
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

fun aINb(needle : int, haystack : int list) =
    if null haystack
    then
        false
    else
        if hd haystack = needle
        then
            true orelse aINb(needle, tl haystack)
        else
            aINb(needle, tl haystack)
;

fun valid_date(date : int*int*int) =
    let
        val odd_m = [1, 3, 5, 7, 8, 10, 12];
        val even_m = [4, 6, 9, 11];
    in
        if aINb(month_of(date), odd_m)
        then
            if date_of(date) <= 31
            then
                true
            else
                false
        else if aINb(month_of(date), even_m)
        then
            if date_of(date) <= 30
            then
                true
            else
                false
        else
            if date_of(date) <= 28
            then
                true
            else
                false
    end
;

fun dates_in_month(ds : (int*int*int) list, month : int) =
    if null ds
    then
        []
    else
        if valid_date(hd(ds))
        then
            hd(ds) :: dates_in_month(tl(ds), month)
        else
            dates_in_month(tl(ds), month)
;

