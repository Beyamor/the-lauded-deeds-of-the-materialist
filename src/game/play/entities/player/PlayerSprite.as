package game.play.entities.player 
{	
	import net.flashpunk.Entity;
	import util.graphics.CircularEntitySprite;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerSprite extends CircularEntitySprite 
	{		
		public function PlayerSprite(entity:Entity) 
		{
			super(entity, {
				color: 0x404040
			});
		}
	}

}