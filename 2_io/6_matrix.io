Matrix := Object clone

Matrix data := List clone

Matrix dim := method(x,y, data setSize(x); for(i,0,x-1, self data atInsert(i, List clone); self data at(i) setSize(y)); for(i,0,x-1,for(j,0,y-1,self set(i,j,0))))
Matrix set := method(x,y,val, self data at(x) atInsert(y,val))
Matrix get := method(x,y, self data at(x) at(y))

Matrix transpose := method(x := self clone; x get := method(x,y,super(get(y,x))); x)

myMat := Matrix clone

myMat dim(2,2)
myMat get(0,0) println
myMat set(1,0,1)
myMat get(1,0) println
myMat transpose get(0,1) println
0

