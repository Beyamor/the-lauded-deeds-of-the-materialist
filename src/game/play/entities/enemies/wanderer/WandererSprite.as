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
				color: 0x288025
			});
		}
		
	}

}