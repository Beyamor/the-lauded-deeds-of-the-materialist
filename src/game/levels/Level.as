package game.levels 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Level 
	{
		public const	WIDTH:int			= 12,
						HEIGHT:int			= 12,
						INNER_WIDTH:int		= WIDTH - 2,
						INNER_HEIGHT:int	= HEIGHT - 2;
						
		protected var	_cells:Vector.<Vector.<Cell>>
		
		public function Level() 
		{
			_cells = new Vector.<Vector.<Cell>>;
			for (var x:int = 0; x < WIDTH; ++x) {
				_cells.push(new Vector.<Cell>);
				for (var y:int = 0; y < HEIGHT; ++y) {
					_cells[x].push(new Cell(x, y));
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
		
		public function get cells():Vector.<Cell> {
			
			var result:Vector.<Cell> = new Vector.<Cell>;
			for (var x:int = 0; x < WIDTH; ++x) {
				for (var y:int = 0; y < HEIGHT; ++y) {
					result.push(_cells[x][y]);
				}
			}
			
			return result;
		}
	}

}