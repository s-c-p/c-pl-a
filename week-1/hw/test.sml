use "code.sml";

val dates =
    [ (2017, 11, 9)
    , (2017, 11, 10)
    , (2017, 10, 9)
    , (2016, 11, 16)
    , (2017, 6, 30)
    ]
;

val test1 = is_older ( (1947,8,15), (1947,8,15) ) = false;
val test2 = is_older ( (1947,8,15), (1947,8,16) ) = true;

val test3 = number_in_month ( dates, 11 ) = 3;
val test4 = number_in_month ( dates, 10 ) = 1;
val test5 = number_in_month ( dates, 5 ) = 0;

val test6 = number_in_months ( dates, [11, 10] ) = 4;
val test7 = number_in_months ( dates, [10, 6] ) = 2;
val test8 = number_in_months ( dates, [5] ) = 0;

val test9 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test10 = dates_in_month (dates, 11) = [(2017, 11, 9), (2017, 11, 10), (2016, 11, 16)];

val test11 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test12 = dates_in_months (dates, [6,11,10]) = dates;

val test13 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there";

val test14 = date_to_string (2013, 6, 1) = "June 1, 2013";

val test15 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3;

val test16 = what_month 70 = 3;

val test17 = month_range (31, 34) = [1,2,2,2];

val test18 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31);

