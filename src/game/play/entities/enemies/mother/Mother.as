package game.play.entities.enemies.mother 
{
	import game.play.entities.enemies.behaviours.BouncingBehaviour;
	import game.play.entities.enemies.behaviours.StationaryBehaviour;
	import game.play.entities.enemies.Enemy;
	import net.flashpunk.Graphic;
	import util.graphics.CircularEntitySprite;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Mother extends Enemy 
	{
		public static const	SPEED:Number	= 10;
		
		public function Mother(x:Number, y:Number) 
		{
			super(x, y, new MotherBehaviour(this,
							new BouncingBehaviour(this, SPEED)));
							
			width = height = 48;
			centerOrigin();
			
			graphic = new CircularEntitySprite(this, {
				color: 0x6CC92E
			});
		}
	}

}