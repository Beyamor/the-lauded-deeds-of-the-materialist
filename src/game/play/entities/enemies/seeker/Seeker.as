package game.play.entities.enemies.seeker 
{
	import game.play.entities.enemies.Enemy;
	import game.play.entities.gold.Gold;
	import game.play.entities.PlayEntity;
	import game.play.entities.player.Player;
	import game.play.PlayWorld;
	import util.Angle;
	import util.Fn;
	import util.graphics.CircularEntitySprite;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Seeker extends PlayEntity implements Enemy 
	{
		public static const	SPEED:Number	= 300;
		
		private var	_player:Player;
		
		public function Seeker(x:Number, y:Number) 
		{
			width = height = 48;
			centerOrigin();
			
			super(x, y, new CircularEntitySprite(this, {
				outline: 0xF05193,
				thickness: 3
			}));
			
			type = "enemy";
			
			collisionHandlers = {
				wall: Fn.constantly(true),
				player: Fn.constantly(true),
				enemy: Fn.constantly(true)
			}
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
		
		/* INTERFACE game.play.entities.enemies.Enemy */
		
		public function hit():void 
		{
			if (world) {
				Gold.drop(world, x, y, 150);
				removeFromWorld();
			}
		}
		
	}

}