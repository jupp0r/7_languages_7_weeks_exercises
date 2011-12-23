# IO is strongly typed:
(1 + 1) println
# 1 + "one" <-- this fails

# 0 is true
(0 and true) println

# empty string is also true
("" and true) println

# nil is false
(nil and true) println

# slots a prototype supports
Car := Object clone
Car description := "A car"
Car drive := "Driving somewhere" println

Car drive
Car slotNames println

