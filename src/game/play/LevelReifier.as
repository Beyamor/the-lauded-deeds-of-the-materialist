package game.play 
{
	import flash.geom.Point;
	import game.levels.Cell;
	import game.levels.Level;
	import game.play.entities.enemies.seeker.Seeker;
	import game.play.entities.enemies.wanderer.Wanderer;
	import game.play.entities.floor.Floor;
	import game.play.entities.floor.FloorSprite;
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
		public var	initialPlayerPosition:Point;
		
		public function LevelReifier() 
		{
			
		}
		
		public function reify(level:Level):Vector.<Entity> {
			
			FloorSprite.changeToNextPalette();
			
			var entities:Vector.<Entity>	= new Vector.<Entity>,
				freeCells:Vector.<Cell>		= new Vector.<Cell>;
			
			for each (var cell:Cell in level.cellList) {
				
				if (cell.isWall) {
						entities.push(new Wall(cell.x, cell.y));
				}
				else {
						entities.push(new Floor(cell.x, cell.y));
						freeCells.push(cell);
				}
			}
			
			initialPlayerPosition = new Point((Level.CENTER_X + 0.5) * Cell.WIDTH, (Level.CENTER_Y + 0.5) * Cell.HEIGHT);
			
			return entities;
		}
	}

}