package game.levels.constructors 
{
	import game.levels.Cell;
	import game.levels.Level;
	import util.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class MirrorBothConstructor implements Constructor 
	{
		private static const NEIGHBOURING_WALL_WEIGHTS:Object = {
			0: 1,
			1: 10,
			2: 0,
			3: 0,
			4: 0
		}
		
		public function MirrorBothConstructor() 
		{
			
		}
		
		/* INTERFACE game.levels.constructors.Constructor */
		
		public function construct():Level 
		{
			var	level:Level;
			
			do {
				try {
					level = new Level();
					var	numberOfWalls:int 			= Random.choice(2, 2, 2, 3, 3, 4),
						emptyCells:Vector.<Cell>	= new Vector.<Cell>,
						walls:Vector.<Cell>			= new Vector.<Cell>,
						possibleWalls:Vector.<Cell>;
						
					for (var x:int = 2; x < Level.WIDTH / 2; ++x) {
						for (var y:int = 2; y < Level.HEIGHT / 2; ++y) {
							
							if (level.cells[x][y].isEmpty) emptyCells.push(level.cells[x][y]);
						}
					}
					
					if (emptyCells.length < numberOfWalls)
						throw new Error("Too few possible walls - " + emptyCells.length + " for " + numberOfWalls);
						
					while (walls.length < numberOfWalls) {
						
						possibleWalls = new Vector.<Cell>;
						for each (var emptyCell:Cell in emptyCells) {
							
							var	neighbouringWalls:int			= 0,
								neighbouringDiagonalWalls:int	= 0,
								touchingEdge:Boolean			= false;
								
							for each (var neighbouringCell:Cell in emptyCell.neighbours) {
								if (neighbouringCell.isWall)
									++neighbouringWalls;
									
								if (neighbouringCell.isEdgeCell)
									touchingEdge = true;
							}
							
							for each (neighbouringCell in emptyCell.diagonalNeighbours) {
								if (neighbouringCell.isWall)
									++neighbouringDiagonalWalls;
							}
							
							// walls touching at the diagonals looks awful
							if (neighbouringWalls == 0 && neighbouringDiagonalWalls != 0) continue;
							
							for (var weighter:int = 0; weighter < NEIGHBOURING_WALL_WEIGHTS[neighbouringWalls]; ++weighter) {
								possibleWalls.push(emptyCell);
							}
						}
						
						if (possibleWalls.length == 0)
							throw new Error("No possible walls");
						
						var	wallCell:Cell = Random.any(possibleWalls);
							
						emptyCells.splice(emptyCells.indexOf(wallCell), 1);
						walls.push(wallCell);
						
						var	mirrorX:int	= Level.WIDTH - 1 - wallCell.x,
							mirrorY:int	= Level.HEIGHT - 1 - wallCell.y;
							
						for each (x in [wallCell.x, mirrorX]) {
							for each (y in [wallCell.y, mirrorY]) {
								level.cells[x][y].isWall = true;
							}
						}
					}
				}
				catch (e:Error) {
					continue;
				}
				
			} while (!level.isValid);
			
			return level;
		}
		
	}

}