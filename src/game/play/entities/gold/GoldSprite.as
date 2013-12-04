package game.play.entities.gold 
{
	import net.flashpunk.Entity;
	import util.graphics.CircularEntitySprite;
	import util.graphics.ProgrammaticGraphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GoldSprite extends ProgrammaticGraphic 
	{
		
		public function GoldSprite(entity:Entity) 
		{
			_graphics.beginFill(0xD6A742);
			_graphics.drawRect(0, 0, entity.width, entity.height);
			_graphics.endFill();
			
			center(entity.width, entity.height);
		}
		
	}

}