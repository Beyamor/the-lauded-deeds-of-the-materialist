package game.play.entities.enemies.burster 
{
	import game.play.entities.enemies.behaviours.BouncingBehaviour;
	import game.play.entities.enemies.Enemy;
	import util.graphics.CircularEntitySprite;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Burstlet extends Enemy 
	{
		public static const	SPEED:Number	= 30;
		
		public function Burstlet(x:Number, y:Number, direction:Number) 
		{
			super(x, y, new BouncingBehaviour(this, SPEED, direction));
			
			graphic = new CircularEntitySprite(this, {
				color: 0xE39529
			});
			
			width = height = 24;
			centerOrigin();
			
			inactiveWindow = 0.1;
		}
		
	}

}