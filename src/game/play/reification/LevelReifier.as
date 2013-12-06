package game.play.reification 
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
	import game.play.playthrough.Playthrough;
	import net.flashpunk.Entity;
	import util.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class LevelReifier 
	{
		protected var	_playthrough:Playthrough;
		
		public function LevelReifier(playthough:Playthrough) 
		{
			_playthrough = playthough;
		}
		
		public function reify(level:Level):Vector.<Entity> {
			
			var entities:Vector.<Entity>	= new Vector.<Entity>,
				freeCells:Vector.<Cell>		= new Vector.<Cell>;
			
			for each (var cell:Cell in level.cellList) {
				
				if (cell.isWall) {
						entities.push(new Wall(cell.x, cell.y));
				}
				else {
						entities.push(new Floor(cell.x, cell.y, floorPalette));
						freeCells.push(cell);
				}
			}
			
			return entities;
		}
		
		protected function get floorPalette():Array {
			
			return _playthrough.regularFloorPalettes.current;
		}
	}

}