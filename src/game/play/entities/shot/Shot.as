package game.play.entities.shot 
{
	import game.levels.Level;
	import game.Main;
	import game.play.entities.enemies.Enemy;
	import game.play.entities.PlayEntity;
	import game.play.entities.wall.Wall;
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
							HEIGHT:int		= 16;
							
		private var	vx:Number,
					vy:Number;
		
		public function Shot(x:Number, y:Number, direction:Number) 
		{
			super(x, y, new ShotSprite());
			
			xVel = Math.cos(direction) * SPEED;
			yVel = Math.sin(direction) * SPEED;
			
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
			
			var that:Entity = this;
			
			collisionHandlers = {
				
				wall: function(wall:Wall):Boolean {
					if (that.world) that.world.remove(that);
					return true;
				},
				
				enemy: function(enemy:Entity):Boolean {
					
					if (that.world) that.world.remove(that);
					(enemy as Enemy).hit();
					return true;
				}
			};
		}
	}

}