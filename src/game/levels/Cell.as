package game.levels 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Cell 
	{
		public static const	WIDTH:int		= 64,
							HEIGHT:int		= WIDTH;
							
		public var	type:String,
					x:int,
					y:int,
					isEdgeCell:Boolean,
					isWall:Boolean;
					
		private var	_level:Level;
		
		public function Cell(level:Level, x:int, y:int) 
		{
			_level	= level;
			this.x	= x;
			this.y	= y;
			isWall	= false;
			
			isEdgeCell = (x == 0) || (y == 0) || (x == Level.WIDTH - 1) || (y == Level.HEIGHT - 1);
		}
		
		public function get isEmpty():Boolean {
			
			return !isWall;
		}
		
		private function get hasWestNeighbours():Boolean { return x > 0; }
		private function get hasNorthNeighbours():Boolean { return y > 0; }
		private function get hasEastNeighbours():Boolean { return x < Level.WIDTH - 1; }
		private function get hasSouthNeighbours():Boolean { return y < Level.HEIGHT - 1; }
		
		
		public function get neighbours():Vector.<Cell> {
			
			var result:Vector.<Cell> = new Vector.<Cell>;
			
			if (hasWestNeighbours)	result.push(_level.cells[x - 1][y]);
			if (hasNorthNeighbours)	result.push(_level.cells[x][y - 1]);
			if (hasEastNeighbours)	result.push(_level.cells[x + 1][y]);
			if (hasSouthNeighbours)	result.push(_level.cells[x][y + 1]);
			
			return result;
		}
		
		public function get diagonalNeighbours():Vector.<Cell> {
			
			var result:Vector.<Cell> = new Vector.<Cell>;
			
			if (hasNorthNeighbours) {
				if (hasWestNeighbours)	result.push(_level.cells[x - 1][y - 1]);
				if (hasEastNeighbours)	result.push(_level.cells[x + 1][y - 1]);
			}
			
			if (hasSouthNeighbours) {
				if (hasWestNeighbours)	result.push(_level.cells[x - 1][y + 1]);
				if (hasEastNeighbours)	result.push(_level.cells[x + 1][y + 1]);
			}
			
			return result;
		}
	}

}