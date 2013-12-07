package game.play.entities.enemies.burster 
{
	import game.play.entities.enemies.behaviours.Behaviour;
	import game.play.entities.enemies.behaviours.BouncingBehaviour;
	import game.play.entities.enemies.Enemy;
	import util.Angle;
	import util.graphics.CircularEntitySprite;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Burster extends Enemy 
	{
		public static const	SPEED:Number	= 80;
		
		public function Burster(x:Number, y:Number) 
		{
			super(x, y, new BouncingBehaviour(this, SPEED));
			
			graphic = new CircularEntitySprite(this, {
				color: 0xDB721D
			});
			
			dropsGold = false;
		}
		
		override public function hit():void 
		{
			var direction:Number = Math.PI * 0.25;
			
			for (var i:int = 0; i < 4; ++i) {
				
				var burstlet:Burstlet = new Burstlet(x, y, direction);
				if (world) world.add(burstlet);
				
				direction += Math.PI * 0.5;
			}
			
			super.hit();
		}
	}

}