import scala.actors._
import Actor._
import scala.xml._

case object Size
case object Links

// START:loader
class PageLoader (val url : String) {
 val source = scala.io.Source.fromURL(url).mkString
 val xml = XML.loadString(source)
 def getPageSize = source.length
 def getLinkCount = (xml \\ "a").size
}
// END:loader

val urls = List("http://www.w3.org/",
								"http://www.w3.org/html/wg/",
							  "http://lists.w3.org/Archives/Public/public-html/2010Jun/0002.html")

// START:time
def timeMethod(method: () => Unit) = {
 val start = System.nanoTime
 method()
 val end = System.nanoTime
 println("Method took " + (end - start)/1000000000.0 + " seconds.")
}
// END:time

// START:sequential
def getPageSizeSequentially() = {
 for(url <- urls) {
	 val pl = new PageLoader(url)
   println("Size for " + url + ": " + pl.getPageSize)
	 println("Links found on " + url + ": " + pl.getLinkCount)
 }
}
// END:sequential

// START:concurrent
def getPageSizeConcurrently() = {
 val caller = self

 for(url <- urls) {
   actor { 
		 val pl = new PageLoader(url)
		 caller ! (url, Size, pl.getPageSize)
		 caller ! (url, Links, pl.getLinkCount)
	 }
 }

 for(i <- 1 to 2*urls.size) {
   receive {
     case (url, Size, size) => {
       println("Size for " + url + ": " + size)
		 }
		 case (url, Links, num) => {
			 println("Links found on " + url + ": " + num)
		 }
	 }
 }
}
// END:concurrent

// START:script
println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }
// END:script
