package game.play.entities.wall 
{
	import game.Consts;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Wall extends Entity 
	{
		public function Wall(cellX:int, cellY:int) 
		{
			super(cellX * Consts.CELL_WIDTH, cellY * Consts.CELL_HEIGHT, new WallSprite);
			
			level = 200;
		}
		
	}

}