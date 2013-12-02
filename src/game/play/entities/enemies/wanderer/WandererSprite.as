package game.play.entities.enemies.wanderer 
{
	import net.flashpunk.Entity;
	import util.graphics.CircularEntitySprite;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class WandererSprite extends CircularEntitySprite
	{
		public function WandererSprite(entity:Entity) 
		{
			super(entity, {
				outline: 0x288025,
				thickness: 3
			});
		}
		
	}

}