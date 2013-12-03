package game.levels 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Level 
	{
		public static const	INNER_WIDTH:int		= 10,
							INNER_HEIGHT:int	= 8,
							WIDTH:int			= INNER_WIDTH + 2,
							HEIGHT:int			= INNER_HEIGHT + 2,
							PIXEL_WIDTH:int		= WIDTH * Cell.WIDTH,
							PIXEL_HEIGHT:int	= HEIGHT * Cell.HEIGHT;
						
		private var	_cells:Vector.<Vector.<Cell>>,
					_cellList:Vector.<Cell>;
		
		public function Level() 
		{
			_cells		= new Vector.<Vector.<Cell>>;
			_cellList	= new Vector.<Cell>;
			for (var x:int = 0; x < WIDTH; ++x) {
				_cells.push(new Vector.<Cell>);
				for (var y:int = 0; y < HEIGHT; ++y) {
					
					var cell:Cell = new Cell(this, x, y);
					_cells[x].push(cell);
					_cellList.push(cell);
				}
			}
			
			for (x = 0; x < WIDTH; ++x) {
				_cells[x][0].type			= Cell.WALL;
				_cells[x][HEIGHT - 1].type	= Cell.WALL;
			}
			
			for (y = 0; y < HEIGHT; ++y) {
				
				_cells[0][y].type			= Cell.WALL;
				_cells[WIDTH - 1][y].type	= Cell.WALL;
			}
		}
		
		public function get cellList():Vector.<Cell> {
			
			return _cellList;
		}
		
		public function get cells():Vector.<Vector.<Cell>> {
			
			return _cells;
		}
		
		public function get isValid():Boolean {
			
			return allEmptyCellsAreReachable;
		}
		
		private function get allEmptyCellsAreReachable():Boolean {
			
			var	reachedCells:Vector.<Cell>		= new Vector.<Cell>,
				nextCells:Vector.<Cell>			= new Vector.<Cell>,
				unreachedCells:Vector.<Cell>	= new Vector.<Cell>;
				
			for each (var cell:Cell in cellList) {
				
				if (cell.type == Cell.EMPTY) unreachedCells.push(cell);
			}
			
			if (unreachedCells.length == 0) return true;
			
			nextCells.push(unreachedCells.pop());
			while (unreachedCells.length != 0) {
				
				if (nextCells.length == 0) return false;
				
				var nextCell:Cell		= nextCells.pop(),
					unreachedIndex:int	= unreachedCells.indexOf(nextCell);
					
				reachedCells.push(nextCell);
				unreachedCells.splice(unreachedIndex, 1);
				for each (var neighbouringCell:Cell in nextCell.neighbours) {
					
					if (neighbouringCell.type != Cell.EMPTY) continue;
					if (nextCells.indexOf(neighbouringCell) != -1) continue;
					if (reachedCells.indexOf(neighbouringCell) != -1) continue;
					
					nextCells.push(neighbouringCell);
				}
			}
			
			return true;
		}
	}

}