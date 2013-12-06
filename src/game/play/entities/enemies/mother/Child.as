package game.play.entities.enemies.mother 
{
	import game.play.entities.enemies.Enemy;
	import util.graphics.CircularEntitySprite;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Child extends Enemy 
	{
		
		public function Child(x:Number, y:Number) 
		{
			super(x, y);
			
			width = height = 24;
			centerOrigin();
			
			graphic = new CircularEntitySprite(this, {
				color: 0xA68F5B
			});
			
			boostsMultipier  = false;
		}
		
	}

}