package game.play.entities.enemies.wanderer 
{
	import game.play.entities.enemies.Enemy;
	import game.play.entities.PlayEntity;
	import util.Fn;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Wanderer extends PlayEntity implements Enemy
	{
		
		public function Wanderer(x:Number, y:Number) 
		{
			width = height = 48;
			centerOrigin();
			
			super(x, y, new WandererSprite(this));
			
			type = "enemy";
			
			collisionHandlers = {
				wall: Fn.constantly(true),
				player: Fn.constantly(true)
			}
		}
		
		public function hit():void {
			
			removeFromWorld();
		}
	}

}