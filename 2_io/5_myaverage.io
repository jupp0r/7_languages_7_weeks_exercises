List myAverage := method(asum := 0; for(i, 0, (self size) - 1, if(self at(i) type asString != "Number", Exception raise ("Not a number in list at " .. i), asum = asum + self at(i))); asum/(self size))

(list(2, 3, 4, 5) myAverage) println
(list(2, 3, nil, 5) myAverage) println
