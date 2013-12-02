package game.play 
{
	import game.levels.Cell;
	import game.levels.Level;
	import game.play.entities.enemies.wanderer.Wanderer;
	import game.play.entities.floor.Floor;
	import game.play.entities.player.Player;
	import game.play.entities.wall.Wall;
	import net.flashpunk.Entity;
	import util.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class LevelReifier 
	{
		public var player:Player;
		
		public function LevelReifier() 
		{
			
		}
		
		public function reify(level:Level):Vector.<Entity> {
			
			var entities:Vector.<Entity>	= new Vector.<Entity>,
				freeCells:Vector.<Cell>		= new Vector.<Cell>;
			
			for each (var cell:Cell in level.cellList) {
				
				switch (cell.type) {
					
					case Cell.WALL:
						entities.push(new Wall(cell.x, cell.y));
						break;
					case Cell.EMPTY:
						entities.push(new Floor(cell.x, cell.y));
						freeCells.push(cell);
						break;
				}
			}
			
			cell = Random.any(freeCells);
			freeCells.splice(freeCells.indexOf(cell), 1);
			player = new Player((cell.x + 0.5) * Cell.WIDTH, (cell.y + 0.5) * Cell.HEIGHT);
			entities.push(player);
			
			for each (cell in freeCells) {
				
				var enemy:Entity = new Wanderer((cell.x + 0.5) * Cell.WIDTH, (cell.y + 0.5) * Cell.HEIGHT);
				entities.push(enemy);
			}
			
			return entities;
		}
	}

}