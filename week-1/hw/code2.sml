fun day_of(date : int*int*int) = #3 date;
fun year_of(date : int*int*int) = #1 date;
fun month_of(date : int*int*int) = #2 date;

fun is_older(date1 : int*int*int, date2 : int*int*int) =
    if year_of(date1) = year_of(date2)
    then
        if month_of(date1) = month_of(date2)
        then
            day_of(date1) < day_of(date2)
        else
            month_of(date1) < month_of(date2)
    else
        year_of(date1) < year_of(date2)
;

fun number_in_month(dates : (int*int*int) list, month : int) =
    if null(dates)
    then
        0
    else
        (if month_of(hd(dates)) = month then 1 else 0) +
        number_in_month(tl(dates), month)
;

fun number_in_months(dates : (int*int*int) list, months : int list) =
    if null(months)
    then
        0
    else
        number_in_month(dates, hd(months)) +
        number_in_months(dates, tl(months))
;

fun dates_in_month(dates : (int*int*int) list, month : int) =
    if null(dates)
    then
        []
    else
        if month_of(hd(dates)) = month
        then
            hd(dates) :: dates_in_month(tl(dates), month)
        else
            dates_in_month(tl(dates), month)
;

fun dates_in_months(dates : (int*int*int) list, months : int list) =
    if null(months)
    then
        []
    else
        dates_in_month(dates, hd(months)) @
        dates_in_months(dates, tl(months))
;

fun get_nth(words : string list, n : int) =
    if n = 1
    then
        hd(words)
    else
        get_nth(tl(words), n-1)
;

fun date_to_string(date : int*int*int) =
    let
        val months = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"];
    in
        get_nth(months, month_of(date)) ^ " "  ^
        Int.toString(day_of(date))      ^ ", " ^
        Int.toString(year_of(date))
    end
;

fun number_before_reaching(sum : int, xs : int list) =
    if sum <= hd(xs)
    then
        0
    else
        1 + number_before_reaching(sum - hd(xs), tl(xs))
;

fun what_month(diy : int) =
    let
        val dim = [31,28,31,30,31,30,31,31,30,31,30,31];
    in
        number_before_reaching(diy, dim) + 1
        (* +1 because of nature of number_before_reaching *)
    end
;

fun month_range(day1 : int, day2 : int) =
    if day1 > day2
    then
        []
    else
        what_month(day1) :: month_range(day1+1, day2)
;

fun oldest(dates : (int*int*int) list) =
    let
        fun older(date1 : int*int*int, date2 : (int*int*int) option) =
            (* finding max or min is a binary operation like add or mul
            * so we define this function to do just that - get the oldest
            * from exactly TWO dates *)
            if is_older(date1, valOf(date2))
            then date1
            else valOf(date2)
        ;
    in
        if null(dates)
        then NONE
        else SOME (
            if null(tl(dates))
            then
                hd(dates)
            else
                older(hd(dates), oldest(tl(dates)))
        )
    end
;

(* 
number_before_reaching(1, [2]) = 0;
number_before_reaching(2, [2]) = 0;
number_before_reaching(3, [2]) = 0; error
number_before_reaching(5, [5, 6, 7]) = 0;
number_before_reaching(6, [5, 6, 7]) = 1;
number_before_reaching(6, [0, 1, 2, 3, 4, 5, 6, 7]) = 3;
number_before_reaching(11, [5, 6, 7]) = 1;
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
        val is_leap =
            if year mod 100 = 0
            then
                year mod 400 = 0
            else
                year mod 4 = 0
        ;
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
                    if is_leap
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

