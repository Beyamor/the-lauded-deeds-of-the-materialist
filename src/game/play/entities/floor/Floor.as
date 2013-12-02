package game.play.entities.floor 
{
	import game.levels.Cell;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Floor extends Entity 
	{
		
		public function Floor(cellX:int, cellY:int) 
		{
			super(cellX * Cell.WIDTH, cellY * Cell.HEIGHT, new FloorSprite);
			
			width	= Cell.WIDTH;
			height	= Cell.HEIGHT;
			level	= 300;
		}
		
	}

}