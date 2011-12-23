Builder := Object clone
Builder depth := 0
Builder writeTabs := method(for(i,1,self depth,write("\t")))
Builder forward := method(
	args := call message arguments clone
	writeTabs
	if(args at(0) name == "curlyBrackets", write("<", call message name, " "); self doMessage(args at(0));	writeln(">"); args removeAt(0), writeln("<", call message name, ">"))
	self depth = (self depth) + 1
	args foreach(
	arg,
	content := self doMessage(arg);
	if(content type == "Sequence", writeTabs; writeln(content)))
	self depth = (self depth) - 1
	writeTabs
  writeln("</", call message name, ">"))

Builder curlyBrackets := method(
	kvmap := Map clone
	call message arguments foreach(val, if(val, kvmap atPut(val name asMutable replaceSeq("\"", ""), val next next name asMutable replaceSeq("\"", ""))) 
	kvmap foreach(k,v, write(k, "=\"", v, "\" "))))

Builder  ul(
	li({"quality": "nice"}, "Io"), 
	li({"quality": "dunno"}, "Lua"), 
	li({"quality": "ugly"}, "JavaScript"))
