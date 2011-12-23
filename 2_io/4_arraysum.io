arraysum := method(ar, asum := 0; for(i, 0, (ar size) - 1, asum = asum + ((ar at(i)) sum)); asum)

arraysum(list(list(1,1,1),list(1,1,1),list(2,2,20))) println

0