package game.play.entities.enemies.seeker 
{
	import flash.geom.Point;
	import game.play.entities.enemies.Enemy;
	import game.play.entities.player.Player;
	import game.play.PlayWorld;
	import util.Angle;
	import util.graphics.CircularEntitySprite;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Seeker extends Enemy
	{
		public static const	SPEED:Number					= 200,
							FRAMES_PER_PATH_CALCULATION:int	= 20;
		
		private var	_player:Player,
					_playWorld:PlayWorld,
					_pathFrame:int,
					_isFirstCheck:Boolean = true;
		
		public function Seeker(x:Number, y:Number) 
		{
			super(100, x, y);
			
			graphic = new CircularEntitySprite(this, {
				outline: 0xF05193,
				thickness: 3
			});
			
			_pathFrame = Random.intInRange(0, FRAMES_PER_PATH_CALCULATION);
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
			
			_pathFrame = (_pathFrame + 1) % FRAMES_PER_PATH_CALCULATION;
			if (_pathFrame == 0 || _isFirstCheck) {
				
				_isFirstCheck = false;
			
				var	path:Vector.<Point> = _playWorld.pathFinder.find(this, _player, ["enemy"]);
				
				var	direction:Number = Angle.between(path[0], path[1]);
				xVel = Math.cos(direction) * SPEED;
				yVel = Math.sin(direction) * SPEED;
			}			
		}
	}

}