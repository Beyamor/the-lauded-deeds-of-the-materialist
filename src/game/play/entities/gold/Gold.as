package game.play.entities.gold 
{
	import game.play.entities.PlayEntity;
	import game.play.entities.player.Player;
	import game.play.PlayWorld;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import util.Fn;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Gold extends PlayEntity 
	{
		public static const	ACCEL:Number		= 25,
							MAX_SPEED:Number	= 500;
		
		private var	_player:Player,
					_speed:Number	= 0;
		
		public function Gold(x:Number, y:Number) 
		{
			width = height = 8;
			centerOrigin();
			
			super(x, y, new GoldSprite(this));
			
			collisionHandlers = {
				player: Fn.bind(this, Fn.always(removeFromWorld))
			}			
		}
		
		override public function added():void 
		{
			super.added();
			
			if (world is PlayWorld) {
				
				_player = (world as PlayWorld).player;
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			_speed = Math.min(_speed + ACCEL, MAX_SPEED);
			
			var	dx:Number			= _player.x - x,
				dy:Number			= _player.y - y,
				direction:Number	= Math.atan2(dy, dx);
				
			xVel = Math.cos(direction) * _speed;
			yVel = Math.sin(direction) * _speed;
		}
	}

}