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

fun month_range(day1 : int*int*int, day2 : int*int*int) =
    if day1 > day2
    then
        []
    else
        what_month(day1) :: month_range(day1+1, day2)
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
