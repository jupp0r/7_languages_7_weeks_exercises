trait Censor {
	def name:String
	def name_=(n:String):Unit
	def censor(dict:Map[String, String]):String = dict.foldLeft(name)((str, e) => str.replaceAll(e._1, e._2))	
}

class Book(override var name:String) extends Censor

var book = new Book("A Song of Ice and Fire")

println(book.name)

book.name = book.censor(Map("Song" -> "Bath", "Ice" -> "Butter", "Fire" -> "Corn"))

println(book.name)
