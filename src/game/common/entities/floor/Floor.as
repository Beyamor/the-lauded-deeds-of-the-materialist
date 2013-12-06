package game.common.entities.floor 
{
	import game.common.playthrough.palettes.Palette;
	import game.levels.Cell;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Floor extends Entity 
	{
		
		public function Floor(cellX:int, cellY:int, palette:Palette) 
		{
			super(cellX * Cell.WIDTH, cellY * Cell.HEIGHT, new FloorSprite(palette));
			
			width	= Cell.WIDTH;
			height	= Cell.HEIGHT;
			level	= 200;
		}
		
	}

}