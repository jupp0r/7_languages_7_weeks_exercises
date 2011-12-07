def strlen (li:List[String]): Int = li.foldLeft(0)(_ + _.size ) 
