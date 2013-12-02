package game.play.entities.wall 
{
	import game.levels.Cell;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Wall extends Entity 
	{
		public function Wall(cellX:int, cellY:int) 
		{
			super(cellX * Cell.WIDTH, cellY * Cell.HEIGHT, new WallSprite);
			
			width	= Cell.WIDTH;
			height	= Cell.HEIGHT;
			level	= 200;
			type	= "wall";
		}
		
	}

}