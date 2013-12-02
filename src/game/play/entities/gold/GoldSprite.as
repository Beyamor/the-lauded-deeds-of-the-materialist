package game.play.entities.gold 
{
	import net.flashpunk.Entity;
	import util.graphics.CircularEntitySprite;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GoldSprite extends CircularEntitySprite 
	{
		
		public function GoldSprite(entity:Entity) 
		{
			super(entity, {
				color: 0xF0D351,
				alpha: 0.8
			});
		}
		
	}

}