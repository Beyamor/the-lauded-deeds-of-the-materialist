package game.play.entities.enemies.wanderer 
{
	import game.levels.Level;
	import game.play.entities.enemies.Enemy;
	import game.play.entities.gold.Gold;
	import game.play.entities.PlayEntity;
	import util.Fn;
	import util.Random;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Wanderer extends PlayEntity implements Enemy
	{
		public static const	SPEED:Number	= 300;
		
		private var _wanderTimer:Timer;
		
		public function Wanderer(x:Number, y:Number) 
		{
			width = height = 48;
			centerOrigin();
			
			super(x, y, new WandererSprite(this));
			
			type = "enemy";
			
			collisionHandlers = {
				wall: Fn.constantly(true),
				player: Fn.constantly(true),
				enemy: Fn.constantly(true)
			}
			
			var that:Wanderer = this;
			_wanderTimer = new Timer( {
				period: Random.inRange(1, 2),
				loops: true,
				callback: function():void {
					that.wander();
					_wanderTimer.period = Random.inRange(1, 2);
				}
			});
			wander();
		}
		
		private function wander():void {
			
			var	targetX:Number	= Random.inRange(0, Level.PIXEL_WIDTH),
				targetY:Number	= Random.inRange(0, Level.PIXEL_HEIGHT),
				dx:Number		= targetX - x,
				dy:Number		= targetY - y,
				theta:Number	= Math.atan2(dy, dx);
				
			xVel = Math.cos(theta) * SPEED;
			yVel = Math.sin(theta) * SPEED;
		}
		
		override public function update():void 
		{
			super.update();
			
			_wanderTimer.update();
		}
		
		public function hit():void {
			
			world.add(new Gold(x, y));
			removeFromWorld();
		}
	}

}