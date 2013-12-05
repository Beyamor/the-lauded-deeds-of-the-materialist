package game.play.entities.player 
{
	import game.play.entities.PlayEntity;
	import game.play.entities.shot.Shot;
	import game.play.Playthrough;
	import game.play.PlayWorld;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	import util.Fn;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends PlayEntity 
	{
		public static const	SPEED:Number				= 300,
							WIDTH:int					= 32,
							HEIGHT:int					= WIDTH;

		private var	_canShoot:Boolean	= true,
					_shotTimer:Timer;
							
		public function Player(x:Number, y:Number) 
		{
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
			
			super(x, y, new PlayerSprite(this));
			
			type = "player";
			
			collisionHandlers = {
				wall: Fn.constantly(true),
				
				enemy: function():void {
					
					if (world is PlayWorld) (world as PlayWorld).playerWasKilled();
				}
			}
			
			_shotTimer = new Timer({
				period:	0.25,
				onEnd:	Fn.bind(this, function():void {
					_canShoot = true;
				})
			});
			
			level = 50;
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
			
			if (dx != 0 || dy != 0) {
			
				speed		= SPEED;
				direction	= Math.atan2(dy, dx);
			}
			
			else {
				
				speed = 0;
			}
			
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