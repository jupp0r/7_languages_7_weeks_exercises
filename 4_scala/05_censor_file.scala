val censorship = new scala.collection.mutable.HashMap[String, String]()

for (line <- io.Source.fromFile("words.txt").getLines) {
	val tokens = line.split("\\s+")
	val key = tokens(0).trim
	val value = tokens(1).trim
	censorship += (key -> value)
}

trait Censor {
	def name:String
	def name_=(n:String):Unit
	def censor(dict:scala.collection.immutable.HashMap[String, String]):String = dict.foldLeft(name)((str, e) => str.replaceAll(e._1, e._2))	
}

class Book(override var name:String) extends Censor

var book = new Book("A Song of Ice and Fire")

println(book.name)

book.name = book.censor(new scala.collection.immutable.HashMap[String, String]() ++ censorship)

println(book.name)
