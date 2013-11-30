package game.play.entities.player 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends Entity 
	{
		
		public function Player(x:Number, y:Number) 
		{
			super(x, y, new PlayerSprite());
			
			width = height = 48;
		}
		
	}

}