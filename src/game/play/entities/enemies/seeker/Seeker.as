package game.play.entities.enemies.seeker 
{
	import game.play.entities.enemies.Enemy;
	import game.play.entities.player.Player;
	import game.play.PlayWorld;
	import util.Angle;
	import util.graphics.CircularEntitySprite;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Seeker extends Enemy
	{
		public static const	SPEED:Number	= 300;
		
		private var	_player:Player;
		
		public function Seeker(x:Number, y:Number) 
		{
			super(100, x, y);
			
			graphic = new CircularEntitySprite(this, {
				outline: 0xF05193,
				thickness: 3
			});
		}
		
		override public function added():void 
		{
			super.added();
			
			if (world is PlayWorld) _player = (world as PlayWorld).player;
		}
		
		override public function update():void 
		{
			super.update();
			
			var	direction:Number = Angle.between(this, _player);
			xVel = Math.cos(direction) * SPEED;
			yVel = Math.sin(direction) * SPEED;
			
		}		
	}

}