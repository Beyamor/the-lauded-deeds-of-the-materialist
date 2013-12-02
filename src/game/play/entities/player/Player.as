package game.play.entities.player 
{
	import game.play.entities.PlayEntity;
	import game.play.entities.shot.Shot;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import util.Fn;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends PlayEntity 
	{
		public static const	SPEED:Number	= 400,
							WIDTH:int		= 48,
							HEIGHT:int		= 48;

		private var	_canShoot:Boolean	= true,
					_shotTimer:Timer;
		
		public var	gold:int	= 0;
							
		public function Player(x:Number, y:Number) 
		{
			super(x, y, new PlayerSprite());
			
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
			
			type = "player";
			
			collisionHandlers = {
				wall: Fn.constantly(true),
				enemy: Fn.constantly(true)
			}
			
			_shotTimer = new Timer({
				period:	0.25,
				callback: Fn.bind(this, function():void {
					_canShoot = true;
				})
			});
		}
		
		override public function update():void 
		{
			super.update();
			
			var	dx:Number, dy:Number;
			
			// moving
			dx = dy = 0;
			if (Input.check("move-up"))		dy -= 1;
			if (Input.check("move-down"))	dy += 1;
			if (Input.check("move-left"))	dx -= 1;
			if (Input.check("move-right"))	dx += 1;
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			xVel = dx * SPEED;
			yVel = dy * SPEED;
			
			// shooting
			dx = dy = 0;
			var tryingToShoot:Boolean = false;
			if (Input.check("shoot-up"))	{ dy -= 1; tryingToShoot = true; }
			if (Input.check("shoot-down"))	{ dy += 1; tryingToShoot = true; }
			if (Input.check("shoot-left"))	{ dx -= 1; tryingToShoot = true; }
			if (Input.check("shoot-right"))	{ dx += 1; tryingToShoot = true; }
			
			
			if (tryingToShoot && _canShoot) {
				
				if (dx != 0 && dy != 0) {
					
					dx *= Math.SQRT1_2;
					dy *= Math.SQRT1_2;
				}
				
				world.add(new Shot(x, y, Math.atan2(dy, dx)));
				_canShoot = false;
				_shotTimer.restart();
			}
			
			_shotTimer.update();
		}
	}

}