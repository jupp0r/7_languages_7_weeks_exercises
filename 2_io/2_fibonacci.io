fib_rec := method(i, if(i == 1 or i == 2, return 1); fib_rec(i-2) + fib_rec (i-1))
fib_it := method(i, inc_1 := 1; inc_2 := 1; for(k, 3, i, temp := inc_2; inc_2 = inc_1 + inc_2; inc_1 = temp); inc_2 )

fib_it(1) println
fib_rec(1) println
fib_it(4) println
fib_rec(4) println
fib_it(12) println
fib_rec(12) println
