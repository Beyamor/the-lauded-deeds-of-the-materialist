package game.play.entities.enemies 
{
	import game.play.entities.gold.Gold;
	import game.play.entities.PlayEntity;
	import net.flashpunk.Graphic;
	import util.Fn;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Enemy extends PlayEntity
	{
		private var	_value:int;
		
		public function Enemy(value:int, x:Number, y:Number, graphic:Graphic=null) {
			
			width = height = 48;
			centerOrigin();
			
			_value = value;
			super(x, y, graphic);
			
			collisionHandlers = {
				wall: Fn.constantly(true),
				player: Fn.constantly(true),
				enemy: Fn.constantly(true)
			}
			
			type = "enemy";
		}
		
		public function hit():void {
			
			if (world) {
				Gold.drop(world, x, y, _value);
				removeFromWorld();
			}
		}
	}
	
}