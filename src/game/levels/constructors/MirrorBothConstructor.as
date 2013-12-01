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
		
		public function MirrorBothConstructor() 
		{
			
		}
		
		/* INTERFACE game.levels.constructors.Constructor */
		
		public function construct():Level 
		{
			var	level:Level;
			
			do {
				level = new Level();
				var	numberOfWalls:int 			= Random.choice(2, 2, 3, 3, 3, 4),
					possibleWalls:Vector.<Cell>	= new Vector.<Cell>,
					walls:Vector.<Cell>			= new Vector.<Cell>
					
				for (var x:int = 1; x < Level.WIDTH / 2; ++x) {
					for (var y:int = 1; y < Level.HEIGHT / 2; ++y) {
						
						if (level.cells[x][y].type == Cell.EMPTY) possibleWalls.push(level.cells[x][y]);
					}
				}
				
				if (possibleWalls.length < numberOfWalls)
					throw new Error("Too few possible walls - " + possibleWalls.length + " for " + numberOfWalls);
					
				while (walls.length < numberOfWalls) {
					
					var	wallCell:Cell = Random.any(possibleWalls);
						
					possibleWalls.splice(possibleWalls.indexOf(wallCell), 1);
					walls.push(wallCell);
				}
				
				for each (wallCell in walls) {
					
					var	mirrorX:int	= Level.WIDTH - 1 - wallCell.x,
						mirrorY:int	= Level.HEIGHT - 1 - wallCell.y;
						
					for each (x in [wallCell.x, mirrorX]) {
						for each (y in [wallCell.y, mirrorY]) {
							level.cells[x][y].type = Cell.WALL;
						}
					}
				}
				
			} while (!level.isValid);
			
			return level;
		}
		
	}

}