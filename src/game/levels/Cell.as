package game.levels 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Cell 
	{
		public static const	EMPTY:String	= "empty",
							WALL:String		= "wall";
							
		public var	type:String,
					x:int,
					y:int;
		
		public function Cell(x:int, y:int) 
		{
			this.x	= x;
			this.y	= y;
			type	= EMPTY;
		}
		
	}

}