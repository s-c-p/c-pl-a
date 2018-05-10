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

