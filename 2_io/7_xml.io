Builder := Object clone
Builder depth := 0
Builder writeTabs := method(for(i,1,self depth,write("\t")))
Builder forward := method(
	writeTabs
  writeln("<", call message name, ">")
	self depth = (self depth) + 1
	call message arguments foreach(
	arg, 
	content := self doMessage(arg);
	if(content type == "Sequence", writeTabs; writeln(content)))
	self depth = (self depth) - 1
	writeTabs
  writeln("</", call message name, ">"))

Builder  ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))
