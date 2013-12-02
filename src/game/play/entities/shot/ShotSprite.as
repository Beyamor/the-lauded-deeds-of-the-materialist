package game.play.entities.shot 
{
	import net.flashpunk.Entity;
	import util.graphics.CircularEntitySprite;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ShotSprite extends CircularEntitySprite 
	{
		
		public function ShotSprite(entity:Entity) 
		{
			super(entity, {
				outline: 0x202060,
				thickness: 3
			});
		}
		
	}

}