package game.play.entities.enemies.behaviours 
{
	import flash.geom.Point;
	import game.common.entities.player.Player;
	import game.play.entities.enemies.Enemy;
	import game.play.PlayWorld;
	import util.Angle;
	/**
	 * ...
	 * @author beyamor
	 */
	public class SeekingBehaviour extends Behaviour 
	{
		public static const	FRAMES_PER_PATH_CALCULATION:int	= 20;
		
		private var	_speed:Number,
					_player:Player,
					_world:PlayWorld,
					_pathFrame:int,
					_destination:Point;
		
		public function SeekingBehaviour(enemy:Enemy, speed:Number) 
		{
			super(enemy);
			
			_speed = speed;
		}
		
		override public function start():void 
		{
			super.start();
			
			if (enemy.world is PlayWorld) {
				
				_world			= (enemy.world as PlayWorld);
				_player			= _world.player;
				_destination	= new Point(_player.x, _player.y);
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			_pathFrame = (_pathFrame + 1) % FRAMES_PER_PATH_CALCULATION;
			if (_pathFrame == 0) {
			
				var	path:Vector.<Point> = _world.pathFinder.find(enemy, _player, ["enemy"]);
				_destination = path[1];
			}
			
			enemy.speed		= _speed;
			enemy.direction	= Angle.between(enemy, _destination);
		}
	}

}