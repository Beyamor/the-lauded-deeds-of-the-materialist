package game.play.entities.gold 
{
	import net.flashpunk.Entity;
	import util.graphics.ProgrammaticGraphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GoldSprite extends ProgrammaticGraphic 
	{
		
		public function GoldSprite(entity:Entity) 
		{
			super();
			
			center(entity.width, entity.height);
			
			_graphics.beginFill(0xF0D351, 0.8);
			_graphics.drawCircle(entity.halfWidth, entity.halfHeight, entity.halfWidth);
			_graphics.endFill();
		}
		
	}

}