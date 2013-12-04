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
							ENTITY_VALUE:Number	= 50,
							SEEK_RANGE:Number	= 50,
							SEEK_RANGE2:Number	= SEEK_RANGE * SEEK_RANGE;
		
		private var	_player:Player,
					_playWorld:PlayWorld,
					_accel:Number,
					_speed:Number = 0,
					_value:Number,
					_isSeeking:Boolean = false;
		
		public function Gold(x:Number, y:Number, value:Number) 
		{
			_value = value;
			
			width = height = 8;
			centerOrigin();
			
			super(x, y, new GoldSprite(this));
			
			collisionHandlers = {
				player: Fn.bind(this, function():void {
					
					_player.gold += value * _playWorld.multiplier.value;
					removeFromWorld();
				}),
				
				wall: Fn.constantly(true)
			};
			
			_accel = Random.inRange(MIN_ACCEL, MAX_ACCEL);
			
			level = 100;
		}
		
		override public function added():void 
		{
			super.added();
			
			if (world is PlayWorld) {
				
				_playWorld	= (world as PlayWorld);
				_player		= _playWorld.player;
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			var	dx:Number			= _player.x - x,
				dy:Number			= _player.y - y;
					
			
			if (!_isSeeking) {
				
				var	distance:Number		= dx * dx + dy * dy,
					closeEnough:Boolean	= distance <= SEEK_RANGE2;
					
				_isSeeking = closeEnough;
			}
			
			else {
				
				speed		= Math.min(speed + _accel, MAX_SPEED);
				direction	= Math.atan2(dy, dx);
			}
		}
		
		public static function drop(world:World, x:Number, y:Number, value:Number):void {
			
			while (value > 0) {
				
				var	angle:Number	= Random.angle,
					radius:Number	= Random.inRange(10, 15),
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