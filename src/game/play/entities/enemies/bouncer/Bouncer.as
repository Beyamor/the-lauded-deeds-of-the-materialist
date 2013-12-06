package game.play.entities.enemies.bouncer 
{
	import game.common.entities.wall.Wall;
	import game.levels.Cell;
	import game.play.entities.enemies.Enemy;
	import net.flashpunk.Graphic;
	import util.graphics.CircularEntitySprite;
	import util.Random;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Bouncer extends Enemy 
	{
		public static const	SPEED:int	= 50;
		
		private var	_alreadyBounced:Boolean;
		
		public function Bouncer(x:Number, y:Number) 
		{			
			super(x, y);
			graphic = new CircularEntitySprite(this, {
				color:	0x69D9F0
			});
		}
		
		override protected function onActivation():void 
		{
			super.onActivation();
			
			speed		= SPEED;
			direction	= Random.angle;
			
			collisionHandlers['wall'] = function(wall:Wall):Boolean {
				
				if (_alreadyBounced) return true;
				
				var	dx:Number	= wall.centerX - x,
					dy:Number	= wall.centerY - y;
					
				if (Math.abs(dx) > Math.abs(dy))	xVel *= -1;
				else								yVel *= -1;
				
				_alreadyBounced = true;
				
				return true;
			}
		}
		
		override public function update():void 
		{
			_alreadyBounced = false; // kind of hack but whatever
			super.update();
		}
	}

}