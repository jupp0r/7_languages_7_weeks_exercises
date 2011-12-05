class Board(val fields:List[String]) {

	fields.map { field => field.toLowerCase }

	def check():String = {
			/* check for blank fields */
			val	blanks = fields.count( field => field == " " ) > 0

			/* nobody has won if there is still some blank spaces left */
			val win = Map() ++ List("x", "o").map ( player => (player, 
								(false /: (0 to 2)) {(chk, i) => chk || (fields(i*3) == player && fields(i*3+1) == player && fields(i*3+2) == player)} ||
								(false /: (0 to 2)) {(chk, i) => chk || (fields(i) == player && fields(i+3) == player && fields(i+6) == player)} ||
								fields(0) == "x" && fields(4) == "x" && fields(8) == "x" || 
								fields(2) == "x" && fields(4) == "x" && fields(6) == "x" ) )
			val winner = win.filter( pr => pr._2 == true)
			if(winner.size == 0) ( if(blanks) "none" else "tie" ) else winner.head._1
	}
}