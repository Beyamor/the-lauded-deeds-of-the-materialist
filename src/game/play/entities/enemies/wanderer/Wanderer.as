package game.play.entities.enemies.wanderer 
{
	import game.levels.Level;
	import game.play.entities.enemies.Enemy;
	import util.Angle;
	import util.Random;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Wanderer extends Enemy
	{
		public static const	SPEED:Number	= 80;
		
		private var _wanderTimer:Timer;
		
		public function Wanderer(x:Number, y:Number) 
		{
			super(100, x, y);
			graphic = new WandererSprite(this);
			
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
			
			speed = SPEED;
			
			var	targetX:Number	= Random.inRange(0, Level.PIXEL_WIDTH),
				targetY:Number	= Random.inRange(0, Level.PIXEL_HEIGHT);
				
			direction = Angle.between(this, { x: targetX, y:targetY } );
		}
		
		override public function update():void 
		{
			super.update();
			
			_wanderTimer.update();
		}
	}

}