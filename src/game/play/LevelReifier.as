package game.play 
{
	import game.levels.Cell;
	import game.levels.Level;
	import game.play.entities.wall.Wall;
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author beyamor
	 */
	public class LevelReifier 
	{
		
		public function LevelReifier() 
		{
			
		}
		
		public function reify(level:Level):Vector.<Entity> {
			
			var entities:Vector.<Entity> = new Vector.<Entity>;
			
			for each (var cell:Cell in level.cellList) {
				
				switch (cell.type) {
					
					case Cell.WALL:
						entities.push(new Wall(cell.x, cell.y));
				}
			}
			
			return entities;
		}
	}

}