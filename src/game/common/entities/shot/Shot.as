package game.common.entities.shot 
{
	import game.common.entities.PlayEntity;
	import game.common.entities.wall.Wall;
	import game.levels.Level;
	import game.Main;
	import game.play.entities.enemies.Enemy;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Shot extends PlayEntity 
	{
		public static const	SPEED:Number	= 500,
							WIDTH:int		= 16,
							HEIGHT:int		= WIDTH;
							
		private var	vx:Number,
					vy:Number;
		
		public function Shot(x:Number, y:Number, direction:Number) 
		{
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
			
			super(x, y, new ShotSprite(this));
			
			xVel = Math.cos(direction) * SPEED;
			yVel = Math.sin(direction) * SPEED;
			
			var that:Shot = this;
			
			collisionHandlers = {
				
				wall: function(wall:Wall):Boolean {
					that.removeFromWorld();
					return true;
				},
				
				enemy: function(enemy:Enemy):Boolean {
					
					that.removeFromWorld();
					(enemy as Enemy).hit();
					return true;
				}
			};
			
			type	= "shot";
			level	= 80;
		}
	}

}