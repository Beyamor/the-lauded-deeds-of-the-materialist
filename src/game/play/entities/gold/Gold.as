package game.play.entities.gold 
{
	import game.play.entities.PlayEntity;
	import game.play.entities.player.Player;
	import game.play.PlayWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.World;
	import util.Fn;
	import util.Random;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Gold extends PlayEntity 
	{
		public static const	MIN_ACCEL:Number	= 25,
							MAX_ACCEL:Number	= 50,
							MAX_SPEED:Number	= 400,
							ENTITY_VALUE:Number	= 50;
		
		private var	_player:Player,
					_accel:Number,
					_speed:Number = 0,
					_value:Number;
		
		public function Gold(x:Number, y:Number, value:Number) 
		{
			_value = value;
			
			width = height = 8;
			centerOrigin();
			
			super(x, y, new GoldSprite(this));
			
			collisionHandlers = {
				player: Fn.bind(this, function(_:Entity):void {
					
					_player.gold += value;
					removeFromWorld();
				})
			};
			
			_accel = Random.inRange(MIN_ACCEL, MAX_ACCEL);
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
			
			_speed += _accel;
			
			var	dx:Number			= _player.x - x,
				dy:Number			= _player.y - y,
				direction:Number	= Math.atan2(dy, dx);
				
			xVel = Math.cos(direction) * _speed;
			yVel = Math.sin(direction) * _speed;
		}
		
		public static function drop(world:World, x:Number, y:Number, value:Number):void {
			
			while (value > 0) {
				
				var	angle:Number	= Random.angle,
					radius:Number	= Random.inRange(5, 15),
					gold:Gold		= new Gold(
										x + Math.cos(angle) * radius,
										y + Math.sin(angle) * radius,
										Math.min(value, ENTITY_VALUE));
					
				world.add(gold);
				value -= gold._value;
			}
		}
	}

}