package game.play.entities.enemies.mother 
{
	import game.play.entities.enemies.behaviours.SeekingBehaviour;
	import game.play.entities.enemies.Enemy;
	import util.graphics.CircularEntitySprite;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Child extends Enemy 
	{
		public static const	SPEED:Number	= 40;
		
		public function Child(x:Number, y:Number) 
		{
			super(x, y, new SeekingBehaviour(this, SPEED));
			
			width = height = 24;
			centerOrigin();
			
			graphic = new CircularEntitySprite(this, {
				color: 0x80E83A
			});
			
			boostsMultipier	= false;
			inactiveWindow	= 0.1;
		}
		
	}

}