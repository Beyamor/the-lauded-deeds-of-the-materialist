package game.levels 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Cell 
	{
		public static const	EMPTY:String	= "empty",
							WALL:String		= "wall",
							WIDTH:int		= 64,
							HEIGHT:int		= 64;
							
		public var	type:String,
					x:int,
					y:int;
					
		private var	_level:Level;
		
		public function Cell(level:Level, x:int, y:int) 
		{
			_level	= level;
			this.x	= x;
			this.y	= y;
			type	= EMPTY;
		}
		
		public function get neighbours():Vector.<Cell> {
			
			var result:Vector.<Cell> = new Vector.<Cell>;
			
			if (x > 0)					result.push(_level.cells[x - 1][y]);
			if (y > 0)					result.push(_level.cells[x][y - 1]);
			if (x < Level.WIDTH - 1)	result.push(_level.cells[x + 1][y]);
			if (y < Level.HEIGHT - 1)	result.push(_level.cells[x][y + 1]);
			
			return result;
		}
	}

}