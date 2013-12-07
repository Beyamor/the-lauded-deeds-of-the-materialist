package game.play.entities.enemies.behaviours 
{
	import game.common.entities.wall.Wall;
	import game.play.entities.enemies.Enemy;
	import util.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class BouncingBehaviour extends Behaviour 
	{
		private var	_speed:Number,
					_prevWallHandler:Function,
					_direction:Number,
					_directionProvided:Boolean;
		
		public function BouncingBehaviour(enemy:Enemy, speed:Number, direction:Number=Infinity) 
		{
			super(enemy);
			
			_speed = speed;
			
			if (direction != Infinity) {
				
				_direction			= direction;
				_directionProvided	= true;
			}
		}
		
		override public function start():void 
		{
			enemy.speed		= _speed;
			enemy.direction	= _directionProvided? _direction : Random.angle;
			
			_prevWallHandler = enemy.collisionHandlers['wall'];
			enemy.collisionHandlers['wall'] = function(wall:Wall):Boolean {
				
				var	dx:Number	= wall.centerX - enemy.x,
					dy:Number	= wall.centerY - enemy.y;
					
				if (Math.abs(dx) > Math.abs(dy))	enemy.xVel *= -1;
				else								enemy.yVel *= -1;
				
				return true;
			}
		}
		
		override public function end():void 
		{
			super.end();
			
			enemy.collisionHandlers['wall'] = _prevWallHandler;
		}
	}

}