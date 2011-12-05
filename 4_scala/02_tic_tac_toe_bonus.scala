class Board(var fields:List[String]) {

	var current_player = "x"

	if (fields.size == 0) {
		 fields = List(" ", " ", " ", " ", " ", " ", " ", " ", " ")
	} else {
		fields.map { field => field.toLowerCase }
	}

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

	def start() {
		while ("none" == check()) {
			move()
			current_player = if("x" == current_player) "o" else "x"
		}
		printBoard()
		if (check() == "tie") println("Tie!") else println("Winner: " + check())
	}

	def move() {
		printBoard()
		print(current_player + ": ")
		val in = readLine().toInt
		println(in)
		fields = fields.updated(in, current_player)
	}

	def printBoard() = { 
		(0 to 8).foreach( i => if((i+1) % 3 == 0) println(fields(i)) else print(fields(i))) 
	}

}
